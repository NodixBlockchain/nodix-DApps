//copyright antoine bentue-ferrer 2016
#include <base/std_def.h>
#include <base/std_mem.h>
#include <base/mem_base.h>
#include <base/std_str.h>


#include <strs.h>
#include <tree.h>

#include <http.h>
#include <crypto.h>
#include <fsio.h>
#include <mem_stream.h>
#include <tpo_mod.h>

#include "../node_adx/node_api.h"
#include "../wallet/wallet_api.h"


mem_zone_ref			my_node = { PTR_INVALID };

OS_API_C_FUNC(int) set_node_site_cgi(mem_zone_ref_ptr node, tpo_mod_file *pos_mod)
{
	log_output("init block explorer module\n");

	create_dir("sess");

	my_node.zone = PTR_NULL;
	copy_zone_ref(&my_node, node);

	return 1;
}


OS_API_C_FUNC(int) node_zip(const char *params, const struct http_req *req, mem_zone_ref_ptr result)
{
	mem_zone_ref		opts = { PTR_NULL };
	struct string		zipData = { PTR_NULL };
	const struct key_val *key;
	int n = 0;

	if (tree_manager_create_node("opts", NODE_GFX_OBJECT, &opts))
	{
		while ((key = &req->query_vars[n])->value.str != PTR_NULL)
		{
			if (!stricmp_c(key->key, "mods"))
			{
				char		  newk[32];
				mem_zone_ref new_mod = { PTR_NULL };
				size_t		 pos,last_pos;

				last_pos = 0;
				while ((pos = strlpos_c(key->value.str, last_pos, '\n')) != INVALID_SIZE)
				{
					strncpy_cs					(newk, 32, &key->value.str[last_pos], pos - last_pos);
					tree_manager_add_child_node	(&opts, newk, NODE_GFX_STR, PTR_NULL);
					last_pos = pos + 1;
				}

				if (last_pos < key->value.len)
					tree_manager_add_child_node(&opts, &key->value.str[last_pos], NODE_GFX_STR, PTR_NULL);
			}
			else
			{
				tree_manager_set_child_value_str(&opts, key->key, key->value.str);
			}
			n++;
		}
	}

	release_zone_ref			(result);
	node_zip_self				(&zipData,&opts);

	if (tree_manager_create_node("data", NODE_BITCORE_VSTR, result))
		tree_manager_write_node_vstr(result, 0, &zipData);

	free_string				(&zipData);
	release_zone_ref		(&opts);


	return 1;
}

OS_API_C_FUNC(int) clearsession(const char *params, const struct http_req *req, mem_zone_ref_ptr result)
{
	struct string sessionfile = { PTR_NULL }, uname = { PTR_NULL };
	make_string_from_url(&uname, params, strlen_c(params));
	uname_cleanup		(&uname);
	if (uname.len > 3)
	{
		make_string			(&sessionfile, "sess");
		cat_cstring_p		(&sessionfile, uname.str);
		del_file			(sessionfile.str);
		free_string			(&sessionfile);
	}
	free_string(&uname);
	return 1;
}

OS_API_C_FUNC(int) getsession(const char *params, const struct http_req *req, mem_zone_ref_ptr result)
{
	struct string suname = { PTR_NULL }, spw = { PTR_NULL }, sessionfile = { PTR_NULL };
	size_t pwpos;
	int ret;

	

	pwpos = strlpos_c(params, 0, '/');
	if (pwpos == INVALID_SIZE)return 0;
	
	make_string_from_url(&suname, params, pwpos);
	make_string_from_url(&spw, &params[pwpos + 1], strlen_c(params) - (pwpos+1));


	uname_cleanup		(&suname);

	ret = checkpassword (&suname, &spw);

	if (ret)
	{
		char cstrid[9];
		unsigned char sessid[4];
		int	n = 0;
		default_RNG	(sessid, 4);

		
		while (n < 4)
		{
			cstrid[n * 2 + 0] = hex_chars[sessid[n] >> 4];
			cstrid[n * 2 + 1] = hex_chars[sessid[n] & 0x0F];
			n++;
		}
		cstrid[8] = 0;

		make_string		(&sessionfile	, "sess");
		cat_cstring_p	(&sessionfile	, cstrid);
		put_file		(sessionfile.str, suname.str, suname.len);

		tree_manager_set_child_value_str(result, "sessionid", cstrid);

		free_string	(&sessionfile);
	}


	free_string(&suname);
	free_string(&spw);

	return ret;
}

C_EXPORT mod_name_decoration_t	 mod_name_deco_type = MOD_NAME_DECO;
C_EXPORT int _fltused = 0;

unsigned int C_API_FUNC _DllMainCRTStartup(unsigned int *prev, unsigned int *cur, unsigned int *xx)
{

	return 1;
}