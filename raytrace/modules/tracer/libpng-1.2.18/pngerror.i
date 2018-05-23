#line 1 ".\\pngerror.c"
















#line 1 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

























































































































































































































































































































































































  



















#line 1 "../zlib-1.2.3\\zlib.h"

































#line 1 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"































































#line 65 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 68 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 71 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"




#line 76 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"






#line 83 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
























#line 108 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 111 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 114 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 117 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"



#line 121 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"










#line 132 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"







#line 140 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
#line 141 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"








#line 150 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"














                        






#line 172 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
#line 173 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"





























   











   

















#line 233 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"











#line 245 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"



#line 249 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 252 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 255 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"



#line 259 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


typedef unsigned char  Byte;  
#line 263 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
typedef unsigned int   uInt;  
typedef unsigned long  uLong; 





   typedef Byte   Bytef;
#line 272 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
typedef char   charf;
typedef int    intf;
typedef uInt   uIntf;
typedef uLong  uLongf;


   typedef void const *voidpc;
   typedef void    *voidpf;
   typedef void       *voidp;




#line 286 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"








#line 295 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"




#line 300 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"


#line 303 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"



#line 307 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"






#line 314 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
















#line 331 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"

#line 333 "h:\\coding\\s!p\\zdm\\zlib-1.2.3\\zconf.h"
#line 35 "../zlib-1.2.3\\zlib.h"










































typedef voidpf (*alloc_func) (voidpf opaque, uInt items, uInt size);
typedef void   (*free_func)  (voidpf opaque, voidpf address);

struct internal_state;

typedef struct z_stream_s {
    Bytef    *next_in;  
    uInt     avail_in;  
    uLong    total_in;  

    Bytef    *next_out; 
    uInt     avail_out; 
    uLong    total_out; 

    char     *msg;      
    struct internal_state  *state; 

    alloc_func zalloc;  
    free_func  zfree;   
    voidpf     opaque;  

    int     data_type;  
    uLong   adler;      
    uLong   reserved;   
} z_stream;

typedef z_stream  *z_streamp;





typedef struct gz_header_s {
    int     text;       
    uLong   time;       
    int     xflags;     
    int     os;         
    Bytef   *extra;     
    uInt    extra_len;  
    uInt    extra_max;  
    Bytef   *name;      
    uInt    name_max;   
    Bytef   *comment;   
    uInt    comm_max;   
    int     hcrc;       
    int     done;       

} gz_header;

typedef gz_header  *gz_headerp;

































                        

















































                        

extern const char *  zlibVersion (void);





























extern int  deflate (z_streamp strm, int flush);





















































































extern int  deflateEnd (z_streamp strm);


































extern int  inflate (z_streamp strm, int flush);


































































































extern int  inflateEnd (z_streamp strm);










                        
































































extern int  deflateSetDictionary (z_streamp strm, const Bytef *dictionary, uInt dictLength);
#line 541 "../zlib-1.2.3\\zlib.h"




































extern int  deflateCopy (z_streamp dest, z_streamp source);
#line 579 "../zlib-1.2.3\\zlib.h"
















extern int  deflateReset (z_streamp strm);










extern int  deflateParams (z_streamp strm, int level, int strategy);
#line 609 "../zlib-1.2.3\\zlib.h"


















extern int  deflateTune (z_streamp strm, int good_length, int max_lazy, int nice_length, int max_chain);
#line 632 "../zlib-1.2.3\\zlib.h"












extern uLong  deflateBound (z_streamp strm, uLong sourceLen);
#line 646 "../zlib-1.2.3\\zlib.h"







extern int  deflatePrime (z_streamp strm, int bits, int value);
#line 656 "../zlib-1.2.3\\zlib.h"













extern int  deflateSetHeader (z_streamp strm, gz_headerp head);
#line 671 "../zlib-1.2.3\\zlib.h"

































































extern int  inflateSetDictionary (z_streamp strm, const Bytef *dictionary, uInt dictLength);
#line 739 "../zlib-1.2.3\\zlib.h"



















extern int  inflateSync (z_streamp strm);














extern int  inflateCopy (z_streamp dest, z_streamp source);
#line 775 "../zlib-1.2.3\\zlib.h"














extern int  inflateReset (z_streamp strm);









extern int  inflatePrime (z_streamp strm, int bits, int value);
#line 802 "../zlib-1.2.3\\zlib.h"













extern int  inflateGetHeader (z_streamp strm, gz_headerp head);
#line 817 "../zlib-1.2.3\\zlib.h"




























































typedef unsigned (*in_func) (void  *, unsigned char  *  *);
typedef int (*out_func) (void  *, unsigned char  *, unsigned);

extern int  inflateBack (z_streamp strm, in_func in, void  *in_desc, out_func out, void  *out_desc);
#line 883 "../zlib-1.2.3\\zlib.h"


































































extern int  inflateBackEnd (z_streamp strm);







extern uLong  zlibCompileFlags (void);









































                        









extern int  compress (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);
#line 1011 "../zlib-1.2.3\\zlib.h"













extern int  compress2 (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level);
#line 1027 "../zlib-1.2.3\\zlib.h"













extern uLong  compressBound (uLong sourceLen);






extern int  uncompress (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);
#line 1049 "../zlib-1.2.3\\zlib.h"

















typedef voidp gzFile;

extern gzFile  gzopen  (const char *path, const char *mode);
















extern gzFile  gzdopen  (int fd, const char *mode);












extern int  gzsetparams (gzFile file, int level, int strategy);







extern int     gzread  (gzFile file, voidp buf, unsigned len);







extern int     gzwrite (gzFile file, voidpc buf, unsigned len);
#line 1116 "../zlib-1.2.3\\zlib.h"






extern int    gzprintf (gzFile file, const char *format, ...);












extern int  gzputs (gzFile file, const char *s);






extern char *  gzgets (gzFile file, char *buf, int len);








extern int     gzputc (gzFile file, int c);





extern int     gzgetc (gzFile file);





extern int     gzungetc (int c, gzFile file);









extern int     gzflush (gzFile file, int flush);









extern long     gzseek (gzFile file, long offset, int whence);
#line 1185 "../zlib-1.2.3\\zlib.h"
















extern int     gzrewind (gzFile file);






extern long     gztell (gzFile file);








extern int  gzeof (gzFile file);





extern int  gzdirect (gzFile file);





extern int     gzclose (gzFile file);






extern const char *  gzerror (gzFile file, int *errnum);








extern void  gzclearerr (gzFile file);






                        







extern uLong  adler32 (uLong adler, const Bytef *buf, uInt len);















extern uLong  adler32_combine (uLong adler1, uLong adler2, long len2);
#line 1278 "../zlib-1.2.3\\zlib.h"







extern uLong  crc32   (uLong crc, const Bytef *buf, uInt len);















extern uLong  crc32_combine (uLong crc1, uLong crc2, long len2);










                        




extern int  deflateInit_ (z_streamp strm, int level, const char *version, int stream_size);
#line 1319 "../zlib-1.2.3\\zlib.h"
extern int  inflateInit_ (z_streamp strm, const char *version, int stream_size);
#line 1321 "../zlib-1.2.3\\zlib.h"
extern int  deflateInit2_ (z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size);
#line 1325 "../zlib-1.2.3\\zlib.h"
extern int  inflateInit2_ (z_streamp strm, int windowBits, const char *version, int stream_size);
#line 1327 "../zlib-1.2.3\\zlib.h"
extern int  inflateBackInit_ (z_streamp strm, int windowBits, unsigned char  *window, const char *version, int stream_size);
#line 1331 "../zlib-1.2.3\\zlib.h"















    struct internal_state {int dummy;}; 
#line 1348 "../zlib-1.2.3\\zlib.h"

extern const char   *  zError           (int);
extern int             inflateSyncPoint (z_streamp z);
extern const uLongf *  get_crc_table    (void);





#line 1358 "../zlib-1.2.3\\zlib.h"

#line 399 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 400 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


#line 1 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




























































































#line 94 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 100 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 106 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 113 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 114 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 119 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 120 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"











#line 132 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"













































































#line 210 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"










 
 
 








#line 232 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"























#line 256 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"























#line 280 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 282 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"








#line 292 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 293 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 298 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 302 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




















   
#line 1 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"
















#pragma once
#line 19 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"




#line 1 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"














 





#line 22 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 23 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"














#line 38 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



#line 42 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"











    

#line 56 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 58 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 1 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"

























































































































































































































#pragma once











#line 231 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"
#line 232 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"



























































































































































































































#line 452 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#line 486 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"



































































































































































































































    
    
#line 716 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"






#line 723 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"
#line 724 "H:\\Microsoft Visual Studio 8\\VC\\include\\sal.h"







#line 60 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"























































































#pragma pack(push,8)
#line 149 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 1 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"













#pragma once
#line 16 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"






#line 23 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"









#pragma pack(push,8)
#line 34 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"











