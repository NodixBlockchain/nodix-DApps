#include <base/std_def.h>
#include <base/std_mem.h>
#include <base/mem_base.h>
#include <base/std_str.h>

#include <strs.h>
#include <fsio.h>
#include <tree.h>


#include <crypto.h>

#include "../block_adx/block_api.h"

#define NODE_BLOG_MESSAGE	0x1e000005
#define NODE_BLOG_ACCOUNT	0x1e000004
#define NODE_BLOG_CAT		0x1e000003
#define NODE_BLOG_POST		0x1e000002

C_EXPORT mod_name_decoration_t	 mod_name_deco_type = MOD_NAME_DECO;
C_EXPORT int _fltused = 1;


int blog_get_account(btc_addr_t oaddr, struct string *accStr)
{
	mem_zone_ref	objs = { PTR_NULL }, oacc = { PTR_NULL };
	int				ret;

	tree_manager_create_node("list", NODE_JSON_ARRAY, &objs);

	ret = get_app_obj_addr("blog", NODE_BLOG_ACCOUNT, oaddr, &objs);

	if (ret)ret = tree_manager_get_child_at(&objs, 0, &oacc);
	if (ret)ret = tree_manager_get_child_value_istr(&oacc, NODE_HASH("name"), accStr, 0);

	release_zone_ref(&oacc);
	release_zone_ref(&objs);

	return ret;
}

OS_API_C_FUNC(int) blog_get_ncats(mem_zone_ref_ptr nNum)
{
	int num;
	num = get_app_type_nobjs("blog", NODE_BLOG_CAT);

	tree_manager_write_node_dword(nNum, 0, num);

	return 1;
}

OS_API_C_FUNC(int) blog_get_cat_posts(mem_zone_ref_ptr cat_obj, mem_zone_ref_ptr posts)
{
	char				catHash[65], rcatHash[65];
	mem_zone_ref		my_list = { PTR_NULL }, post_list = { PTR_NULL };
	mem_zone_ref_ptr	post =PTR_NULL;
	size_t				count,first,n;

	tree_remove_children		(posts);
	
	tree_manager_get_child_value_str(cat_obj, NODE_HASH("cat_id"), rcatHash, 65, 0);
	
	if (!tree_manager_get_child_value_i32(cat_obj, NODE_HASH("first"), &first))
		first = 0;

	

	for (n = 0; n < 32; n++)
	{
		catHash[n * 2 + 0] = rcatHash[(31 - n) * 2 + 0];
		catHash[n * 2 + 1] = rcatHash[(31 - n) * 2 + 1];
	}
	catHash[64] = 0;

	tree_manager_add_child_node			(posts, "list", NODE_JSON_ARRAY, &post_list);
	
	load_obj_childs						("blog", catHash, "posts", first, 10, 1,&count, &post_list);

	tree_manager_set_child_value_i32	(posts, "total", count);

	for (tree_manager_get_first_child(&post_list, &my_list, &post); ((post != NULL) && (post->zone != NULL)); tree_manager_get_next_child(&my_list, &post))
	{
		btc_addr_t poster_addr;
		struct string accStr = { 0 };

		tree_manager_get_child_value_btcaddr(post, NODE_HASH("objAddr"), poster_addr);

		if (blog_get_account(poster_addr, &accStr))
		{
			tree_manager_set_child_value_vstr(post, "poster", &accStr);
			free_string(&accStr);
		}
	}

	release_zone_ref(&post_list);

	return 1;
}

OS_API_C_FUNC(int) blog_get_cat(mem_zone_ref_ptr cat_id, mem_zone_ref_ptr cat)
{
	mem_zone_ref	my_cat = { PTR_NULL };
	char			catHash[65], rcatHash[65];
	unsigned int	n;

	tree_manager_get_node_str(cat_id, 0, rcatHash, 65, 0);
	for (n = 0; n < 32; n++)
	{
		catHash[n * 2 + 0] = rcatHash[(31 - n) * 2 + 0];
		catHash[n * 2 + 1] = rcatHash[(31 - n) * 2 + 1];
	}
	catHash[64] = 0;

	load_obj("blog", catHash, "cat", 0, &my_cat, PTR_NULL);

	tree_manager_copy_children(cat, &my_cat, 2);
	release_zone_ref(&my_cat);

	return 1;
}

