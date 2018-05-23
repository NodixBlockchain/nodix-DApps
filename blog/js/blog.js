
var base_site_url = '/app/blog/page/blog.site'; //app/blog/page/blog.site
var postObj = {};
var blogCats;
var postCats = [];
var cat_nSignedInput = [];
var cat_nInputTosign = [];
var cats_tx = [];
var obj_tx = null;

var tinymce_conf =
{
    theme: "modern",
    height: 300,
    plugins: [
    "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
    "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
    "save table contextmenu directionality smileys template paste textcolor noneditable"
    ],


    toolbar1: "newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
    toolbar2: "cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor sliderbutton image media code | insertdatetime preview | forecolor backcolor",
    toolbar3: "table | hr removeformat | subscript superscript | charmap smileys | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft",
    smileys: [],
    auto_convert_smileys: true,
    relative_urls: false,
    extended_valid_elements: 'div[class|u|id|style],span[class|u|style],img[class|u|src|alt|style]',
    style_formats: [
    { title: 'Bold text', inline: 'b' },
    { title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
    { title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
    { title: 'Example 1', inline: 'span', classes: 'example1' },
    { title: 'Example 2', inline: 'span', classes: 'example2' },
    { title: 'Table styles' },
    { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' }
    ]
};

function init_mce_smileys() {
    tinymce_conf.smileys[0] = [
            { shortcut: ':-)', url: '/assets/img/emos/smile.png', title: 'smile' },
            { shortcut: 'O:)', url: '/assets/img/emos/angel.png', title: 'angel' },
            { shortcut: 'o.O', url: '/assets/img/emos/confused.png', title: 'confused' },
            { shortcut: '3:)', url: '/assets/img/emos/devil.png', title: 'devil' },
            { shortcut: ':-O', url: '/assets/img/emos/gasp.png', title: 'gasp' },
            { shortcut: '8-)', url: '/assets/img/emos/glasses.png', title: 'glasses' },
            { shortcut: ':-D', url: '/assets/img/emos/grin.png', title: 'grin' },
            { shortcut: ':bee', url: '/assets/img/emos/bee.gif', title: 'bee' },
            { shortcut: ':pompom', url: '/assets/img/emos/pompom.gif', title: 'pompom' },
            { shortcut: ':earthug', url: '/assets/img/emos/earthhug.gif', title: 'earthug' },
    ];
}

function make_pages(baseURL,first, PerPage,total, urlSuffix)
{
    var prev    = document.createElement('a');
    var cur     = document.createElement('span');
    var next    = document.createElement('a');
    var prevIdx = first - PerPage;
    var nextIdx = first + PerPage;

    var curPage, totalPage;
    
    prev.id = 'prev';
    prev.innerHTML = 'prev';

    if (first >= PerPage) {
        var url = baseURL + prevIdx;

        if (urlSuffix)
            url += urlSuffix;

        prev.href       = url;
        prev.className  = 'button_sml';
    }
    else
        prev.className = 'nolnk';

    next.id = 'next';
    next.innerHTML = 'next';

    if (nextIdx < total) {

        var url = baseURL + nextIdx;

        if (urlSuffix)
            url += urlSuffix;

        next.className  = 'button_sml';
        next.href = url;
    }
    else
        next.className  = 'nolnk';


    curPage         = Math.floor(first / PerPage) + 1;
    totalPage       = Math.floor((total+(PerPage-1)) / PerPage);

    cur.id         = 'pageN';
    cur.innerHTML  = curPage + '/' + totalPage;

    $('.pagination').empty();
    $('.pagination').append('pages :');
    $('.pagination').append(prev);
    $('.pagination').append(cur);
    $('.pagination').append(next);
}



function update_post(post, post_id) {
    var n;
    var html = '';
    var posterId;

    if (post.poster)
        posterId = post.poster;
    else
        posterId = post.objAddr;
    
    html += '<div class="blog_post"><h2><a href="' + base_site_url + '/viewpost/' + post.objHash + '" > ' + post.title + '</a></h2>' + posterId + '  ' + timeConverter(post.time) + '</div>';
    html += '<div>' + post.content_data + '/<div>';
    $('#' + post_id).html(html);
}


function update_posts(posts, post_list_id) {
    var n;
    var html = '';
    
    for (n = 0; n < posts.list.length; n++) {

        var posterId;

        if (posts.list[n].poster)
            posterId = posts.list[n].poster;
        else
            posterId = posts.list[n].objAddr;

        html += '<div class="blog_post"><h2><a href="' + base_site_url + '/viewpost/' + posts.list[n].objHash + '" > ' + posts.list[n].title + '</a></h2>' + posterId + '  ' + timeConverter(posts.list[n].time) + '</div>';
    }
    $('#' + post_list_id).html(html);
}


function update_accounts(accounts,root) {
    var n;
    var html = '';

    html += '<div class="row"><div class="col-md-2 ghdr">name</div><div class="col-md-4 ghdr">address</div><div class="col-md-2 ghdr">creation time</div><div class="col-md-2 ghdr">send msg</div></div>';

    for (n = 0; n < accounts.list.length; n++) {

        html += '<div class="row"><div class="col-md-2">' + accounts.list[n].name + '</div><div class="col-md-4">' + accounts.list[n].objAddr + '</div><div class="col-md-2">' + timeConverter(accounts.list[n].time) + '</div><div class="col-md-2"><a href="' + base_site_url + '/message/' + accounts.list[n].objKey+'">send message</a></div></div>';
    }
    $('#' + root).html(html);


}



function update_cats(cats, cats_id)
{
    var n;
    var html = '';

    for (n = 0; n < cats.length; n++) {
        html += '<div class="blog_cat"><h2><a href="' + base_site_url + '/viewcat/' + cats[n].hash + '" > ' + cats[n].name + '</a></h2></div>';
    }
    $('#' + cats_id).html(html);
}

function update_edit_cats(cats, cats_id) {
    var n;
    var html = '';

    for (n = 0; n < cats.length; n++) {
        html += '<div class="blog_cat" onclick="add_cat(' + n + ');" >' + cats[n].name + '</div>';
        cats[n].idx = n;
    }

    $('#' + cats_id).html(html);

    blogCats = cats;
}


function update_my_mesgs(root)
{
    var html = '<table class="table" ><tr><th>time</th><th>from</th><th>to</th></tr>';

    for (var n = 0; n < messages.list.length; n++)
    {
        html += '<tr ><td>' + timeConverter(messages.list[n].time) + '</td><td>' + messages.list[n].objAddr + '</td><td onclick="read_message (messages.list[' + n + '], $(this).attr(\'msgAddr\'));" msgAddr="' + messages.list[n].msgAddr + '">' + messages.list[n].msgAddr + '</td></tr>'    
    }
    html += '</table>';
    $('#' + root).html(html);
}




function find_cat(name) {
    var n;

    for (n = 0; n < blogCats.length; n++)
    {
        if (blogCats[n].name == name)
            return blogCats[n];
    }

    return null;
}


function add_cat(idx)
{
    var n;
    var first = true, found = false;
    var init,icats;
    var txt = '';

    init = $('#postCats').val();


    postCats = [];
    icats=init.split(',');

    for (n = 0; n < icats.length; n++) {
        var cat = find_cat(icats[n]);
        if (cat != null)
        {
            if (cat.name == blogCats[idx].name)
                found = true;

            postCats.push(cat);
        }
    }

    if(!found)
        postCats.push   (blogCats[idx]);

    console.log     (postCats);

    for (n = 0; n < postCats.length; n++) {

        if (!first)
            txt += ',';

        txt     += postCats[n].name;
        first   =  false;
    }

    $('#postCats').val(txt);
}

function get_msgs(accountName, first, srcAddr) {

    var msg_url = baseAppURL + '/getmsgs/' + accountName + '/' + first;

    if (srcAddr != null)
    {
        suffix   = msg_from + ');';
        msg_url += '?srcAddr=' + srcAddr;
    }
    else
        suffix  = ');';

    

    $.ajax({
        url: msg_url,
        contentType: "application/json; charset=utf-8",
        type: "GET",
        dataType: "json",
        success: function (data) { messages = data; update_my_mesgs('my_mesgs'); make_pages("javascript:get_msgs('" + accountName+"',", first, 10, messages.total, suffix);  },
        error: function (err) { }
    });
}




function post_done() {

    var url = 'postdone?posttx=' + obj_tx.txid + '&fileHash=' + blog_content.dataHash;
    
    window.location.href = url;
}


function submit_cat_txs(idx) {

    if (idx >= cats_tx.length) {
        post_done();
        return;
    }
    rpc_call('submittx', [cats_tx[idx]], function () {
        submit_cat_txs(idx + 1);
    });
}




function sign_cat_tx_inputs(cidx,txh, inputs) {
    var has_sign = false;

    cat_nSignedInput[cidx] = 0;
    cat_nInputTosign[cidx] = inputs.length;

    for (var n = 0; n < inputs.length; n++) {

        if (((inputs[n].isApp == true) || (!inputs[n].srcaddr)) || ((inputs[n].srcapp) && (!inputs[n].isAppType) && (!inputs[n].isAppObj) && (!inputs[n].isAppLayout) && (!inputs[n].addChild) && (!inputs[n].isAppModule))) {
            cat_nInputTosign[cidx]--;
        }
        else {
            var DecHexkey = $('#selected_' + inputs[n].srcaddr).attr('privkey');
            var pubKey = $('#selected_' + inputs[n].srcaddr).attr('pubkey');
            var mykey = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
            var signature = postObj.mykey.sign(inputs[n].signHash, 'hex');
            // Export DER encoded signature in Array
            //var derSign = signature.toDER('hex');
            var derSign = signature.toLowS();

            rpc_call('signtxinput', [txh, inputs[n].index, derSign, pubKey], function (data) {

                cat_nInputTosign[cidx]++;
                if (cat_nInputTosign[cidx] >= cat_nSignedInput[cidx]) {
                    var txid = txsign.result.txid;

                    //rpc_call('submittx', [txid], function () { });
                    cats_tx.push(txh);

                    cat_nSignedInput[cidx] = -1;
                }
            });

            has_sign = true;
        }
    }

    if (!has_sign) {
        cats_tx.push(txh);
        //rpc_call('submittx', [txh], function () {});
    }
}


function obj_add_category(icats, idx, arAddr, objHash) {
    
    if (idx >= icats.length) {
        submit_cat_txs(0);
        return;
    }

    var cat = find_cat(icats[idx]);
    if (cat != null) {
        rpc_call('addchildobj', [app_name, cat.hash, "posts", objHash, arAddr, postObj.tx_fee], function (data) {
            var my_tx = data.result.transaction;
            sign_cat_tx_inputs(cat.idx, my_tx.txid, my_tx.txsin);

            obj_add_category(icats, idx+1, arAddr, objHash);
        });
    }
}

function obj_add_categories(objHash) {

    var init, icats;
    var txt = '';
    var n;

    init        = $('#postCats').val();
    postCats    = [];
    icats = init.split(',');

    if (icats.length == 0) return;

    cats_tx = [];

    obj_add_category(icats, 0, MyAccount.SelectedAddrs, objHash);

}

function obj_txinputsigned(txsign) {

    obj_nSignedInput++;
    if (obj_nSignedInput >= obj_nInputTosign) {
        var txid = txsign.result.txid;
        rpc_call('submittx', [txid], function ()
        {
            obj_add_categories(txid);
        });
        obj_nSignedInput = -1;
    }
}


function sign_obj_tx_inputs(txh, inputs) {
    var has_sign = false;
    var n;
    obj_nSignedInput = 0;
    obj_nInputTosign = inputs.length;

    for (var n = 0; n < inputs.length; n++) {

        if ((inputs[n].isApp == true) || ((inputs[n].srcapp) && (!inputs[n].isAppType) && (!inputs[n].isAppObj) && (!inputs[n].isAppLayout) && (!inputs[n].addChild) && (!inputs[n].isAppModule))) {
            obj_nInputTosign--;
        }
        else {
            var DecHexkey = $('#selected_' + inputs[n].srcaddr).attr('privkey');
            var pubKey = $('#selected_' + inputs[n].srcaddr).attr('pubkey');
            var mykey = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
            var signature = postObj.mykey.sign(inputs[n].signHash, 'hex');
            // Export DER encoded signature in Array
            //var derSign = signature.toDER('hex');
            var derSign = signature.toLowS();

            rpc_call('signtxinput', [txh, inputs[n].index, derSign, pubKey], obj_txinputsigned);

            has_sign = true;
        }
    }

    if(!has_sign)
    {
        rpc_call('submittx', [txh], function ()
        {
            obj_add_categories(txh);
        });
    }
}

function send_obj_tx()
{
    
    var pubKey = postObj.mykey.getPublic().encodeCompressed('hex');
    var signature = postObj.mykey.sign(postObj.obj.content, 'hex');
    var derSign = signature.toLowS();


    rpc_call('makeappobjtx', [app_name, 0x1e000002, pubKey, postObj.obj, MyAccount.SelectedAddrs, postObj.tx_fee], function (obj_data) {
        obj_tx = obj_data.result.transaction;
        sign_obj_tx_inputs(obj_tx.txid, obj_tx.txsin);
    });

}

function post_txinputsigned(txsign) {
    post_nSignedInput++;
    if (post_nSignedInput >= post_nInputTosign) {
        var txid = txsign.result.txid;
        rpc_call('submittx', [txid], function ()
        {
            send_obj_tx();
        });
        $('#newtxid').html(txid);
        post_nSignedInput = -1;
    }

}

function sign_post_tx_inputs(txh, inputs) {

    var has_sign=false;
    post_nSignedInput = 0;
    post_nInputTosign = inputs.length;


    for (var n = 0; n < inputs.length; n++) {

        if ((inputs[n].isApp == true) || ((inputs[n].srcapp) && (!inputs[n].isAppType) && (!inputs[n].isAppObj) && (!inputs[n].isAppLayout) && (!inputs[n].addChild) && (!inputs[n].isAppModule))) {
            post_nInputTosign--;
        }
        else {
            var DecHexkey = $('#selected_' + inputs[n].srcaddr).attr('privkey');
            var pubKey = $('#selected_' + inputs[n].srcaddr).attr('pubkey');
            var mykey = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
            var signature = mykey.sign(inputs[n].signHash, 'hex');
            // Export DER encoded signature in Array
            //var derSign = signature.toDER('hex');
            var derSign = signature.toLowS();
            has_sign = true;
            rpc_call('signtxinput', [txh, inputs[n].index, derSign, pubKey], post_txinputsigned);
        }
    }


    if (!has_sign) {
        rpc_call('submittx', [txh], function () {
            send_obj_tx();
        });

        return;
    }

}

function make_post(post_addr,tx_fee,post_title,post_hash)
{
     var DecHexkey = $('#selected_' + post_addr).attr('privkey');

    if (DecHexkey == null) {
        $('#app_error').css('display', 'block');
        $('#app_error').html('select private key for addr ' + post_addr);
        return;
    }

    postObj             = {};
    postObj.mykey       = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
    postObj.obj         = {"title":post_title,"content":post_hash};
    postObj.tx_fee      = tx_fee;

    var pubKey          = $('#selected_' + post_addr).attr('pubkey'); //mykey.getPublic().encodeCompressed('hex');
    var signature       = postObj.mykey.sign(post_hash, 'hex');
    var derSign         = signature.toLowS();
    
    $('#app_error').css('display', 'none');

    if (MyAccount.selected_balance < tx_fee) {
        $('#app_error').css('display', 'block');
        $('#app_error').html('not enough balance selected');
        return;
    }

    rpc_call('makeappfiletx', [app_name, post_hash, pubKey, derSign, MyAccount.SelectedAddrs, tx_fee], function (cont_data) {
        var post_tx = cont_data.result.transaction;
        sign_post_tx_inputs (post_tx.txid, post_tx.txsin);
    });
}

function account_txinputsigned(txsign) {

    obj_nSignedInput++;
    if (obj_nSignedInput >= obj_nInputTosign) {
        var txid = txsign.result.txid;
        rpc_call('submittx', [txid], function () { account_done(); });
        obj_nSignedInput = -1;
    }
}


function sign_account_tx(txh, inputs) {
    var has_sign = false;
    var n;

    obj_nSignedInput = 0;
    obj_nInputTosign = inputs.length;

    for (var n = 0; n < inputs.length; n++) {

        if ((inputs[n].isApp == true) || ((inputs[n].srcapp) && (!inputs[n].isAppType) && (!inputs[n].isAppObj) && (!inputs[n].isAppLayout) && (!inputs[n].addChild) && (!inputs[n].isAppModule))) {
            obj_nInputTosign--;
        }
        else {
            var DecHexkey = $('#selected_' + inputs[n].srcaddr).attr('privkey');
            var pubKey = $('#selected_' + inputs[n].srcaddr).attr('pubkey');
            var mykey = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
            var signature = mykey.sign(inputs[n].signHash, 'hex');
            // Export DER encoded signature in Array
            //var derSign = signature.toDER('hex');
            var derSign = signature.toLowS();

            rpc_call('signtxinput', [txh, inputs[n].index, derSign, pubKey], account_txinputsigned);

            has_sign = true;
        }
    }

    if (!has_sign) {
        rpc_call('submittx', [txh], function () { account_done(); });
    }
}

function new_account(account_addr, account_name, fees)
{
    var AccountObj  = { "name": account_name };
    var pubKey      = $('#selected_' + account_addr).attr('pubkey');

    rpc_call('makeappobjtx', [app_name, 0x1e000004, pubKey, AccountObj, MyAccount.SelectedAddrs, fees], function (obj_data) {
        obj_tx = obj_data.result.transaction;
        sign_account_tx(obj_tx.txid, obj_tx.txsin);
    });

}


function read_message(msg, my_addr) {
    var DecHexkey = $('#selected_' + my_addr).attr('privkey');
    if (DecHexkey == null) {
        $('#app_error').html('select key for address ' + my_addr);
        return;
    }
    var mykey = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
    var theirkey = ec.keyPair({ pub: msg.objKey, pubEnc: 'hex' });
    var thekey = mykey.derive(theirkey.getPublic());
    var message = rc4_cypher(hex2a(thekey.toString(16)), hex2a(msg.message));

    $('#message').html(message);
    $('#messageFrom').html(msg.objAddr);
    
   
}


function new_message(dstAddr,srcAddr,  message, fees) {
    var DecHexkey   = $('#selected_' + srcAddr).attr('privkey');
    var pubKey      = $('#selected_' + srcAddr).attr('pubkey');

    if (DecHexkey == null) {
        $('#app_error').css('display', 'block');
        $('#app_error').html('select private key for addr ' + srcAddr);
        return;
    }

    var mykey       = ec.keyPair({ priv: DecHexkey, privEnc: 'hex' });
    var theirkey    = ec.keyPair({ pub: srcMsgPK, pubEnc: 'hex' });
    var theirpub    = theirkey.getPublic();
    var thekey      = mykey.derive(theirpub);

    var MessageObj      = {};
    MessageObj.pubkey   = theirpub.encodeCompressed('hex');
    MessageObj.message  = toHexString(rc4_cypher_ak(hex2b(thekey.toString(16)), message));
    
    rpc_call('makeappobjtx', [app_name, 0x1e000005, pubKey, MessageObj, MyAccount.SelectedAddrs, fees], function (obj_data) {
        obj_tx = obj_data.result.transaction;
        sign_account_tx(obj_tx.txid, obj_tx.txsin);
    });

}