#line 46 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"
#line 47 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"





typedef __w64 unsigned int   uintptr_t;
#line 54 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"

#line 56 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"





typedef char *  va_list;
#line 63 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"

#line 65 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"





#line 71 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"











#line 83 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"


#line 86 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"













#line 100 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"












































#line 145 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"






#pragma pack(pop)
#line 153 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"

#line 155 "H:\\Microsoft Visual Studio 8\\VC\\include\\vadefs.h"
#line 151 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"









#line 161 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 166 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"








#line 175 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"






#line 182 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 184 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 185 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"






#line 192 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 194 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 195 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"













#line 209 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 210 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





#line 216 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 224 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 226 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 228 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 236 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 237 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 242 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 244 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 245 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 250 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 252 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 253 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


 

#line 258 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
  
 #line 260 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 261 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"










#line 272 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 273 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"






#line 280 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 281 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

















#line 299 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 304 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





#line 310 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 318 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 319 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 327 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 328 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





#line 334 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


#line 337 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 339 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 340 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 341 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"











#line 353 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 355 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 356 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 357 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"












#line 370 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 371 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 379 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 381 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 382 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



 
  
 



#line 392 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 393 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


 
  
  
 



#line 403 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 404 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


 
  
   
  

#line 412 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
 



#line 417 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 418 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





#line 424 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 426 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 427 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





typedef __w64 unsigned int   size_t;
#line 434 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 436 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



typedef size_t rsize_t;

#line 442 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 443 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





typedef __w64 int            intptr_t;
#line 450 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 452 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"














typedef __w64 int            ptrdiff_t;
#line 468 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 470 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


typedef unsigned short wchar_t;

#line 475 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


typedef unsigned short wint_t;
typedef unsigned short wctype_t;

#line 481 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


















#line 500 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 501 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





__declspec(deprecated("This name was supported during some Whidbey pre-releases. Instead, use the standard name errno_t.")) typedef int errcode;


#line 510 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

typedef int errno_t;
#line 513 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


typedef __w64 long __time32_t;   

#line 518 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



typedef __int64 __time64_t;     
#line 523 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 525 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"





typedef __time64_t time_t;      
#line 532 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 534 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 542 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 543 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 548 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 550 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 551 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 556 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 558 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 559 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"






#line 566 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 567 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 572 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



#line 576 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"











#line 588 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 593 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"




#line 598 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 600 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 601 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 609 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



















































































































































#line 757 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"














#line 772 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 773 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







































































































































































































































































































































































































































































































































































































































































































































































































































































#line 1613 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"






















































































#line 1700 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"
#line 1701 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct * pthreadlocinfo;
typedef struct threadmbcinfostruct * pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct
{
    pthreadlocinfo locinfo;
    pthreadmbcinfo mbcinfo;
} _locale_tstruct, *_locale_t;


typedef struct tagLC_ID {
        unsigned short wLanguage;
        unsigned short wCountry;
        unsigned short wCodePage;
} LC_ID, *LPLC_ID;

#line 1722 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


typedef struct threadlocaleinfostruct {
        int refcount;
        unsigned int lc_codepage;
        unsigned int lc_collate_cp;
        unsigned long lc_handle[6]; 
        LC_ID lc_id[6];
        struct {
            char *locale;
            wchar_t *wlocale;
            int *refcount;
            int *wrefcount;
        } lc_category[6];
        int lc_clike;
        int mb_cur_max;
        int * lconv_intl_refcount;
        int * lconv_num_refcount;
        int * lconv_mon_refcount;
        struct lconv * lconv;
        int * ctype1_refcount;
        unsigned short * ctype1;
        const unsigned short * pctype;
        const unsigned char * pclmap;
        const unsigned char * pcumap;
        struct __lc_time_data * lc_time_curr;
} threadlocinfo;

#line 1751 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"







#line 1759 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 1761 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



#line 1765 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 1767 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



#line 1771 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 1773 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"






#line 1780 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"



#line 1784 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"


#pragma pack(pop)
#line 1788 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 1790 "H:\\Microsoft Visual Studio 8\\VC\\include\\crtdefs.h"

#line 24 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"









#line 34 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"






#pragma pack(push,8)
#line 42 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"

















#line 60 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"







typedef struct __JUMP_BUFFER {
    unsigned long Ebp;
    unsigned long Ebx;
    unsigned long Edi;
    unsigned long Esi;
    unsigned long Esp;
    unsigned long Eip;
    unsigned long Registration;
    unsigned long TryLevel;
    unsigned long Cookie;
    unsigned long UnwindFunc;
    unsigned long UnwindData[6];
} _JUMP_BUFFER;


























































































































































#line 235 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"





typedef int jmp_buf[16];

#line 243 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"




int __cdecl _setjmp(     jmp_buf _Buf);











 __declspec(noreturn) void __cdecl longjmp(     jmp_buf _Buf,      int _Value);
#line 261 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"


#pragma pack(pop)
#line 265 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"

#line 267 "H:\\Microsoft Visual Studio 8\\VC\\include\\setjmp.h"
#line 324 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







#line 332 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 338 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




























#line 367 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 369 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 375 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 376 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 381 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 387 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

 














#line 404 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 407 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 410 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"










#line 421 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 428 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 430 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"










#line 441 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





































#line 479 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 482 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 485 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 486 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"








#line 495 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

































#line 530 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 534 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 541 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 546 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 549 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 552 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 555 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 558 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 561 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 564 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 567 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 570 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 573 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 576 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 579 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 582 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 585 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 588 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 591 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 594 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 597 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 598 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 603 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
              






#line 611 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 612 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 619 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 620 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 622 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 629 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 634 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 637 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 640 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 643 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 646 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 649 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 652 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 655 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 658 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 661 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 662 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 669 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 675 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 679 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 685 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 686 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 688 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 693 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 694 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 700 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 701 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"























#line 725 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"













#line 739 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 743 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 747 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 751 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 752 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"










#line 763 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 764 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 771 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 772 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 773 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 780 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 783 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







































#line 825 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 831 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"











#line 843 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 847 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 851 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 855 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 859 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"











#line 871 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 875 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







#line 883 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 887 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 891 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 895 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 899 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







#line 907 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 911 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 916 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 919 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 920 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"









#line 931 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 934 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 939 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 941 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"













#line 955 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 961 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 967 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 973 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 979 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"













#line 993 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 999 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 1004 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1005 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1011 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1017 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1023 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1029 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1035 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"











#line 1047 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1053 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"









#line 1063 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1064 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





#line 1071 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 1073 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







#line 1081 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







#line 1089 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"










typedef unsigned long png_uint_32;
typedef long png_int_32;
typedef unsigned short png_uint_16;
typedef short png_int_16;
typedef unsigned char png_byte;







   typedef size_t png_size_t;

#line 1114 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"















































#line 1162 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1163 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"









#line 1173 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



typedef png_int_32 png_fixed_point;


typedef void             * png_voidp;
typedef png_byte         * png_bytep;
typedef png_uint_32      * png_uint_32p;
typedef png_int_32       * png_int_32p;
typedef png_uint_16      * png_uint_16p;
typedef png_int_16       * png_int_16p;
typedef const char   * png_const_charp;
typedef char             * png_charp;
typedef png_fixed_point  * png_fixed_point_p;










typedef double           * png_doublep;
#line 1200 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


typedef png_byte         *  * png_bytepp;
typedef png_uint_32      *  * png_uint_32pp;
typedef png_int_32       *  * png_int_32pp;
typedef png_uint_16      *  * png_uint_16pp;
typedef png_int_16       *  * png_int_16pp;
typedef const char   *  * png_const_charpp;
typedef char             *  * png_charpp;
typedef png_fixed_point  *  * png_fixed_point_pp;

typedef double           *  * png_doublepp;
#line 1213 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


typedef char             *  *  * png_charppp;








typedef charf *         png_zcharp;
typedef charf *  *   png_zcharpp;
typedef z_stream  *  png_zstreamp;
#line 1228 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





















#line 1250 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






















#line 1273 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"








#line 1282 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 1284 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1285 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 1292 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"












#line 1305 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 1309 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"








#line 1320 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1321 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"



#line 1326 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





























#line 1356 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"









#line 1366 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"





















#line 1388 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"




#line 1393 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1394 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"







#line 1402 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






#line 1409 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"













#line 1423 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"








#line 1432 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"








#line 1441 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"













#line 1455 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 1458 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"






















#line 1481 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"
#line 1482 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"


#line 1485 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 1487 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\pngconf.h"

#line 403 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

















#line 421 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



#line 425 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

#line 427 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 428 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"














































#line 475 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"







extern  const char png_libpng_ver[18];
  


#line 487 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




extern  const int  png_pass_start[7];
extern  const int  png_pass_inc[7];
extern  const int  png_pass_ystart[7];
extern  const int  png_pass_yinc[7];
extern  const int  png_pass_mask[7];
extern  const int  png_pass_dsp_mask[7];