OS_API_C_FUNC(int) blog_get_post(mem_zone_ref_ptr post_id, mem_zone_ref_ptr post)
{
	char			Hash[65], rHash[65];
	char			content_hash[65];
	btc_addr_t		poster_addr;
	struct string	app_name = { 0 }, app_path = { 0 }, accStr = { 0 };
	mem_zone_ref	file = { PTR_NULL },content_tx = { PTR_NULL }, my_post = { PTR_NULL };
	unsigned char   *data;
	size_t			len;
	
	unsigned int	n;

	tree_manager_get_node_str(post_id, 0, rHash, 65, 0);
	for (n = 0; n < 32; n++)
	{
		Hash[n * 2 + 0] = rHash[(31 - n) * 2 + 0];
		Hash[n * 2 + 1] = rHash[(31 - n) * 2 + 1];
	}
	Hash[64] = 0;

	load_obj("blog", Hash, "post", 0, &my_post, poster_addr);

	tree_manager_get_child_value_str(&my_post, NODE_HASH("content"), content_hash,65,0);

	make_string						(&app_path, "apps");
	cat_cstring_p					(&app_path, "blog");
	cat_cstring_p					(&app_path, "datas");
	cat_cstring_p					(&app_path, content_hash);

	if (get_file(app_path.str, &data, &len)>0)
	{
		struct string strdata = { 0 };

		strdata.str = data;
		strdata.len = len;

		tree_manager_set_child_value_vstr	(&my_post, "content_data", &strdata);
		free_c								(data);
	}

	tree_manager_set_child_value_btcaddr(&my_post, "poster_addr", poster_addr);

	if (blog_get_account(poster_addr, &accStr))
	{
		tree_manager_set_child_value_vstr(&my_post, "poster", &accStr);
		free_string(&accStr);
	}


	free_string(&app_path);

	tree_manager_copy_children	(post, &my_post, 2);
	release_zone_ref			(&my_post);

	return 1;
}



OS_API_C_FUNC(int) blog_get_last_posts(mem_zone_ref_ptr posts,mem_zone_ref_ptr nFirst)
{
	mem_zone_ref list = { PTR_NULL }, my_list = { PTR_NULL }, post_list = { PTR_NULL };
	mem_zone_ref_ptr sh = PTR_NULL;
	size_t			first,num;

	if (!tree_mamanger_get_node_dword(nFirst, 0, &first))
		first = 0;

	tree_remove_children(posts);

	

	tree_manager_create_node		("hashes", NODE_BITCORE_HASH_LIST, &list);
	get_app_type_last_objs_hashes	("blog", NODE_BLOG_POST, first, 10, &num, &list);

	tree_manager_set_child_value_i32(posts, "total", num);
	tree_manager_add_child_node		(posts, "list", NODE_JSON_ARRAY, &post_list);

	for (tree_manager_get_first_child(&list, &my_list, &sh); ((sh != NULL) && (sh->zone != NULL)); tree_manager_get_next_child(&my_list, &sh))
	{
		btc_addr_t		poster_addr;
		hash_t			h;
		char			hash[65];
		mem_zone_ref	post = { PTR_NULL };
		int				i;
		tree_manager_get_node_hash(sh, 0, h);

		i = 0;
		while (i < 32)
		{
			hash[i * 2 + 0] = hex_chars[h[i] >> 0x04];
			hash[i * 2 + 1] = hex_chars[h[i] & 0x0F];
			i++;
		}
		hash[64] = 0;

		if (load_obj("blog", hash, "post", 0, &post, poster_addr))
		{
			struct string accStr = { 0 };

			tree_manager_set_child_value_btcaddr(&post, "objAddr", poster_addr);

			if (blog_get_account(poster_addr, &accStr))
			{
				tree_manager_set_child_value_vstr(&post, "poster", &accStr);
				free_string(&accStr);
			}

			tree_manager_node_add_child			(&post_list, &post);
			release_zone_ref					(&post);
		}
	}

	release_zone_ref(&post_list);
	release_zone_ref(&list);

	return 1;
}


