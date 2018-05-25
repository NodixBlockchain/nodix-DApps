# nodix_dApps

## Blog and social media Dapp

demo : http://nodix.eu:16820/app/blog/page/blog.site

### Access to blockchain data

The [blog module](https://github.com/NodixBlockchain/nodix_dApps/tree/master/blog/modules/blog) implement access to blog's data from the blockchain. 

implement the Model in MVC stack.


### Generation of dynamic web pages from blockchain data

The [nodix script](https://github.com/NodixBlockchain/nodix_dApps/blob/master/blog/blog.site) generate dynamic web page or json data from the blog module data.

implement the view in MVC stack.

## Raytracer

demo : http://nodix.eu:16820/app/raytrace/page/raytrace.site

### Access to blockchain data

The [tracer module](https://github.com/NodixBlockchain/nodix_dApps/tree/master/raytrace/modules/tracer) implement access to scene hierarchy from the blockchain. 

implement the Model in MVC stack.


### Generation of dynamic web pages from blockchain data

The [nodix script](https://github.com/NodixBlockchain/nodix_dApps/blob/master/raytrace/raytrace.site) generate dynamic web page or json data from the tracer module data.

implement the view in MVC stack.

### JSON/RPC API

The [tracer_rpc module](https://github.com/NodixBlockchain/nodix_dApps/tree/master/raytrace/modules/tracer_rpc) implement JOSN/RPC API to access scene hierarchy from http requests. 

implement the external API for dynamic web applications.

### installation

Compile the raytrace modules, raytrace/modz/tracer.tpo and raytrace/modz/tracer_rpc.tpo.

Copy the raytrace folder to nodix/export/web, and remove the modules folder.

Open the page 

http://127.0.0.1:16820/raytrace/raytrace_local.site




## Nodix web site

demo : http://nodix.eu:16820/index.site

### Generation of dynamic web pages from blockchain data

The [nodix script](https://github.com/NodixBlockchain/nodix_dApps/blob/master/site/index.site) generate dynamic web page for the website.

implement the view in MVC stack.