#line 504 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

#line 506 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





typedef struct png_color_struct
{
   png_byte red;
   png_byte green;
   png_byte blue;
} png_color;
typedef png_color  * png_colorp;
typedef png_color  *  * png_colorpp;

typedef struct png_color_16_struct
{
   png_byte index;    
   png_uint_16 red;   
   png_uint_16 green;
   png_uint_16 blue;
   png_uint_16 gray;  
} png_color_16;
typedef png_color_16  * png_color_16p;
typedef png_color_16  *  * png_color_16pp;

typedef struct png_color_8_struct
{
   png_byte red;   
   png_byte green;
   png_byte blue;
   png_byte gray;  
   png_byte alpha; 
} png_color_8;
typedef png_color_8  * png_color_8p;
typedef png_color_8  *  * png_color_8pp;





typedef struct png_sPLT_entry_struct
{
   png_uint_16 red;
   png_uint_16 green;
   png_uint_16 blue;
   png_uint_16 alpha;
   png_uint_16 frequency;
} png_sPLT_entry;
typedef png_sPLT_entry  * png_sPLT_entryp;
typedef png_sPLT_entry  *  * png_sPLT_entrypp;






typedef struct png_sPLT_struct
{
   png_charp name;           
   png_byte depth;           
   png_sPLT_entryp entries;  
   png_int_32 nentries;      
} png_sPLT_t;
typedef png_sPLT_t  * png_sPLT_tp;
typedef png_sPLT_t  *  * png_sPLT_tpp;










typedef struct png_text_struct
{
   int  compression;       




   png_charp key;          
   png_charp text;         

   png_size_t text_length; 







} png_text;
typedef png_text  * png_textp;
typedef png_text  *  * png_textpp;
#line 603 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

















typedef struct png_time_struct
{
   png_uint_16 year; 
   png_byte month;   
   png_byte day;     
   png_byte hour;    
   png_byte minute;  
   png_byte second;  
} png_time;
typedef png_time  * png_timep;
typedef png_time  *  * png_timepp;







typedef struct png_unknown_chunk_t
{
    png_byte name[5];
    png_byte *data;
    png_size_t size;

    
    png_byte location; 
}
png_unknown_chunk;
typedef png_unknown_chunk  * png_unknown_chunkp;
typedef png_unknown_chunk  *  * png_unknown_chunkpp;
#line 651 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"








































typedef struct png_info_struct
{
   
   png_uint_32 width;       
   png_uint_32 height;      
   png_uint_32 valid;       
   png_uint_32 rowbytes;    
   png_colorp palette;      
   png_uint_16 num_palette; 
   png_uint_16 num_trans;   
   png_byte bit_depth;      
   png_byte color_type;     
   
   png_byte compression_type; 
   png_byte filter_type;    
   png_byte interlace_type; 

   
   png_byte channels;       
   png_byte pixel_depth;    
   png_byte spare_byte;     
   png_byte signature[8];   

   






   



   float gamma; 
#line 727 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


    
    
   png_byte srgb_intent; 
#line 733 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   







   int num_text; 
   int max_text; 
   png_textp text; 
#line 747 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"






#line 754 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   





   png_color_8 sig_bit; 
#line 764 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   








   png_bytep trans; 
   png_color_16 trans_values; 
#line 779 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   





   png_color_16 background;
#line 789 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   




   png_int_32 x_offset; 
   png_int_32 y_offset; 
   png_byte offset_unit_type; 
#line 800 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   



   png_uint_32 x_pixels_per_unit; 
   png_uint_32 y_pixels_per_unit; 
   png_byte phys_unit_type; 
#line 810 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   





   png_uint_16p hist;
#line 820 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   






   float x_white;
   float y_white;
   float x_red;
   float y_red;
   float x_green;
   float y_green;
   float x_blue;
   float y_blue;
#line 838 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 839 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   










   png_charp pcal_purpose;  
   png_int_32 pcal_X0;      
   png_int_32 pcal_X1;      
   png_charp pcal_units;    
   png_charpp pcal_params;  
   png_byte pcal_type;      
   png_byte pcal_nparams;   
#line 860 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



   png_uint_32 free_me;     
#line 865 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   
   png_unknown_chunkp unknown_chunks;
   png_size_t unknown_chunks_num;
#line 871 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   
   png_charp iccp_name;     
   png_charp iccp_profile;  
                            
   png_uint_32 iccp_proflen;  
   png_byte iccp_compression; 
#line 880 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   
   png_sPLT_tp splt_palettes;
   png_uint_32 splt_palettes_num;
#line 886 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   






   png_byte scal_unit;         

   double scal_pixel_width;    
   double scal_pixel_height;   
#line 900 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

   png_charp scal_s_width;     
   png_charp scal_s_height;    
#line 904 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 905 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   
   
   png_bytepp row_pointers;        
#line 911 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_fixed_point int_gamma; 
#line 915 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_fixed_point int_x_white;
   png_fixed_point int_y_white;
   png_fixed_point int_x_red;
   png_fixed_point int_y_red;
   png_fixed_point int_x_green;
   png_fixed_point int_y_green;
   png_fixed_point int_x_blue;
   png_fixed_point int_y_blue;
#line 926 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

} png_info;

typedef png_info  * png_infop;
typedef png_info  *  * png_infopp;








#line 940 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





























































































typedef struct png_row_info_struct
{
   png_uint_32 width; 
   png_uint_32 rowbytes; 
   png_byte color_type; 
   png_byte bit_depth; 
   png_byte channels; 
   png_byte pixel_depth; 
} png_row_info;

typedef png_row_info  * png_row_infop;
typedef png_row_info  *  * png_row_infopp;







typedef struct png_struct_def png_struct;
typedef png_struct  * png_structp;

typedef void (__cdecl *png_error_ptr) (png_structp, png_const_charp);
typedef void (__cdecl *png_rw_ptr) (png_structp, png_bytep, png_size_t);
typedef void (__cdecl *png_flush_ptr) (png_structp);
typedef void (__cdecl *png_read_status_ptr) (png_structp, png_uint_32, int);
typedef void (__cdecl *png_write_status_ptr) (png_structp, png_uint_32, int);


typedef void (__cdecl *png_progressive_info_ptr) (png_structp, png_infop);
typedef void (__cdecl *png_progressive_end_ptr) (png_structp, png_infop);
typedef void (__cdecl *png_progressive_row_ptr) (png_structp, png_bytep, png_uint_32, int);
#line 1069 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


typedef void (__cdecl *png_user_transform_ptr) (png_structp, png_row_infop, png_bytep);
#line 1076 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


typedef int (__cdecl *png_user_chunk_ptr) (png_structp, png_unknown_chunkp);
#line 1080 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

typedef void (__cdecl *png_unknown_chunk_ptr) (png_structp);
#line 1083 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





















typedef png_voidp (*png_malloc_ptr) (png_structp, png_size_t);
typedef void (*png_free_ptr) (png_structp, png_voidp);








struct png_struct_def
{

   jmp_buf jmpbuf;            
#line 1119 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
   png_error_ptr error_fn;    
   png_error_ptr warning_fn;  
   png_voidp error_ptr;       
   png_rw_ptr write_data_fn;  
   png_rw_ptr read_data_fn;   
   png_voidp io_ptr;          


   png_user_transform_ptr read_user_transform_fn; 
#line 1129 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_user_transform_ptr write_user_transform_fn; 
#line 1133 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




   png_voidp user_transform_ptr; 
   png_byte user_transform_depth;    
   png_byte user_transform_channels; 
#line 1142 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1143 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

   png_uint_32 mode;          
   png_uint_32 flags;         
   png_uint_32 transformations; 

   z_stream zstream;          
   png_bytep zbuf;            
   png_size_t zbuf_size;      
   int zlib_level;            
   int zlib_method;           
   int zlib_window_bits;      
   int zlib_mem_level;        
   int zlib_strategy;         

   png_uint_32 width;         
   png_uint_32 height;        
   png_uint_32 num_rows;      
   png_uint_32 usr_width;     
   png_uint_32 rowbytes;      
   png_uint_32 irowbytes;     
   png_uint_32 iwidth;        
   png_uint_32 row_number;    
   png_bytep prev_row;        
   png_bytep row_buf;         
   png_bytep sub_row;         
   png_bytep up_row;          
   png_bytep avg_row;         
   png_bytep paeth_row;       
   png_row_info row_info;     

   png_uint_32 idat_size;     
   png_uint_32 crc;           
   png_colorp palette;        
   png_uint_16 num_palette;   
   png_uint_16 num_trans;     
   png_byte chunk_name[5];    
   png_byte compression;      
   png_byte filter;           
   png_byte interlaced;       
   png_byte pass;             
   png_byte do_filter;        
   png_byte color_type;       
   png_byte bit_depth;        
   png_byte usr_bit_depth;    
   png_byte pixel_depth;      
   png_byte channels;         
   png_byte usr_channels;     
   png_byte sig_bytes;        





