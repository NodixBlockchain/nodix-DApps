NODIX_PATH = ../nodix
PNGSRC = tracer/libpng-1.2.18/png.c tracer/libpng-1.2.18/pngget.c tracer/libpng-1.2.18/pngmem.c tracer/libpng-1.2.18/pngpread.c tracer/libpng-1.2.18/pngread.c tracer/libpng-1.2.18/pngrio.c tracer/libpng-1.2.18/pngrtran.c tracer/libpng-1.2.18/pngrutil.c tracer/libpng-1.2.18/pngset.c tracer/libpng-1.2.18/pngtrans.c tracer/libpng-1.2.18/pngvcrd.c tracer/libpng-1.2.18/pngwio.c tracer/libpng-1.2.18/pngwrite.c tracer/libpng-1.2.18/pngwtran.c tracer/libpng-1.2.18/pngwutil.c

CC = gcc
CFLAGS = -m32 -msse
MOD_LDFLAGS = -nodefaultlibs -nostdlib -Wl,--export-dynamic,-melf_i386
COMMON_INCS = -I$(NODIX_PATH)/libcon -I$(NODIX_PATH)/libcon/include -I$(NODIX_PATH)/libbase/include -I$(NODIX_PATH)/libcon/zlib-1.2.8


export/libblog.so: blog/blog.c $(NODIX_PATH)/export/libcon.so $(NODIX_PATH)/export/libbase.so $(NODIX_PATH)/export/libblock_adx.so
	$(CC) $(COMMON_INCS) blog/blog.c -L$(NODIX_PATH)/export $(MOD_LDFLAGS) -Wl,-soname,libnodix.so -lcon -lbase -lblock_adx -shared -o export/libblog.so

export/libtracer.so: blog/blog.c $(NODIX_PATH)/export/libcon.so $(NODIX_PATH)/export/libvec3.so $(NODIX_PATH)/export/libbase.so $(NODIX_PATH)/export/libblock_adx.so
	$(CC) $(COMMON_INCS) blog/blog.c -L$(NODIX_PATH)/export $(MOD_LDFLAGS) -Wl,-soname,libnodix.so -lcon -lbase -lblock_adx -shared -o export/libblog.so

export/libtracer.so:tracer/main.c export/libvec3.so export/libbase.so export/libcon.so
	$(CC) $(CFLAGS) $(COMMON_INCS) -I$(NODIX_PATH)/vec3 -DNO_RENDER -DPNG_NO_ASSEMBLER_CODE -DPNG_SETJMP_NOT_SUPPORTED -DPNG_NO_FLOATING_POINT_SUPPORTED -DPNG_NO_STDIO tracer/main.c $(PNGSRC) $(MODFLAGS) -Wl,-soname,libtracer.so -L$(NODIX_PATH)/export -lcon -lbase -lvec3 -shared -o export/libtracer.so

export/libtracer_rpc.so:tracer_rpc/main.c $(NODIX_PATH)/export/libtracer.so $(NODIX_PATH)/export/libvec3.so $(NODIX_PATH)/export/libbase.so $(NODIX_PATH)/export/libcon.so
	$(CC) $(CFLAGS) $(COMMON_INCS) -Ivec3 -Itracer tracer_rpc/main.c $(MODFLAGS) -Wl,-soname,libtracer_rpc.so -L$(NODIX_PATH)/export -lcon -lbase -lvec3 -ltracer  -shared  -o export/libtracer_rpc.so

export/libsite_cgi.so:site_cgi/site.c $(NODIX_PATH)/export/libnode_adx.so $(NODIX_PATH)/export/libwallet.so $(NODIX_PATH)/export/libprotocol_adx.so $(NODIX_PATH)/export/libblock_adx.so $(NODIX_PATH)/export/libbase.so $(NODIX_PATH)/export/libcon.so
	$(CC) $(CFLAGS) $(COMMON_INCS) site_cgi/site.c  $(MODFLAGS) -Wl,-soname,libsite_cgi.so -Lexport -lcon_d -lprotocol_adx_d -lblock_adx_d -lwallet_d -lnode_adx_d -o export/libsite_cgi.so

export/modz/blog.tpo: export/libblog.so
	$(NODIX_PATH)/export/modmaker export/libblog.so ./export/modz > export/blog.log
	mv export/modz/libblog.tpo export/modz/blog.tpo

export/modz/tracer.tpo: export/libtracer.so
	$(NODIX_PATH)/export/modmaker export/libtracer.so ./export/modz > export/tracer.log
	mv export/modz/libtracer.tpo export/modz/btracer.tpo

export/modz/tracer_rpc.tpo: export/libtracer_rpc.so
	$(NODIX_PATH)/export/modmaker export/libtracer_rpc.so ./export/modz > export/tracer_rpc.log
	mv export/modz/libtracer_rpc.tpo export/modz/tracer_rpc.tpo

export/modz/site_cgi.tpo: export/libsite_cgi.so
	$(NODIX_PATH)/export/modmaker export/libsite_cgi.so ./export/modz > export/site_cgi.log
	mv export/modz/libsite_cgi.tpo export/modz/site_cgi.tpo