OS_API_C_FUNC(int) blog_get_accounts(mem_zone_ref_ptr accounts, mem_zone_ref_ptr nFirst)
{
	mem_zone_ref list = { PTR_NULL }, my_list = { PTR_NULL }, accounts_list = { PTR_NULL };
	mem_zone_ref_ptr sh = PTR_NULL;
	size_t			first,count;

	if (!tree_mamanger_get_node_dword(nFirst, 0, &first))
		first = 0;

	tree_remove_children			(accounts);


	tree_manager_create_node			("hashes", NODE_BITCORE_HASH_LIST, &list);
	get_app_type_last_objs_hashes		("blog", NODE_BLOG_ACCOUNT, first, 10,&count, &list);

	tree_manager_set_child_value_i32	(accounts, "total", count);
	tree_manager_add_child_node			(accounts, "list", NODE_JSON_ARRAY, &accounts_list);

	
	for (tree_manager_get_first_child(&list, &my_list, &sh); ((sh != NULL) && (sh->zone != NULL)); tree_manager_get_next_child(&my_list, &sh))
	{
		btc_addr_t		poster_addr;
		char			hash[65];
		mem_zone_ref	account = { PTR_NULL };

		tree_manager_get_node_str(sh, 0, hash, 65, 0);

		if (load_obj("blog", hash, "account", 4, &account, poster_addr))
		{
			tree_manager_set_child_value_btcaddr(&account, "objAddr", poster_addr);
			tree_manager_node_add_child			(&accounts_list, &account);
			release_zone_ref					(&account);
		}
	}

	release_zone_ref(&accounts_list);
	release_zone_ref(&list);

	return 1;
}