   png_uint_16 filler;           
#line 1198 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1199 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_byte background_gamma_type;

   float background_gamma;
#line 1205 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
   png_color_16 background;   

   png_color_16 background_1; 
#line 1209 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1210 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_flush_ptr output_flush_fn;
   png_uint_32 flush_dist;    
   png_uint_32 flush_rows;    
#line 1216 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   int gamma_shift;      

   float gamma;          
   float screen_gamma;   
#line 1223 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1224 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_bytep gamma_table;     
   png_bytep gamma_from_1;    
   png_bytep gamma_to_1;      
   png_uint_16pp gamma_16_table; 
   png_uint_16pp gamma_16_from_1; 
   png_uint_16pp gamma_16_to_1; 
#line 1233 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_color_8 sig_bit;       
#line 1237 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_color_8 shift;         
#line 1241 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_bytep trans;           
   png_color_16 trans_values; 
#line 1247 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

   png_read_status_ptr read_row_fn;   
   png_write_status_ptr write_row_fn; 

   png_progressive_info_ptr info_fn; 
   png_progressive_row_ptr row_fn;   
   png_progressive_end_ptr end_fn;   
   png_bytep save_buffer_ptr;        
   png_bytep save_buffer;            
   png_bytep current_buffer_ptr;     
   png_bytep current_buffer;         
   png_uint_32 push_length;          
   png_uint_32 skip_length;          
   png_size_t save_buffer_size;      
   png_size_t save_buffer_max;       
   png_size_t buffer_size;           
   png_size_t current_buffer_size;   
   int process_mode;                 
   int cur_palette;                  


     png_size_t current_text_size;   
     png_size_t current_text_left;   
     png_charp current_text;         
     png_charp current_text_ptr;     
#line 1273 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

#line 1275 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"








#line 1284 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_bytep palette_lookup;         
   png_bytep dither_index;           
#line 1289 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_uint_16p hist;                
#line 1293 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_byte heuristic_method;        
   png_byte num_prev_filters;        
   png_bytep prev_filters;           
   png_uint_16p filter_weights;      
   png_uint_16p inv_filter_weights;  
   png_uint_16p filter_costs;        
   png_uint_16p inv_filter_costs;    
#line 1303 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



#line 1307 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




   png_uint_32 free_me;       
#line 1313 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_voidp user_chunk_ptr;
   png_user_chunk_ptr read_user_chunk_fn; 
#line 1318 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   int num_chunk_list;
   png_bytep chunk_list;
#line 1323 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



   png_byte rgb_to_gray_status;
   
   png_uint_16 rgb_to_gray_red_coeff;
   png_uint_16 rgb_to_gray_green_coeff;
   png_uint_16 rgb_to_gray_blue_coeff;
#line 1332 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"







   png_uint_32 mng_features_permitted;
#line 1343 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1344 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



   png_fixed_point int_gamma;
#line 1349 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



   png_byte filter_type;
#line 1354 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 1359 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"







#line 1367 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
   png_uint_32  asm_flags;
#line 1369 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1370 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



   png_voidp mem_ptr;                
   png_malloc_ptr malloc_fn;         
   png_free_ptr free_fn;             
#line 1377 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_bytep big_row_buf;         



   png_bytep dither_sort;            
   png_bytep index_to_palette;       
                                     
   png_bytep palette_to_index;       
                                     
#line 1389 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


   png_byte compression_type;


   png_uint_32 user_width_max;
   png_uint_32 user_height_max;
#line 1397 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



   
   png_unknown_chunk unknown_chunk;
#line 1403 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
};





typedef png_structp version_1_2_18;

typedef png_struct  *  * png_structpp;








extern  png_uint_32 __cdecl png_access_version_number (void);




extern  void __cdecl png_set_sig_bytes (png_structp png_ptr, int num_bytes);






extern  int __cdecl png_sig_cmp (png_bytep sig, png_size_t start, png_size_t num_to_check);




extern  int __cdecl png_check_sig (png_bytep sig, int num);


extern  png_structp __cdecl png_create_read_struct
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn);


extern  png_structp __cdecl png_create_write_struct
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn);


extern  png_uint_32 __cdecl png_get_compression_buffer_size
   (png_structp png_ptr);
#line 1455 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_compression_buffer_size
   (png_structp png_ptr, png_uint_32 size);
#line 1460 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  int __cdecl png_reset_zstream (png_structp png_ptr);



extern  png_structp __cdecl png_create_read_struct_2
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);
extern  png_structp __cdecl png_create_write_struct_2
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);
#line 1475 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_write_chunk (png_structp png_ptr, png_bytep chunk_name, png_bytep data, png_size_t length);


extern  void __cdecl png_write_chunk_start (png_structp png_ptr, png_bytep chunk_name, png_uint_32 length);


extern  void __cdecl png_write_chunk_data (png_structp png_ptr, png_bytep data, png_size_t length);


extern  void __cdecl png_write_chunk_end (png_structp png_ptr);


extern  png_infop __cdecl png_create_info_struct
   (png_structp png_ptr);



extern  void __cdecl png_info_init (png_infop info_ptr);



#line 1502 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  void __cdecl png_info_init_3 (png_infopp info_ptr, png_size_t png_info_struct_size);


extern  void __cdecl png_write_info_before_PLTE (png_structp png_ptr, png_infop info_ptr);
extern  void __cdecl png_write_info (png_structp png_ptr, png_infop info_ptr);



extern  void __cdecl png_read_info (png_structp png_ptr, png_infop info_ptr);
#line 1517 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 1522 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"











#line 1534 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1535 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_expand (png_structp png_ptr);

extern  void __cdecl png_set_expand_gray_1_2_4_to_8 (png_structp png_ptr);
#line 1543 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
extern  void __cdecl png_set_palette_to_rgb (png_structp png_ptr);
extern  void __cdecl png_set_tRNS_to_alpha (png_structp png_ptr);


extern  void __cdecl png_set_gray_1_2_4_to_8 (png_structp png_ptr);
#line 1549 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1550 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_bgr (png_structp png_ptr);
#line 1555 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_gray_to_rgb (png_structp png_ptr);
#line 1560 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




extern  void __cdecl png_set_rgb_to_gray (png_structp png_ptr, int error_action, double red, double green );
#line 1567 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
extern  void __cdecl png_set_rgb_to_gray_fixed (png_structp png_ptr, int error_action, png_fixed_point red, png_fixed_point green );
extern  png_byte __cdecl png_get_rgb_to_gray_status (png_structp png_ptr);
#line 1572 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  void __cdecl png_build_grayscale_palette (int bit_depth, png_colorp palette);


extern  void __cdecl png_set_strip_alpha (png_structp png_ptr);
#line 1579 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_swap_alpha (png_structp png_ptr);
#line 1584 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_invert_alpha (png_structp png_ptr);
#line 1589 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_filler (png_structp png_ptr, png_uint_32 filler, int flags);





extern  void __cdecl png_set_add_alpha (png_structp png_ptr, png_uint_32 filler, int flags);
#line 1602 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1603 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_swap (png_structp png_ptr);
#line 1608 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_packing (png_structp png_ptr);
#line 1613 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_packswap (png_structp png_ptr);
#line 1618 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_shift (png_structp png_ptr, png_color_8p true_bits);
#line 1624 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  int __cdecl png_set_interlace_handling (png_structp png_ptr);
#line 1630 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_invert_mono (png_structp png_ptr);
#line 1635 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




extern  void __cdecl png_set_background (png_structp png_ptr, png_color_16p background_color, int background_gamma_code, int need_expand, double background_gamma);
#line 1643 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 1648 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_strip_16 (png_structp png_ptr);
#line 1653 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_dither (png_structp png_ptr, png_colorp palette, int num_palette, int maximum_colors, png_uint_16p histogram, int full_dither);
#line 1660 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




extern  void __cdecl png_set_gamma (png_structp png_ptr, double screen_gamma, double default_file_gamma);
#line 1667 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1668 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





extern  void __cdecl png_permit_empty_plte (png_structp png_ptr, int empty_plte_permitted);
#line 1677 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1678 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_flush (png_structp png_ptr, int nrows);

extern  void __cdecl png_write_flush (png_structp png_ptr);
#line 1685 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_start_read_image (png_structp png_ptr);


extern  void __cdecl png_read_update_info (png_structp png_ptr, png_infop info_ptr);



extern  void __cdecl png_read_rows (png_structp png_ptr, png_bytepp row, png_bytepp display_row, png_uint_32 num_rows);
#line 1698 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_read_row (png_structp png_ptr, png_bytep row, png_bytep display_row);
#line 1705 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_read_image (png_structp png_ptr, png_bytepp image);
#line 1711 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_write_row (png_structp png_ptr, png_bytep row);


extern  void __cdecl png_write_rows (png_structp png_ptr, png_bytepp row, png_uint_32 num_rows);


extern  void __cdecl png_write_image (png_structp png_ptr, png_bytepp image);


extern  void __cdecl png_write_end (png_structp png_ptr, png_infop info_ptr);



extern  void __cdecl png_read_end (png_structp png_ptr, png_infop info_ptr);
#line 1733 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_destroy_info_struct (png_structp png_ptr, png_infopp info_ptr_ptr);


extern  void __cdecl png_destroy_read_struct (png_structpp png_ptr_ptr, png_infopp info_ptr_ptr, png_infopp end_info_ptr_ptr);


extern void png_read_destroy (png_structp png_ptr, png_infop info_ptr, png_infop end_info_ptr);


extern  void __cdecl png_destroy_write_struct
   (png_structpp png_ptr_ptr, png_infopp info_ptr_ptr);


extern void png_write_destroy (png_structp png_ptr);


extern  void __cdecl png_set_crc_action (png_structp png_ptr, int crit_action, int ancil_action);




























extern  void __cdecl png_set_filter (png_structp png_ptr, int method, int filters);























































extern  void __cdecl png_set_filter_heuristics (png_structp png_ptr, int heuristic_method, int num_weights, png_doublep filter_weights, png_doublep filter_costs);
#line 1845 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1846 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
















extern  void __cdecl png_set_compression_level (png_structp png_ptr, int level);

extern  void __cdecl png_set_compression_mem_level
   (png_structp png_ptr, int mem_level);

extern  void __cdecl png_set_compression_strategy
   (png_structp png_ptr, int strategy);

extern  void __cdecl png_set_compression_window_bits
   (png_structp png_ptr, int window_bits);

extern  void __cdecl png_set_compression_method (png_structp png_ptr, int method);













#line 1890 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"









extern  void __cdecl png_set_error_fn (png_structp png_ptr, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warning_fn);


extern  png_voidp __cdecl png_get_error_ptr (png_structp png_ptr);






extern  void __cdecl png_set_write_fn (png_structp png_ptr, png_voidp io_ptr, png_rw_ptr write_data_fn, png_flush_ptr output_flush_fn);


extern  void __cdecl png_set_read_fn (png_structp png_ptr, png_voidp io_ptr, png_rw_ptr read_data_fn);


extern  png_voidp __cdecl png_get_io_ptr (png_structp png_ptr);

extern  void __cdecl png_set_read_status_fn (png_structp png_ptr, png_read_status_ptr read_row_fn);

extern  void __cdecl png_set_write_status_fn (png_structp png_ptr, png_write_status_ptr write_row_fn);



extern  void __cdecl png_set_mem_fn (png_structp png_ptr, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);

extern  png_voidp __cdecl png_get_mem_ptr (png_structp png_ptr);
#line 1933 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_read_user_transform_fn (png_structp png_ptr, png_user_transform_ptr read_user_transform_fn);
#line 1939 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_write_user_transform_fn (png_structp png_ptr, png_user_transform_ptr write_user_transform_fn);
#line 1945 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_user_transform_info (png_structp png_ptr, png_voidp user_transform_ptr, int user_transform_depth, int user_transform_channels);

extern  png_voidp __cdecl png_get_user_transform_ptr
   (png_structp png_ptr);
#line 1956 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_read_user_chunk_fn (png_structp png_ptr, png_voidp user_chunk_ptr, png_user_chunk_ptr read_user_chunk_fn);
extern  png_voidp __cdecl png_get_user_chunk_ptr (png_structp png_ptr);
#line 1963 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





extern  void __cdecl png_set_progressive_read_fn (png_structp png_ptr, png_voidp progressive_ptr, png_progressive_info_ptr info_fn, png_progressive_row_ptr row_fn, png_progressive_end_ptr end_fn);


extern  png_voidp __cdecl png_get_progressive_ptr
   (png_structp png_ptr);


extern  void __cdecl png_process_data (png_structp png_ptr, png_infop info_ptr, png_bytep buffer, png_size_t buffer_size);




extern  void __cdecl png_progressive_combine_row (png_structp png_ptr, png_bytep old_row, png_bytep new_row);
#line 1987 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_voidp __cdecl png_malloc (png_structp png_ptr, png_uint_32 size);



#line 1994 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_voidp __cdecl png_malloc_warn (png_structp png_ptr, png_uint_32 size);
#line 1998 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_free (png_structp png_ptr, png_voidp ptr);








#line 2010 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_free_data (png_structp png_ptr, png_infop info_ptr, png_uint_32 free_me, int num);



extern  void __cdecl png_data_freer (png_structp png_ptr, png_infop info_ptr, int freer, png_uint_32 mask);
#line 2020 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




















extern  png_voidp __cdecl png_malloc_default (png_structp png_ptr, png_uint_32 size);
extern  void __cdecl png_free_default (png_structp png_ptr, png_voidp ptr);
#line 2045 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_voidp __cdecl png_memcpy_check (png_structp png_ptr, png_voidp s1, png_voidp s2, png_uint_32 size);

extern  png_voidp __cdecl png_memset_check (png_structp png_ptr, png_voidp s1, int value, png_uint_32 size);




#line 2056 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_error (png_structp png_ptr, png_const_charp error_message);


extern  void __cdecl png_chunk_error (png_structp png_ptr, png_const_charp error_message);


extern  void __cdecl png_warning (png_structp png_ptr, png_const_charp warning_message);


extern  void __cdecl png_chunk_warning (png_structp png_ptr, png_const_charp warning_message);














extern  png_uint_32 __cdecl png_get_valid (png_structp png_ptr, png_infop info_ptr, png_uint_32 flag);


extern  png_uint_32 __cdecl png_get_rowbytes (png_structp png_ptr, png_infop info_ptr);




extern  png_bytepp __cdecl png_get_rows (png_structp png_ptr, png_infop info_ptr);


extern  void __cdecl png_set_rows (png_structp png_ptr, png_infop info_ptr, png_bytepp row_pointers);
#line 2103 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_byte __cdecl png_get_channels (png_structp png_ptr, png_infop info_ptr);



extern  png_uint_32 __cdecl png_get_image_width (png_structp png_ptr, png_infop info_ptr);


extern  png_uint_32 __cdecl png_get_image_height (png_structp png_ptr, png_infop info_ptr);


extern  png_byte __cdecl png_get_bit_depth (png_structp png_ptr, png_infop info_ptr);


extern  png_byte __cdecl png_get_color_type (png_structp png_ptr, png_infop info_ptr);


extern  png_byte __cdecl png_get_filter_type (png_structp png_ptr, png_infop info_ptr);


extern  png_byte __cdecl png_get_interlace_type (png_structp png_ptr, png_infop info_ptr);


extern  png_byte __cdecl png_get_compression_type (png_structp png_ptr, png_infop info_ptr);


extern  png_uint_32 __cdecl png_get_pixels_per_meter (png_structp png_ptr, png_infop info_ptr);
extern  png_uint_32 __cdecl png_get_x_pixels_per_meter (png_structp png_ptr, png_infop info_ptr);
extern  png_uint_32 __cdecl png_get_y_pixels_per_meter (png_structp png_ptr, png_infop info_ptr);



extern  float __cdecl png_get_pixel_aspect_ratio (png_structp png_ptr, png_infop info_ptr);
#line 2150 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_int_32 __cdecl png_get_x_offset_pixels (png_structp png_ptr, png_infop info_ptr);
extern  png_int_32 __cdecl png_get_y_offset_pixels (png_structp png_ptr, png_infop info_ptr);
extern  png_int_32 __cdecl png_get_x_offset_microns (png_structp png_ptr, png_infop info_ptr);
extern  png_int_32 __cdecl png_get_y_offset_microns (png_structp png_ptr, png_infop info_ptr);

#line 2162 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_bytep __cdecl png_get_signature (png_structp png_ptr, png_infop info_ptr);