OS_API_C_FUNC(int) blog_get_msgs(mem_zone_ref_ptr msg_srch, mem_zone_ref_ptr msgs)
{
	char			tstr[32];
	mem_zone_ref	hash_list = { PTR_NULL }, my_alist = { PTR_NULL }, my_list = { PTR_NULL }, msgs_list = { PTR_NULL }, toaddrs = { PTR_NULL };
	mem_zone_ref_ptr sh = PTR_NULL, taddr=PTR_NULL;
	size_t			 count,idx,first,nfound;

	uitoa_s(NODE_BLOG_MESSAGE, tstr, 32, 16);

	if (!tree_manager_find_child_node(msg_srch, NODE_HASH("addrs"), NODE_JSON_ARRAY, &toaddrs))return 0;

	if (!tree_manager_get_child_value_i32(msg_srch, NODE_HASH("firstMsg"), &first))
		first = 0;

	tree_remove_children(msgs);


	
	tree_manager_add_child_node		(msgs, "list", NODE_JSON_ARRAY, &msgs_list);

	nfound = 0;
	idx = 0;
	count = 0;

	for (tree_manager_get_first_child(&toaddrs, &my_alist, &taddr); ((taddr != NULL) && (taddr->zone != NULL)); tree_manager_get_next_child(&my_alist, &taddr))
	{
		btc_addr_t		toaddr;

		if (!tree_manager_get_child_value_btcaddr(taddr, NODE_HASH("address"), toaddr))continue;

		tree_manager_create_node		("list", NODE_JSON_ARRAY, &hash_list);
		find_objs_by_addr				("blog", tstr, "pubkey", toaddr, &hash_list);

		for (tree_manager_get_first_child(&hash_list, &my_list, &sh); ((sh != NULL) && (sh->zone != NULL)); tree_manager_get_next_child(&my_list, &sh))
		{
			hash_t			h;
			char			hash[65];
			btc_addr_t		from_addr;
			mem_zone_ref	msg = { PTR_NULL };
			int				i;
				
			tree_manager_get_node_hash(sh, 0, h);

			for (i = 0; i < 32; i++)
			{
				hash[i * 2 + 0] = hex_chars[h[i] >> 0x04];
				hash[i * 2 + 1] = hex_chars[h[i] & 0x0F];
			}
			hash[64] = 0;

			if (load_obj("blog", hash, "msg", 4, &msg, from_addr))
			{
				btc_addr_t		fromaddr;
				struct string	msgStr = { 0 };
				size_t			strn;
				int				good = 1;

				if (tree_manager_get_child_value_btcaddr(msg_srch, NODE_HASH("srcAddr"), fromaddr))
				{
					if (memcmp_c(fromaddr, from_addr, sizeof(btc_addr_t)) != 0)
					{
						release_zone_ref(&msg);
						continue;
					}
				}

				tree_manager_get_child_value_istr	(&msg, NODE_HASH("message"), &msgStr, 0);

				for (strn = 0; strn < msgStr.len; strn++)
				{
					if (!isxdigit_c(msgStr.str[strn]))
					{
						good = 0;
						break;
					}
				}

				if (!good)
				{
					struct string newStr = { 0 };

					newStr.len  = msgStr.len * 2;
					newStr.size = newStr.len + 1;
					newStr.str  = malloc_c(newStr.size);

					for (strn = 0; strn < msgStr.len; strn++)
					{
						newStr.str[strn * 2 + 0] = hex_chars[msgStr.str[strn] >> 0x04];
						newStr.str[strn * 2 + 1] = hex_chars[msgStr.str[strn] & 0x0F];
					}
					tree_manager_set_child_value_vstr(&msg, "message", &newStr);

					free_string(&newStr);
				}

				free_string(&msgStr);

				
				count++;

				if (nfound < 10)
				{
					idx++;
					if (idx >= first)
					{
						tree_manager_set_child_value_hash(&msg, "hash", h);
						tree_manager_set_child_value_btcaddr(&msg, "msgAddr", toaddr);
						tree_manager_set_child_value_btcaddr(&msg, "objAddr", from_addr);
						tree_manager_node_add_child(&msgs_list, &msg);
						nfound++;
					}
					release_zone_ref(&msg);
				}
			}
		}
		release_zone_ref(&hash_list);
	}

	tree_manager_set_child_value_i32(msgs, "total", count);

	release_zone_ref(&msgs_list);
	release_zone_ref(&toaddrs);

	return 1;

}

OS_API_C_FUNC(int) blog_get_cats(mem_zone_ref_ptr cat_list,mem_zone_ref_ptr nFirst)
{
	mem_zone_ref list = { PTR_NULL }, my_list = { PTR_NULL };
	mem_zone_ref_ptr sh = PTR_NULL;
	unsigned int first;

	if (!tree_mamanger_get_node_dword(nFirst, 0, &first))
		first = 0;
	tree_remove_children(cat_list);

	tree_manager_create_node("hashes", NODE_BITCORE_HASH_LIST, &list);

	get_app_type_obj_hashes("blog", NODE_BLOG_CAT, first, 10, &list);

	for (tree_manager_get_first_child(&list, &my_list, &sh); ((sh != NULL) && (sh->zone != NULL)); tree_manager_get_next_child(&my_list, &sh))
	{
		hash_t			h;
		char			hash[65];
		mem_zone_ref	cat = { PTR_NULL };
		int				i;
		tree_manager_get_node_hash(sh, 0, h);

		i = 0;
		while (i < 32)
		{
			hash[i * 2 + 0] = hex_chars[h[i] >> 0x04];
			hash[i * 2 + 1] = hex_chars[h[i] & 0x0F];
			i++;
		}
		hash[64] = 0;

		if (load_obj("blog", hash, "cat", 0, &cat, PTR_NULL))
		{
			tree_manager_set_child_value_hash	(&cat, "hash", h);
			tree_manager_node_add_child			(cat_list, &cat);
			release_zone_ref					(&cat);
		}
	}
	release_zone_ref(&list);
	return 1;
}

#ifdef _WIN32
unsigned int C_API_FUNC _DllMainCRTStartup(unsigned int *prev, unsigned int *cur, unsigned int *xx)
{

	return 1;
}
#endif