extern  png_uint_32 __cdecl png_get_bKGD (png_structp png_ptr, png_infop info_ptr, png_color_16p *background);
#line 2171 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_bKGD (png_structp png_ptr, png_infop info_ptr, png_color_16p background);
#line 2176 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  png_uint_32 __cdecl png_get_cHRM (png_structp png_ptr, png_infop info_ptr, double *white_x, double *white_y, double *red_x, double *red_y, double *green_x, double *green_y, double *blue_x, double *blue_y);
#line 2184 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_uint_32 __cdecl png_get_cHRM_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point *int_white_x, png_fixed_point *int_white_y, png_fixed_point *int_red_x, png_fixed_point *int_red_y, png_fixed_point *int_green_x, png_fixed_point *int_green_y, png_fixed_point *int_blue_x, png_fixed_point *int_blue_y);
#line 2191 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 2192 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_cHRM (png_structp png_ptr, png_infop info_ptr, double white_x, double white_y, double red_x, double red_y, double green_x, double green_y, double blue_x, double blue_y);
#line 2199 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  void __cdecl png_set_cHRM_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point int_white_x, png_fixed_point int_white_y, png_fixed_point int_red_x, png_fixed_point int_red_y, png_fixed_point int_green_x, png_fixed_point int_green_y, png_fixed_point int_blue_x, png_fixed_point int_blue_y);
#line 2206 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 2207 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  png_uint_32 __cdecl png_get_gAMA (png_structp png_ptr, png_infop info_ptr, double *file_gamma);
#line 2213 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
extern  png_uint_32 __cdecl png_get_gAMA_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point *int_file_gamma);
#line 2216 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_gAMA (png_structp png_ptr, png_infop info_ptr, double file_gamma);
#line 2222 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
extern  void __cdecl png_set_gAMA_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point int_file_gamma);
#line 2225 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_hIST (png_structp png_ptr, png_infop info_ptr, png_uint_16p *hist);
#line 2230 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_hIST (png_structp png_ptr, png_infop info_ptr, png_uint_16p hist);
#line 2235 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_uint_32 __cdecl png_get_IHDR (png_structp png_ptr, png_infop info_ptr, png_uint_32 *width, png_uint_32 *height, int *bit_depth, int *color_type, int *interlace_method, int *compression_method, int *filter_method);

extern  void __cdecl png_set_IHDR (png_structp png_ptr, png_infop info_ptr, png_uint_32 width, png_uint_32 height, int bit_depth, int color_type, int interlace_method, int compression_method, int filter_method);


extern  png_uint_32 __cdecl png_get_oFFs (png_structp png_ptr, png_infop info_ptr, png_int_32 *offset_x, png_int_32 *offset_y, int *unit_type);
#line 2251 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_oFFs (png_structp png_ptr, png_infop info_ptr, png_int_32 offset_x, png_int_32 offset_y, int unit_type);
#line 2257 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_pCAL (png_structp png_ptr, png_infop info_ptr, png_charp *purpose, png_int_32 *X0, png_int_32 *X1, int *type, int *nparams, png_charp *units, png_charpp *params);
#line 2263 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_pCAL (png_structp png_ptr, png_infop info_ptr, png_charp purpose, png_int_32 X0, png_int_32 X1, int type, int nparams, png_charp units, png_charpp params);
#line 2269 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_pHYs (png_structp png_ptr, png_infop info_ptr, png_uint_32 *res_x, png_uint_32 *res_y, int *unit_type);
#line 2274 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_pHYs (png_structp png_ptr, png_infop info_ptr, png_uint_32 res_x, png_uint_32 res_y, int unit_type);
#line 2279 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_uint_32 __cdecl png_get_PLTE (png_structp png_ptr, png_infop info_ptr, png_colorp *palette, int *num_palette);

extern  void __cdecl png_set_PLTE (png_structp png_ptr, png_infop info_ptr, png_colorp palette, int num_palette);


extern  png_uint_32 __cdecl png_get_sBIT (png_structp png_ptr, png_infop info_ptr, png_color_8p *sig_bit);
#line 2290 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_sBIT (png_structp png_ptr, png_infop info_ptr, png_color_8p sig_bit);
#line 2295 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_sRGB (png_structp png_ptr, png_infop info_ptr, int *intent);
#line 2300 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_sRGB (png_structp png_ptr, png_infop info_ptr, int intent);
extern  void __cdecl png_set_sRGB_gAMA_and_cHRM (png_structp png_ptr, png_infop info_ptr, int intent);
#line 2307 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_iCCP (png_structp png_ptr, png_infop info_ptr, png_charpp name, int *compression_type, png_charpp profile, png_uint_32 *proflen);
   
#line 2314 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_iCCP (png_structp png_ptr, png_infop info_ptr, png_charp name, int compression_type, png_charp profile, png_uint_32 proflen);
   
#line 2321 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_sPLT (png_structp png_ptr, png_infop info_ptr, png_sPLT_tpp entries);
#line 2326 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_sPLT (png_structp png_ptr, png_infop info_ptr, png_sPLT_tp entries, int nentries);
#line 2331 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  png_uint_32 __cdecl png_get_text (png_structp png_ptr, png_infop info_ptr, png_textp *text_ptr, int *num_text);
#line 2337 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"










extern  void __cdecl png_set_text (png_structp png_ptr, png_infop info_ptr, png_textp text_ptr, int num_text);
#line 2350 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 2355 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 2360 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  png_uint_32 __cdecl png_get_tRNS (png_structp png_ptr, png_infop info_ptr, png_bytep *trans, int *num_trans, png_color_16p *trans_values);
#line 2366 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern  void __cdecl png_set_tRNS (png_structp png_ptr, png_infop info_ptr, png_bytep trans, int num_trans, png_color_16p trans_values);
#line 2372 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


#line 2375 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  png_uint_32 __cdecl png_get_sCAL (png_structp png_ptr, png_infop info_ptr, int *unit, double *width, double *height);





#line 2386 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 2387 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_sCAL (png_structp png_ptr, png_infop info_ptr, int unit, double width, double height);





#line 2398 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 2399 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"











extern  void __cdecl png_set_keep_unknown_chunks (png_structp png_ptr, int keep, png_bytep chunk_list, int num_chunks);
extern  void __cdecl png_set_unknown_chunks (png_structp png_ptr, png_infop info_ptr, png_unknown_chunkp unknowns, int num_unknowns);
extern  void __cdecl png_set_unknown_chunk_location
   (png_structp png_ptr, png_infop info_ptr, int chunk, int location);
extern  png_uint_32 __cdecl png_get_unknown_chunks (png_structp png_ptr, png_infop info_ptr, png_unknown_chunkpp entries);
#line 2419 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 int __cdecl png_handle_as_unknown (png_structp png_ptr, png_bytep chunk_name);
#line 2423 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




extern  void __cdecl png_set_invalid (png_structp png_ptr, png_infop info_ptr, int mask);



extern  void __cdecl png_read_png (png_structp png_ptr, png_infop info_ptr, int transforms, png_voidp params);
extern  void __cdecl png_write_png (png_structp png_ptr, png_infop info_ptr, int transforms, png_voidp params);
#line 2441 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"












































#line 2486 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


#line 2489 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


#line 2492 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



#line 2496 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  png_charp __cdecl png_get_copyright (png_structp png_ptr);
extern  png_charp __cdecl png_get_header_ver (png_structp png_ptr);
extern  png_charp __cdecl png_get_header_version (png_structp png_ptr);
extern  png_charp __cdecl png_get_libpng_ver (png_structp png_ptr);


extern  png_uint_32 __cdecl png_permit_mng_features (png_structp png_ptr, png_uint_32 mng_features_permitted);
#line 2506 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



































#line 2542 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  png_uint_32 __cdecl png_get_mmx_flagmask
   (int flag_select, int *compilerID);


extern  png_uint_32 __cdecl png_get_asm_flagmask
   (int flag_select);


extern  png_uint_32 __cdecl png_get_asm_flags
   (png_structp png_ptr);


extern  png_byte __cdecl png_get_mmx_bitdepth_threshold
   (png_structp png_ptr);


extern  png_uint_32 __cdecl png_get_mmx_rowbytes_threshold
   (png_structp png_ptr);


extern  void __cdecl png_set_asm_flags
   (png_structp png_ptr, png_uint_32 asm_flags);


extern  void __cdecl png_set_mmx_thresholds
   (png_structp png_ptr, png_byte mmx_bitdepth_threshold, png_uint_32 mmx_rowbytes_threshold);

#line 2574 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  int __cdecl png_mmx_support (void);
#line 2579 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




extern  void __cdecl png_set_strip_error_numbers (png_structp png_ptr, png_uint_32 strip_mode);
#line 2586 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

#line 2588 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



extern  void __cdecl png_set_user_limits (png_structp png_ptr, png_uint_32 user_width_max, png_uint_32 user_height_max);
extern  png_uint_32 __cdecl png_get_user_width_max (png_structp png_ptr);
extern  png_uint_32 __cdecl png_get_user_height_max (png_structp png_ptr);
#line 2598 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
















 

























#line 2641 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"













#line 2655 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
extern  png_uint_32 __cdecl png_get_uint_32 (png_bytep buf);
extern  png_uint_16 __cdecl png_get_uint_16 (png_bytep buf);
extern  png_int_32 __cdecl png_get_int_32 (png_bytep buf);
#line 2659 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
extern  png_uint_32 __cdecl png_get_uint_31
  (png_structp png_ptr, png_bytep buf);




extern  void __cdecl png_save_uint_32
   (png_bytep buf, png_uint_32 i);
extern  void __cdecl png_save_int_32
   (png_bytep buf, png_int_32 i);





extern  void __cdecl png_save_uint_16
   (png_bytep buf, unsigned int i);













































                          














                       


                       
                       
                       
                       
                       



































                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  

































   extern  const png_byte  png_sig[8];




#line 2826 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 2827 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




























extern  const png_byte  png_IHDR[5];
extern  const png_byte  png_IDAT[5];
extern  const png_byte  png_IEND[5];
extern  const png_byte  png_PLTE[5];
extern  const png_byte  png_bKGD[5];
extern  const png_byte  png_cHRM[5];
extern  const png_byte  png_gAMA[5];
extern  const png_byte  png_hIST[5];
extern  const png_byte  png_iCCP[5];
extern  const png_byte  png_iTXt[5];
extern  const png_byte  png_oFFs[5];
extern  const png_byte  png_pCAL[5];
extern  const png_byte  png_sCAL[5];
extern  const png_byte  png_pHYs[5];
extern  const png_byte  png_sBIT[5];
extern  const png_byte  png_sPLT[5];
extern  const png_byte  png_sRGB[5];
extern  const png_byte  png_tEXt[5];
extern  const png_byte  png_tIME[5];
extern  const png_byte  png_tRNS[5];
extern  const png_byte  png_zTXt[5];
#line 2877 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





extern  void __cdecl png_read_init (png_structp png_ptr);



#line 2887 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  void __cdecl png_read_init_3 (png_structpp ptr_ptr, png_const_charp user_png_ver, png_size_t png_struct_size);

extern  void __cdecl png_read_init_2 (png_structp png_ptr, png_const_charp user_png_ver, png_size_t png_struct_size, png_size_t png_info_size);
#line 2895 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





extern  void __cdecl png_write_init (png_structp png_ptr);



#line 2905 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

extern  void __cdecl png_write_init_3 (png_structpp ptr_ptr, png_const_charp user_png_ver, png_size_t png_struct_size);
extern  void __cdecl png_write_init_2 (png_structp png_ptr, png_const_charp user_png_ver, png_size_t png_struct_size, png_size_t png_info_size);


 png_voidp png_create_struct (int type);


 void png_destroy_struct (png_voidp struct_ptr);

 png_voidp png_create_struct_2 (int type, png_malloc_ptr malloc_fn, png_voidp mem_ptr);
 void png_destroy_struct_2 (png_voidp struct_ptr, png_free_ptr free_fn, png_voidp mem_ptr);


 void png_info_destroy (png_structp png_ptr, png_infop info_ptr);



 voidpf png_zalloc (voidpf png_ptr, uInt items, uInt size);


 void png_zfree (voidpf png_ptr, voidpf ptr);









 void __cdecl png_default_read_data (png_structp png_ptr, png_bytep data, png_size_t length);


 void __cdecl png_push_fill_buffer (png_structp png_ptr, png_bytep buffer, png_size_t length);
#line 2949 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 void __cdecl png_default_write_data (png_structp png_ptr, png_bytep data, png_size_t length);




#line 2957 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 2958 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





#line 2964 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_reset_crc (png_structp png_ptr);


 void png_write_data (png_structp png_ptr, png_bytep data, png_size_t length);


 void png_read_data (png_structp png_ptr, png_bytep data, png_size_t length);


 void png_crc_read (png_structp png_ptr, png_bytep buf, png_size_t length);



 png_charp png_decompress_chunk (png_structp png_ptr, int comp_type, png_charp chunkdata, png_size_t chunklength, png_size_t prefix_length, png_size_t *data_length);
#line 2987 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 int png_crc_finish (png_structp png_ptr, png_uint_32 skip);


 int png_crc_error (png_structp png_ptr);





 void png_calculate_crc (png_structp png_ptr, png_bytep ptr, png_size_t length);


 void png_flush (png_structp png_ptr);
#line 3004 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_sig (png_structp png_ptr);






 void png_write_IHDR (png_structp png_ptr, png_uint_32 width, png_uint_32 height, int bit_depth, int color_type, int compression_method, int filter_method, int interlace_method);

 void png_write_PLTE (png_structp png_ptr, png_colorp palette, png_uint_32 num_pal);

 void png_write_IDAT (png_structp png_ptr, png_bytep data, png_size_t length);

 void png_write_IEND (png_structp png_ptr);



 void png_write_gAMA (png_structp png_ptr, double file_gamma);
#line 3030 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 void png_write_gAMA_fixed (png_structp png_ptr, png_fixed_point file_gamma);
#line 3034 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3035 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_sBIT (png_structp png_ptr, png_color_8p sbit, int color_type);
#line 3040 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



 void png_write_cHRM (png_structp png_ptr, double white_x, double white_y, double red_x, double red_y, double green_x, double green_y, double blue_x, double blue_y);
#line 3048 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 void png_write_cHRM_fixed (png_structp png_ptr, png_fixed_point int_white_x, png_fixed_point int_white_y, png_fixed_point int_red_x, png_fixed_point int_red_y, png_fixed_point int_green_x, png_fixed_point int_green_y, png_fixed_point int_blue_x, png_fixed_point int_blue_y);
#line 3055 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3056 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_sRGB (png_structp png_ptr, int intent);
#line 3061 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_iCCP (png_structp png_ptr, png_charp name, int compression_type, png_charp profile, int proflen);
   
#line 3068 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_sPLT (png_structp png_ptr, png_sPLT_tp palette);
#line 3073 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_tRNS (png_structp png_ptr, png_bytep trans, png_color_16p values, int number, int color_type);
#line 3078 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_bKGD (png_structp png_ptr, png_color_16p values, int color_type);
#line 3083 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_hIST (png_structp png_ptr, png_uint_16p hist, int num_hist);
#line 3088 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 png_size_t png_check_keyword (png_structp png_ptr, png_charp key, png_charpp new_key);
#line 3094 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_tEXt (png_structp png_ptr, png_charp key, png_charp text, png_size_t text_len);
#line 3099 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_zTXt (png_structp png_ptr, png_charp key, png_charp text, png_size_t text_len, int compression);
#line 3104 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





#line 3110 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 int png_set_text_2 (png_structp png_ptr, png_infop info_ptr, png_textp text_ptr, int num_text);
#line 3115 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_oFFs (png_structp png_ptr, png_int_32 x_offset, png_int_32 y_offset, int unit_type);
#line 3120 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_pCAL (png_structp png_ptr, png_charp purpose, png_int_32 X0, png_int_32 X1, int type, int nparams, png_charp units, png_charpp params);
#line 3126 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_pHYs (png_structp png_ptr, png_uint_32 x_pixels_per_unit, png_uint_32 y_pixels_per_unit, int unit_type);
#line 3132 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 3137 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





#line 3143 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 void png_write_sCAL_s (png_structp png_ptr, int unit, png_charp width, png_charp height);
#line 3147 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3148 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3149 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_write_finish_row (png_structp png_ptr);


 void png_write_start_row (png_structp png_ptr);


 void png_build_gamma_table (png_structp png_ptr);
#line 3159 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_combine_row (png_structp png_ptr, png_bytep row, int mask);







 void png_do_read_interlace (png_structp png_ptr);
#line 3172 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





 void png_do_write_interlace (png_row_infop row_info, png_bytep row, int pass);
#line 3180 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_read_filter_row (png_structp png_ptr, png_row_infop row_info, png_bytep row, png_bytep prev_row, int filter);


 void png_write_find_filter (png_structp png_ptr, png_row_infop row_info);


 void png_write_filtered_row (png_structp png_ptr, png_bytep filtered_row);

 void png_read_finish_row (png_structp png_ptr);


 void png_read_start_row (png_structp png_ptr);

 void png_read_transform_info (png_structp png_ptr, png_infop info_ptr);



 void png_do_read_filler (png_row_infop row_info, png_bytep row, png_uint_32 filler, png_uint_32 flags);
#line 3206 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_read_swap_alpha (png_row_infop row_info, png_bytep row);
#line 3211 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_write_swap_alpha (png_row_infop row_info, png_bytep row);
#line 3216 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_read_invert_alpha (png_row_infop row_info, png_bytep row);
#line 3221 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_write_invert_alpha (png_row_infop row_info, png_bytep row);
#line 3226 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_strip_filler (png_row_infop row_info, png_bytep row, png_uint_32 flags);
#line 3232 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_swap (png_row_infop row_info, png_bytep row);
#line 3236 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_packswap (png_row_infop row_info, png_bytep row);
#line 3240 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 int png_do_rgb_to_gray (png_structp png_ptr, png_row_infop row_info, png_bytep row);
#line 3245 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_gray_to_rgb (png_row_infop row_info, png_bytep row);
#line 3250 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_unpack (png_row_infop row_info, png_bytep row);
#line 3254 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_unshift (png_row_infop row_info, png_bytep row, png_color_8p sig_bits);
#line 3259 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_invert (png_row_infop row_info, png_bytep row);
#line 3263 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_chop (png_row_infop row_info, png_bytep row);
#line 3267 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_dither (png_row_infop row_info, png_bytep row, png_bytep palette_lookup, png_bytep dither_lookup);




#line 3276 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3277 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_bgr (png_row_infop row_info, png_bytep row);
#line 3281 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_pack (png_row_infop row_info, png_bytep row, png_uint_32 bit_depth);
#line 3286 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_shift (png_row_infop row_info, png_bytep row, png_color_8p bit_depth);
#line 3291 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



 void png_do_background (png_row_infop row_info, png_bytep row, png_color_16p trans_values, png_color_16p background, png_color_16p background_1, png_bytep gamma_table, png_bytep gamma_from_1, png_bytep gamma_to_1, png_uint_16pp gamma_16, png_uint_16pp gamma_16_from_1, png_uint_16pp gamma_16_to_1, int gamma_shift);



#line 3304 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3305 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_gamma (png_row_infop row_info, png_bytep row, png_bytep gamma_table, png_uint_16pp gamma_16_table, int gamma_shift);
#line 3311 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_expand_palette (png_row_infop row_info, png_bytep row, png_colorp palette, png_bytep trans, int num_trans);
 void png_do_expand (png_row_infop row_info, png_bytep row, png_color_16p trans_value);
#line 3318 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"






 void png_handle_IHDR (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
 void png_handle_PLTE (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
 void png_handle_IEND (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);


 void png_handle_bKGD (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3335 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_cHRM (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3340 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_gAMA (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3345 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_hIST (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3350 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern void png_handle_iCCP (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3355 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 3360 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_oFFs (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3365 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_pCAL (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3370 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_pHYs (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3375 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_sBIT (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3380 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 3385 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


extern void png_handle_sPLT (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3390 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_sRGB (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3395 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_tEXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3400 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"




#line 3405 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_tRNS (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3410 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_handle_zTXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3415 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 void png_handle_unknown (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);

 void png_check_chunk_name (png_structp png_ptr, png_bytep chunk_name);


 void png_do_read_transformations (png_structp png_ptr);
 void png_do_write_transformations (png_structp png_ptr);

 void png_init_read_transformations (png_structp png_ptr);


 void png_push_read_chunk (png_structp png_ptr, png_infop info_ptr);
 void png_push_read_sig (png_structp png_ptr, png_infop info_ptr);
 void png_push_check_crc (png_structp png_ptr);
 void png_push_crc_skip (png_structp png_ptr, png_uint_32 length);
 void png_push_crc_finish (png_structp png_ptr);
 void png_push_save_buffer (png_structp png_ptr);
 void png_push_restore_buffer (png_structp png_ptr, png_bytep buffer, png_size_t buffer_length);
 void png_push_read_IDAT (png_structp png_ptr);
 void png_process_IDAT_data (png_structp png_ptr, png_bytep buffer, png_size_t buffer_length);
 void png_push_process_row (png_structp png_ptr);
 void png_push_handle_unknown (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
 void png_push_have_info (png_structp png_ptr, png_infop info_ptr);
 void png_push_have_end (png_structp png_ptr, png_infop info_ptr);
 void png_push_have_row (png_structp png_ptr, png_bytep row);
 void png_push_read_end (png_structp png_ptr, png_infop info_ptr);
 void png_process_some_data (png_structp png_ptr, png_infop info_ptr);
 void png_read_push_finish_row (png_structp png_ptr);

 void png_push_handle_tEXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
 void png_push_read_tEXt (png_structp png_ptr, png_infop info_ptr);
#line 3462 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

 void png_push_handle_zTXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
 void png_push_read_zTXt (png_structp png_ptr, png_infop info_ptr);
#line 3468 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





#line 3474 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

#line 3476 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"


 void png_do_read_intrapixel (png_row_infop row_info, png_bytep row);
 void png_do_write_intrapixel (png_row_infop row_info, png_bytep row);
#line 3483 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





#line 3489 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 3490 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





















#line 3512 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"



#line 3516 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"





#line 3522 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"

#line 3524 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\../engine/zdm_memory.h"






#line 8 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\../engine/zdm_memory.h"



#line 12 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\../engine/zdm_memory.h"

	

#line 16 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\../engine/zdm_memory.h"





extern  void			*zdm_alloc				(int size,int n);
extern  void			*zdm_realloc			(void *ptr,int new_size);
extern  void			 zdm_free_memory		(void *ptr);
extern  void			 *zdm_zero				(void *ptr,int size);
extern  void			 *zdm_memset			(void *ptr,int c,int size);
extern  void			 *zdm_memcpy			(void *dest,const void *src,int len);
extern  void			 zdm_memmove			(void *dest,const void *src,int len);
extern  void          *zdm_memchr				(void *p,int c,int len);
extern  int			 zdm_memcmp				(const void *p1,const void *p2,int len);
extern int errno;



#line 3525 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 1 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\../engine/zdm_string.h"




extern  void			 zdm_copy_string		(char *dest,int len	,const char *src);
extern  void			 zdm_add_string			(char *dest,int len	,const char *src);
extern  void			 zdm_add_int			(char *dest,int len	,unsigned int i);
extern  void			 zdm_add_float			(char *dest,int len	,float f);
extern  int			 zdm_compare_string		(const char *src	,const char *dst);
extern  int			 zdm_compare_stringn	(const char *src	,const char *dst,unsigned int len);
extern  unsigned int	 zdm_string_len			(const char *string);



#line 3526 "h:\\coding\\s!p\\zdm\\libpng-1.2.18\\png.h"
#line 18 ".\\pngerror.c"


static void 
png_default_error (png_structp png_ptr, png_const_charp error_message);
static void 
png_default_warning (png_structp png_ptr, png_const_charp warning_message);






void __cdecl
png_error(png_structp png_ptr, png_const_charp error_message)
{

   char msg[16];
   if (png_ptr != 0)
   {
     if (png_ptr->flags&
       (0x40000L|0x80000L))
     {
       if (*error_message == '#')
       {
           int offset;
           for (offset=1; offset<15; offset++)
              if (*(error_message+offset) == ' ')
                  break;
           if (png_ptr->flags&0x80000L)
           {
              int i;
              for (i=0; i<offset-1; i++)
                 msg[i]=error_message[i+1];
              msg[i]='\0';
              error_message=msg;
           }
           else
              error_message+=offset;
       }
       else
       {
           if (png_ptr->flags&0x80000L)
           {
              msg[0]='0';
              msg[1]='\0';
              error_message=msg;
           }
       }
     }
   }
#line 70 ".\\pngerror.c"
   if (png_ptr != 0 && png_ptr->error_fn != 0)
      (*(png_ptr->error_fn))(png_ptr, error_message);

   

   png_default_error(png_ptr, error_message);
}






void __cdecl
png_warning(png_structp png_ptr, png_const_charp warning_message)
{
   int offset = 0;
   if (png_ptr != 0)
   {

   if (png_ptr->flags&
     (0x40000L|0x80000L))
#line 93 ".\\pngerror.c"
     {
       if (*warning_message == '#')
       {
           for (offset=1; offset<15; offset++)
              if (*(warning_message+offset) == ' ')
                  break;
       }
     }
     if ((png_ptr != 0) && (png_ptr->warning_fn != 0))
        (*(png_ptr->warning_fn))(png_ptr, warning_message+offset);
   }
   else
      png_default_warning(png_ptr, warning_message+offset);
}








const static const char png_digit[16] = {
   '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
   'A', 'B', 'C', 'D', 'E', 'F'
};

































































static void 
png_default_error(png_structp png_ptr, png_const_charp error_message)
{



























   if (png_ptr)
   {







	
#line 225 ".\\pngerror.c"
   }
#line 227 ".\\pngerror.c"

    ;
   if (&error_message != 0)
      return;
#line 232 ".\\pngerror.c"
}






static void 
png_default_warning(png_structp png_ptr, png_const_charp warning_message)
{

























    ;
   if (warning_message)
     return;
#line 271 ".\\pngerror.c"
    ;
   if (png_ptr)
      return;
}






void __cdecl
png_set_error_fn(png_structp png_ptr, png_voidp error_ptr,
   png_error_ptr error_fn, png_error_ptr warning_fn)
{
   if (png_ptr == 0)
      return;
   png_ptr->error_ptr = error_ptr;
   png_ptr->error_fn = error_fn;
   png_ptr->warning_fn = warning_fn;
}






png_voidp __cdecl
png_get_error_ptr(png_structp png_ptr)
{
   if (png_ptr == 0)
      return 0;
   return ((png_voidp)png_ptr->error_ptr);
}



void __cdecl
png_set_strip_error_numbers(png_structp png_ptr, png_uint_32 strip_mode)
{
   if(png_ptr != 0)
   {
     png_ptr->flags &=
       ((~(0x40000L|0x80000L))&strip_mode);
   }
}
#line 317 ".\\pngerror.c"
#line 318 ".\\pngerror.c"
