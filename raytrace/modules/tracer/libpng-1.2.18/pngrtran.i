#line 1 ".\\pngrtran.c"
















#line 1 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

























































































































































































































































































































































































  



















#line 1 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"

































#line 1 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"































































#line 65 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 68 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 71 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"




#line 76 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"






#line 83 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
























#line 108 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 111 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 114 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 117 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"



#line 121 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"










#line 132 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"







#line 140 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
#line 141 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"








#line 150 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"














                        






#line 172 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
#line 173 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"





























   











   

















#line 233 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"











#line 245 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"












	
		










			
				
			#line 272 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
			
				
			#line 275 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
			
				
			#line 278 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
		#line 279 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
	#line 280 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
	










#line 292 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 295 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


typedef unsigned char  Byte;  
#line 299 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
typedef unsigned int   uInt;  
typedef unsigned long  uLong; 





   typedef Byte   Bytef;
#line 308 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
typedef char   charf;
typedef int    intf;
typedef uInt   uIntf;
typedef uLong  uLongf;


   typedef void const *voidpc;
   typedef void    *voidpf;
   typedef void       *voidp;




#line 322 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"








#line 331 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"




#line 336 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"


#line 339 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"



#line 343 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"






#line 350 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
















#line 367 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"

#line 369 "c:\\dev\\devos_svn\\tree\\zlib-1.2.3\\zconf.h"
#line 35 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"










































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

































                        

















































                        

extern  const char *  zlibVersion (void);





























extern int  deflate (z_streamp strm, int flush);





















































































extern int  deflateEnd (z_streamp strm);


































extern int  inflate (z_streamp strm, int flush);


































































































extern int  inflateEnd (z_streamp strm);










                        
































































extern int  deflateSetDictionary (z_streamp strm, const Bytef *dictionary, uInt dictLength);
#line 541 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"




































extern int  deflateCopy (z_streamp dest, z_streamp source);
#line 579 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"
















extern int  deflateReset (z_streamp strm);










extern int  deflateParams (z_streamp strm, int level, int strategy);
#line 609 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"


















extern int  deflateTune (z_streamp strm, int good_length, int max_lazy, int nice_length, int max_chain);
#line 632 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"












extern uLong  deflateBound (z_streamp strm, uLong sourceLen);
#line 646 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"







extern int  deflatePrime (z_streamp strm, int bits, int value);
#line 656 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"













extern int  deflateSetHeader (z_streamp strm, gz_headerp head);
#line 671 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"

































































extern int  inflateSetDictionary (z_streamp strm, const Bytef *dictionary, uInt dictLength);
#line 739 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"



















extern int  inflateSync (z_streamp strm);














extern int  inflateCopy (z_streamp dest, z_streamp source);
#line 775 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"














extern int  inflateReset (z_streamp strm);









extern int  inflatePrime (z_streamp strm, int bits, int value);
#line 802 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"













extern int  inflateGetHeader (z_streamp strm, gz_headerp head);
#line 817 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"




























































typedef unsigned (*in_func) (void  *, unsigned char  *  *);
typedef int (*out_func) (void  *, unsigned char  *, unsigned);

extern int  inflateBack (z_streamp strm, in_func in, void  *in_desc, out_func out, void  *out_desc);
#line 883 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"


































































extern int  inflateBackEnd (z_streamp strm);







extern uLong  zlibCompileFlags (void);









































                        









extern int  compress (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);
#line 1011 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"













extern int  compress2 (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level);
#line 1027 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"













extern uLong  compressBound (uLong sourceLen);






extern int  uncompress (Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen);
#line 1049 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"

















typedef voidp gzFile;

extern gzFile  gzopen  (const char *path, const char *mode);
















extern gzFile  gzdopen  (int fd, const char *mode);












extern int  gzsetparams (gzFile file, int level, int strategy);







extern int     gzread  (gzFile file, voidp buf, unsigned len);







extern int     gzwrite (gzFile file, voidpc buf, unsigned len);
#line 1116 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"






extern int    gzprintf (gzFile file, const char *format, ...);












extern int  gzputs (gzFile file, const char *s);






extern  char *  gzgets (gzFile file, char *buf, int len);








extern int     gzputc (gzFile file, int c);





extern int     gzgetc (gzFile file);





extern int     gzungetc (int c, gzFile file);









extern int     gzflush (gzFile file, int flush);









extern long     gzseek (gzFile file, long offset, int whence);
#line 1185 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"
















extern int     gzrewind (gzFile file);






extern long     gztell (gzFile file);








extern int  gzeof (gzFile file);





extern int  gzdirect (gzFile file);





extern int     gzclose (gzFile file);






extern  const char *  gzerror (gzFile file, int *errnum);








extern void  gzclearerr (gzFile file);






                        







extern uLong  adler32 (uLong adler, const Bytef *buf, uInt len);















extern uLong  adler32_combine (uLong adler1, uLong adler2, long len2);
#line 1278 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"







extern uLong  crc32   (uLong crc, const Bytef *buf, uInt len);















extern uLong  crc32_combine (uLong crc1, uLong crc2, long len2);










                        




extern int  deflateInit_ (z_streamp strm, int level, const char *version, int stream_size);
#line 1319 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"
extern int  inflateInit_ (z_streamp strm, const char *version, int stream_size);
#line 1321 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"
extern int  deflateInit2_ (z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size);
#line 1325 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"
extern int  inflateInit2_ (z_streamp strm, int windowBits, const char *version, int stream_size);
#line 1327 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"
extern int  inflateBackInit_ (z_streamp strm, int windowBits, unsigned char  *window, const char *version, int stream_size);
#line 1331 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"















    struct internal_state {int dummy;}; 
#line 1348 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"

extern  const char   *  zError           (int);
extern int             inflateSyncPoint (z_streamp z);
extern  const uLongf *  get_crc_table    (void);





#line 1358 "C:\\dev\\devos_svn\\tree\\/zlib-1.2.3\\zlib.h"

#line 399 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 400 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


#line 1 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




























































































#line 94 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 100 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 106 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 113 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 114 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 119 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 120 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"











#line 132 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"













































































#line 210 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"










 
 
 








#line 232 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"























#line 256 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"























#line 280 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 282 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"








#line 292 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 293 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 298 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 302 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



































#line 338 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




























#line 367 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 369 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 375 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 376 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 381 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 387 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

 














#line 404 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 407 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 410 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"










#line 421 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 428 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 430 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"










#line 441 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





































#line 479 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 482 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 485 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 486 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"








#line 495 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

































#line 530 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 534 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 541 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 546 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 549 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 552 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 555 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 558 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 561 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 564 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 567 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 570 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 573 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 576 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 579 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 582 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 585 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 588 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 591 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 594 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 597 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 598 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 603 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
              






#line 611 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 612 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 619 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 620 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 622 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 629 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 634 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 637 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 640 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 643 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 646 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 649 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 652 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 655 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 658 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 661 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 662 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 669 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 675 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 679 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 685 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 686 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 688 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 693 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 694 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 700 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 701 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"























#line 725 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"













#line 739 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 743 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 747 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 751 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 752 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"










#line 763 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 764 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 771 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 772 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 773 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 780 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 783 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"







































#line 825 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 831 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"











#line 843 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 847 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 851 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 855 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 859 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"











#line 871 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 875 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"







#line 883 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 887 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 891 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 895 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 899 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"







#line 907 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 911 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 916 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 919 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 920 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"









#line 931 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 934 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 939 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 941 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"













#line 955 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 961 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 967 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 973 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 979 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"













#line 993 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 999 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 1004 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1005 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1011 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1017 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1023 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1029 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1035 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"











#line 1047 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1053 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"









#line 1063 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1064 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





#line 1071 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 1073 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"







#line 1081 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"







#line 1089 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"










typedef unsigned long png_uint_32;
typedef long png_int_32;
typedef unsigned short png_uint_16;
typedef short png_int_16;
typedef unsigned char png_byte;







   typedef unsigned int png_size_t;

#line 1114 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"















































#line 1162 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1163 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"









#line 1173 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



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
#line 1200 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


typedef png_byte         *  * png_bytepp;
typedef png_uint_32      *  * png_uint_32pp;
typedef png_int_32       *  * png_int_32pp;
typedef png_uint_16      *  * png_uint_16pp;
typedef png_int_16       *  * png_int_16pp;
typedef const char   *  * png_const_charpp;
typedef char             *  * png_charpp;
typedef png_fixed_point  *  * png_fixed_point_pp;

typedef double           *  * png_doublepp;
#line 1213 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


typedef char             *  *  * png_charppp;








typedef charf *         png_zcharp;
typedef charf *  *   png_zcharpp;
typedef z_stream  *  png_zstreamp;
#line 1228 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





















#line 1250 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






















#line 1273 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"








#line 1282 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 1284 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1285 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 1292 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"












#line 1305 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 1309 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"












#line 1324 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"



#line 1329 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





























#line 1359 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"









#line 1369 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





















#line 1391 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"




#line 1396 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1397 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"







#line 1405 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"






#line 1412 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"













#line 1426 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"








#line 1435 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"








#line 1444 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"













#line 1458 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 1461 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"





















#line 1 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"























	
	

	

#line 30 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"
		
		

		
	#line 35 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"

	
	typedef __int64					int64_t;
	typedef unsigned __int64		uint64_t;
#line 40 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"





	














#line 61 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"
	typedef long			ptrdiff_t;
	typedef unsigned int	size_t;
	

	
	
	
	
	
	
	
	

#line 75 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"




typedef enum
{
	MSVC_STDCALL_32	=	1,
	MSVC_CDECL_32	=	2,
	GCC_STDCALL_32	=	3,
	GCC_CDECL_32	=	4
}mod_name_decoration_t;

typedef union
{
	struct {
		uint64_t	val;
	}uint64;
	struct {
		unsigned int low;
		unsigned int hi;
	}uint32;
}large_uint_t;

#line 99 "C:\\dev\\devos_svn\\tree\\include/c\\std_def.h"
#line 1483 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1484 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"
#line 1485 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"


#line 1488 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 1490 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\pngconf.h"

#line 403 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

















#line 421 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 425 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 427 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 428 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"














































#line 475 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"







extern  const char png_libpng_ver[18];
  


#line 487 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  const int  png_pass_start[7];
extern  const int  png_pass_inc[7];
extern  const int  png_pass_ystart[7];
extern  const int  png_pass_yinc[7];
extern  const int  png_pass_mask[7];
extern  const int  png_pass_dsp_mask[7];






#line 504 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 506 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





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
#line 603 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

















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
#line 651 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"








































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
#line 727 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


    
    
   png_byte srgb_intent; 
#line 733 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   







   int num_text; 
   int max_text; 
   png_textp text; 
#line 747 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"






#line 754 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   





   png_color_8 sig_bit; 
#line 764 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   








   png_bytep trans; 
   png_color_16 trans_values; 
#line 779 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   





   png_color_16 background;
#line 789 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   




   png_int_32 x_offset; 
   png_int_32 y_offset; 
   png_byte offset_unit_type; 
#line 800 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   



   png_uint_32 x_pixels_per_unit; 
   png_uint_32 y_pixels_per_unit; 
   png_byte phys_unit_type; 
#line 810 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   





   png_uint_16p hist;
#line 820 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   






   float x_white;
   float y_white;
   float x_red;
   float y_red;
   float x_green;
   float y_green;
   float x_blue;
   float y_blue;
#line 838 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 839 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   










   png_charp pcal_purpose;  
   png_int_32 pcal_X0;      
   png_int_32 pcal_X1;      
   png_charp pcal_units;    
   png_charpp pcal_params;  
   png_byte pcal_type;      
   png_byte pcal_nparams;   
#line 860 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



   png_uint_32 free_me;     
#line 865 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   
   png_unknown_chunkp unknown_chunks;
   png_size_t unknown_chunks_num;
#line 871 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   
   png_charp iccp_name;     
   png_charp iccp_profile;  
                            
   png_uint_32 iccp_proflen;  
   png_byte iccp_compression; 
#line 880 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   
   png_sPLT_tp splt_palettes;
   png_uint_32 splt_palettes_num;
#line 886 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   






   png_byte scal_unit;         

   double scal_pixel_width;    
   double scal_pixel_height;   
#line 900 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

   png_charp scal_s_width;     
   png_charp scal_s_height;    
#line 904 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 905 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   
   
   png_bytepp row_pointers;        
#line 911 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_fixed_point int_gamma; 
#line 915 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_fixed_point int_x_white;
   png_fixed_point int_y_white;
   png_fixed_point int_x_red;
   png_fixed_point int_y_red;
   png_fixed_point int_x_green;
   png_fixed_point int_y_green;
   png_fixed_point int_x_blue;
   png_fixed_point int_y_blue;
#line 926 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

} png_info;

typedef png_info  * png_infop;
typedef png_info  *  * png_infopp;








#line 940 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





























































































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

typedef void (__stdcall *png_error_ptr) (png_structp, png_const_charp);
typedef void (__stdcall *png_rw_ptr) (png_structp, png_bytep, png_size_t);
typedef void (__stdcall *png_flush_ptr) (png_structp);
typedef void (__stdcall *png_read_status_ptr) (png_structp, png_uint_32, int);
#line 1060 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
typedef void (__stdcall *png_write_status_ptr) (png_structp, png_uint_32, int);
#line 1062 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


typedef void (__stdcall *png_progressive_info_ptr) (png_structp, png_infop);
typedef void (__stdcall *png_progressive_end_ptr) (png_structp, png_infop);
typedef void (__stdcall *png_progressive_row_ptr) (png_structp, png_bytep, png_uint_32, int);
#line 1068 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1069 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


typedef void (__stdcall *png_user_transform_ptr) (png_structp, png_row_infop, png_bytep);
#line 1075 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1076 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


typedef int (__stdcall *png_user_chunk_ptr) (png_structp, png_unknown_chunkp);
#line 1080 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

typedef void (__stdcall *png_unknown_chunk_ptr) (png_structp);
#line 1083 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





















typedef png_voidp (*png_malloc_ptr) (png_structp, png_size_t);
typedef void (*png_free_ptr) (png_structp, png_voidp);








struct png_struct_def
{



   png_error_ptr error_fn;    
   png_error_ptr warning_fn;  
   png_voidp error_ptr;       
   png_rw_ptr write_data_fn;  
   png_rw_ptr read_data_fn;   
   png_voidp io_ptr;          


   png_user_transform_ptr read_user_transform_fn; 
#line 1129 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_user_transform_ptr write_user_transform_fn; 
#line 1133 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




   png_voidp user_transform_ptr; 
   png_byte user_transform_depth;    
   png_byte user_transform_channels; 
#line 1142 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1143 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

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
#line 1198 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1199 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_byte background_gamma_type;

   float background_gamma;
#line 1205 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
   png_color_16 background;   

   png_color_16 background_1; 
#line 1209 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1210 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_flush_ptr output_flush_fn;
   png_uint_32 flush_dist;    
   png_uint_32 flush_rows;    
#line 1216 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   int gamma_shift;      

   float gamma;          
   float screen_gamma;   
#line 1223 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1224 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_bytep gamma_table;     
   png_bytep gamma_from_1;    
   png_bytep gamma_to_1;      
   png_uint_16pp gamma_16_table; 
   png_uint_16pp gamma_16_from_1; 
   png_uint_16pp gamma_16_to_1; 
#line 1233 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_color_8 sig_bit;       
#line 1237 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_color_8 shift;         
#line 1241 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_bytep trans;           
   png_color_16 trans_values; 
#line 1247 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

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
#line 1273 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 1275 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"








#line 1284 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_bytep palette_lookup;         
   png_bytep dither_index;           
#line 1289 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_uint_16p hist;                
#line 1293 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_byte heuristic_method;        
   png_byte num_prev_filters;        
   png_bytep prev_filters;           
   png_uint_16p filter_weights;      
   png_uint_16p inv_filter_weights;  
   png_uint_16p filter_costs;        
   png_uint_16p inv_filter_costs;    
#line 1303 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 1307 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




   png_uint_32 free_me;       
#line 1313 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_voidp user_chunk_ptr;
   png_user_chunk_ptr read_user_chunk_fn; 
#line 1318 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   int num_chunk_list;
   png_bytep chunk_list;
#line 1323 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



   png_byte rgb_to_gray_status;
   
   png_uint_16 rgb_to_gray_red_coeff;
   png_uint_16 rgb_to_gray_green_coeff;
   png_uint_16 rgb_to_gray_blue_coeff;
#line 1332 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"







   png_uint_32 mng_features_permitted;
#line 1343 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1344 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



   png_fixed_point int_gamma;
#line 1349 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



   png_byte filter_type;
#line 1354 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 1359 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"







#line 1367 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
   png_uint_32  asm_flags;
#line 1369 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1370 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



   png_voidp mem_ptr;                
   png_malloc_ptr malloc_fn;         
   png_free_ptr free_fn;             
#line 1377 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_bytep big_row_buf;         



   png_bytep dither_sort;            
   png_bytep index_to_palette;       
                                     
   png_bytep palette_to_index;       
                                     
#line 1389 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


   png_byte compression_type;


   png_uint_32 user_width_max;
   png_uint_32 user_height_max;
#line 1397 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



   
   png_unknown_chunk unknown_chunk;
#line 1403 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
};





typedef png_structp version_1_2_18;

typedef png_struct  *  * png_structpp;








extern  png_uint_32 __stdcall png_access_version_number (void);




extern  void __stdcall png_set_sig_bytes (png_structp png_ptr, int num_bytes);
#line 1427 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"






extern  int __stdcall png_sig_cmp (png_bytep sig, png_size_t start, png_size_t num_to_check);
#line 1435 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  int __stdcall png_check_sig (png_bytep sig, int num);


extern  png_structp __stdcall png_create_read_struct
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn);
#line 1445 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_structp __stdcall png_create_write_struct
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn);
#line 1450 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_compression_buffer_size
   (png_structp png_ptr);
#line 1455 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_compression_buffer_size
   (png_structp png_ptr, png_uint_32 size);
#line 1460 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  int __stdcall png_reset_zstream (png_structp png_ptr);



extern  png_structp __stdcall png_create_read_struct_2
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);
#line 1470 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_structp __stdcall png_create_write_struct_2
   (png_const_charp user_png_ver, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warn_fn, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);
#line 1474 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1475 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_chunk (png_structp png_ptr, png_bytep chunk_name, png_bytep data, png_size_t length);
#line 1479 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_chunk_start (png_structp png_ptr, png_bytep chunk_name, png_uint_32 length);
#line 1483 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_chunk_data (png_structp png_ptr, png_bytep data, png_size_t length);
#line 1487 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_chunk_end (png_structp png_ptr);


extern  png_infop __stdcall png_create_info_struct
   (png_structp png_ptr);



extern  void __stdcall png_info_init (png_infop info_ptr);



#line 1502 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_info_init_3 (png_infopp info_ptr, png_size_t png_info_struct_size);
#line 1505 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_info_before_PLTE (png_structp png_ptr, png_infop info_ptr);
#line 1509 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_write_info (png_structp png_ptr, png_infop info_ptr);
#line 1511 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_read_info (png_structp png_ptr, png_infop info_ptr);
#line 1516 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1517 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 1522 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"











#line 1534 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1535 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_expand (png_structp png_ptr);

extern  void __stdcall png_set_expand_gray_1_2_4_to_8 (png_structp png_ptr);
#line 1542 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1543 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_set_palette_to_rgb (png_structp png_ptr);
extern  void __stdcall png_set_tRNS_to_alpha (png_structp png_ptr);


extern  void __stdcall png_set_gray_1_2_4_to_8 (png_structp png_ptr);
#line 1549 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1550 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_bgr (png_structp png_ptr);
#line 1555 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_gray_to_rgb (png_structp png_ptr);
#line 1560 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  void __stdcall png_set_rgb_to_gray (png_structp png_ptr, int error_action, double red, double green );
#line 1566 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1567 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_set_rgb_to_gray_fixed (png_structp png_ptr, int error_action, png_fixed_point red, png_fixed_point green );
#line 1569 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_byte __stdcall png_get_rgb_to_gray_status (png_structp png_ptr);
#line 1571 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1572 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_build_grayscale_palette (int bit_depth, png_colorp palette);
#line 1575 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_strip_alpha (png_structp png_ptr);
#line 1579 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_swap_alpha (png_structp png_ptr);
#line 1584 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_invert_alpha (png_structp png_ptr);
#line 1589 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_filler (png_structp png_ptr, png_uint_32 filler, int flags);
#line 1594 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





extern  void __stdcall png_set_add_alpha (png_structp png_ptr, png_uint_32 filler, int flags);
#line 1601 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1602 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1603 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_swap (png_structp png_ptr);
#line 1608 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_packing (png_structp png_ptr);
#line 1613 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_packswap (png_structp png_ptr);
#line 1618 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_shift (png_structp png_ptr, png_color_8p true_bits);
#line 1623 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1624 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  int __stdcall png_set_interlace_handling (png_structp png_ptr);
#line 1630 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_invert_mono (png_structp png_ptr);
#line 1635 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  void __stdcall png_set_background (png_structp png_ptr, png_color_16p background_color, int background_gamma_code, int need_expand, double background_gamma);
#line 1642 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1643 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 1648 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_strip_16 (png_structp png_ptr);
#line 1653 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_dither (png_structp png_ptr, png_colorp palette, int num_palette, int maximum_colors, png_uint_16p histogram, int full_dither);
#line 1659 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1660 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  void __stdcall png_set_gamma (png_structp png_ptr, double screen_gamma, double default_file_gamma);
#line 1666 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1667 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1668 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





extern  void __stdcall png_permit_empty_plte (png_structp png_ptr, int empty_plte_permitted);
#line 1676 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1677 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1678 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_flush (png_structp png_ptr, int nrows);

extern  void __stdcall png_write_flush (png_structp png_ptr);
#line 1685 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_start_read_image (png_structp png_ptr);


extern  void __stdcall png_read_update_info (png_structp png_ptr, png_infop info_ptr);
#line 1692 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_read_rows (png_structp png_ptr, png_bytepp row, png_bytepp display_row, png_uint_32 num_rows);
#line 1697 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1698 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_read_row (png_structp png_ptr, png_bytep row, png_bytep display_row);
#line 1704 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1705 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_read_image (png_structp png_ptr, png_bytepp image);
#line 1710 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1711 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_row (png_structp png_ptr, png_bytep row);
#line 1715 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_rows (png_structp png_ptr, png_bytepp row, png_uint_32 num_rows);
#line 1719 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_image (png_structp png_ptr, png_bytepp image);
#line 1723 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_write_end (png_structp png_ptr, png_infop info_ptr);
#line 1727 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_read_end (png_structp png_ptr, png_infop info_ptr);
#line 1732 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1733 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_destroy_info_struct (png_structp png_ptr, png_infopp info_ptr_ptr);
#line 1737 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_destroy_read_struct (png_structpp png_ptr_ptr, png_infopp info_ptr_ptr, png_infopp end_info_ptr_ptr);
#line 1741 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern void png_read_destroy (png_structp png_ptr, png_infop info_ptr, png_infop end_info_ptr);
#line 1745 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_destroy_write_struct
   (png_structpp png_ptr_ptr, png_infopp info_ptr_ptr);


extern void png_write_destroy (png_structp png_ptr);


extern  void __stdcall png_set_crc_action (png_structp png_ptr, int crit_action, int ancil_action);
#line 1756 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




























extern  void __stdcall png_set_filter (png_structp png_ptr, int method, int filters);
#line 1786 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"























































extern  void __stdcall png_set_filter_heuristics (png_structp png_ptr, int heuristic_method, int num_weights, png_doublep filter_weights, png_doublep filter_costs);
#line 1844 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1845 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1846 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
















extern  void __stdcall png_set_compression_level (png_structp png_ptr, int level);
#line 1864 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_set_compression_mem_level
   (png_structp png_ptr, int mem_level);

extern  void __stdcall png_set_compression_strategy
   (png_structp png_ptr, int strategy);

extern  void __stdcall png_set_compression_window_bits
   (png_structp png_ptr, int window_bits);

extern  void __stdcall png_set_compression_method (png_structp png_ptr, int method);
#line 1876 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"













#line 1890 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"









extern  void __stdcall png_set_error_fn (png_structp png_ptr, png_voidp error_ptr, png_error_ptr error_fn, png_error_ptr warning_fn);
#line 1901 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_voidp __stdcall png_get_error_ptr (png_structp png_ptr);






extern  void __stdcall png_set_write_fn (png_structp png_ptr, png_voidp io_ptr, png_rw_ptr write_data_fn, png_flush_ptr output_flush_fn);
#line 1912 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_read_fn (png_structp png_ptr, png_voidp io_ptr, png_rw_ptr read_data_fn);
#line 1916 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_voidp __stdcall png_get_io_ptr (png_structp png_ptr);

extern  void __stdcall png_set_read_status_fn (png_structp png_ptr, png_read_status_ptr read_row_fn);
#line 1922 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_set_write_status_fn (png_structp png_ptr, png_write_status_ptr write_row_fn);
#line 1925 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_mem_fn (png_structp png_ptr, png_voidp mem_ptr, png_malloc_ptr malloc_fn, png_free_ptr free_fn);
#line 1930 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_voidp __stdcall png_get_mem_ptr (png_structp png_ptr);
#line 1933 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_read_user_transform_fn (png_structp png_ptr, png_user_transform_ptr read_user_transform_fn);
#line 1938 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1939 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_write_user_transform_fn (png_structp png_ptr, png_user_transform_ptr write_user_transform_fn);
#line 1944 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1945 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_user_transform_info (png_structp png_ptr, png_voidp user_transform_ptr, int user_transform_depth, int user_transform_channels);
#line 1952 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_voidp __stdcall png_get_user_transform_ptr
   (png_structp png_ptr);
#line 1956 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_read_user_chunk_fn (png_structp png_ptr, png_voidp user_chunk_ptr, png_user_chunk_ptr read_user_chunk_fn);
#line 1960 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_voidp __stdcall png_get_user_chunk_ptr (png_structp png_ptr);
#line 1962 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1963 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





extern  void __stdcall png_set_progressive_read_fn (png_structp png_ptr, png_voidp progressive_ptr, png_progressive_info_ptr info_fn, png_progressive_row_ptr row_fn, png_progressive_end_ptr end_fn);
#line 1972 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_voidp __stdcall png_get_progressive_ptr
   (png_structp png_ptr);


extern  void __stdcall png_process_data (png_structp png_ptr, png_infop info_ptr, png_bytep buffer, png_size_t buffer_size);
#line 1980 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  void __stdcall png_progressive_combine_row (png_structp png_ptr, png_bytep old_row, png_bytep new_row);
#line 1986 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1987 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_voidp __stdcall png_malloc (png_structp png_ptr, png_uint_32 size);
#line 1990 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 1994 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_voidp __stdcall png_malloc_warn (png_structp png_ptr, png_uint_32 size);
#line 1997 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1998 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_free (png_structp png_ptr, png_voidp ptr);








#line 2010 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_free_data (png_structp png_ptr, png_infop info_ptr, png_uint_32 free_me, int num);
#line 2014 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_data_freer (png_structp png_ptr, png_infop info_ptr, int freer, png_uint_32 mask);
#line 2019 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2020 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




















extern  png_voidp __stdcall png_malloc_default (png_structp png_ptr, png_uint_32 size);
#line 2042 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_free_default (png_structp png_ptr, png_voidp ptr);
#line 2044 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2045 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_voidp __stdcall png_memcpy_check (png_structp png_ptr, png_voidp s1, png_voidp s2, png_uint_32 size);
#line 2048 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_voidp __stdcall png_memset_check (png_structp png_ptr, png_voidp s1, int value, png_uint_32 size);
#line 2051 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 2056 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_error (png_structp png_ptr, png_const_charp error_message);
#line 2060 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_chunk_error (png_structp png_ptr, png_const_charp error_message);
#line 2064 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_warning (png_structp png_ptr, png_const_charp warning_message);
#line 2068 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_chunk_warning (png_structp png_ptr, png_const_charp warning_message);
#line 2072 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"














extern  png_uint_32 __stdcall png_get_valid (png_structp png_ptr, png_infop info_ptr, png_uint_32 flag);
#line 2088 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_rowbytes (png_structp png_ptr, png_infop info_ptr);
#line 2092 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  png_bytepp __stdcall png_get_rows (png_structp png_ptr, png_infop info_ptr);
#line 2098 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_rows (png_structp png_ptr, png_infop info_ptr, png_bytepp row_pointers);
#line 2102 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2103 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_byte __stdcall png_get_channels (png_structp png_ptr, png_infop info_ptr);
#line 2107 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  png_uint_32 __stdcall png_get_image_width (png_structp png_ptr, png_infop info_ptr);
#line 2112 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_image_height (png_structp png_ptr, png_infop info_ptr);
#line 2116 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_byte __stdcall png_get_bit_depth (png_structp png_ptr, png_infop info_ptr);
#line 2120 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_byte __stdcall png_get_color_type (png_structp png_ptr, png_infop info_ptr);
#line 2124 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_byte __stdcall png_get_filter_type (png_structp png_ptr, png_infop info_ptr);
#line 2128 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_byte __stdcall png_get_interlace_type (png_structp png_ptr, png_infop info_ptr);
#line 2132 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_byte __stdcall png_get_compression_type (png_structp png_ptr, png_infop info_ptr);
#line 2136 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_pixels_per_meter (png_structp png_ptr, png_infop info_ptr);
#line 2140 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_x_pixels_per_meter (png_structp png_ptr, png_infop info_ptr);
#line 2142 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_y_pixels_per_meter (png_structp png_ptr, png_infop info_ptr);
#line 2144 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  float __stdcall png_get_pixel_aspect_ratio (png_structp png_ptr, png_infop info_ptr);
#line 2149 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2150 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_int_32 __stdcall png_get_x_offset_pixels (png_structp png_ptr, png_infop info_ptr);
#line 2154 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_int_32 __stdcall png_get_y_offset_pixels (png_structp png_ptr, png_infop info_ptr);
#line 2156 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_int_32 __stdcall png_get_x_offset_microns (png_structp png_ptr, png_infop info_ptr);
#line 2158 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_int_32 __stdcall png_get_y_offset_microns (png_structp png_ptr, png_infop info_ptr);
#line 2160 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 2162 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_bytep __stdcall png_get_signature (png_structp png_ptr, png_infop info_ptr);
#line 2166 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_bKGD (png_structp png_ptr, png_infop info_ptr, png_color_16p *background);
#line 2170 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2171 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_bKGD (png_structp png_ptr, png_infop info_ptr, png_color_16p background);
#line 2175 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2176 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  png_uint_32 __stdcall png_get_cHRM (png_structp png_ptr, png_infop info_ptr, double *white_x, double *white_y, double *red_x, double *red_y, double *green_x, double *green_y, double *blue_x, double *blue_y);
#line 2183 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2184 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_uint_32 __stdcall png_get_cHRM_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point *int_white_x, png_fixed_point *int_white_y, png_fixed_point *int_red_x, png_fixed_point *int_red_y, png_fixed_point *int_green_x, png_fixed_point *int_green_y, png_fixed_point *int_blue_x, png_fixed_point *int_blue_y);
#line 2190 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2191 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2192 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_cHRM (png_structp png_ptr, png_infop info_ptr, double white_x, double white_y, double red_x, double red_y, double green_x, double green_y, double blue_x, double blue_y);
#line 2198 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2199 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_set_cHRM_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point int_white_x, png_fixed_point int_white_y, png_fixed_point int_red_x, png_fixed_point int_red_y, png_fixed_point int_green_x, png_fixed_point int_green_y, png_fixed_point int_blue_x, png_fixed_point int_blue_y);
#line 2205 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2206 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2207 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  png_uint_32 __stdcall png_get_gAMA (png_structp png_ptr, png_infop info_ptr, double *file_gamma);
#line 2212 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2213 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_gAMA_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point *int_file_gamma);
#line 2215 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2216 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_gAMA (png_structp png_ptr, png_infop info_ptr, double file_gamma);
#line 2221 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2222 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_set_gAMA_fixed (png_structp png_ptr, png_infop info_ptr, png_fixed_point int_file_gamma);
#line 2224 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2225 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_hIST (png_structp png_ptr, png_infop info_ptr, png_uint_16p *hist);
#line 2229 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2230 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_hIST (png_structp png_ptr, png_infop info_ptr, png_uint_16p hist);
#line 2234 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2235 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_uint_32 __stdcall png_get_IHDR (png_structp png_ptr, png_infop info_ptr, png_uint_32 *width, png_uint_32 *height, int *bit_depth, int *color_type, int *interlace_method, int *compression_method, int *filter_method);
#line 2240 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_set_IHDR (png_structp png_ptr, png_infop info_ptr, png_uint_32 width, png_uint_32 height, int bit_depth, int color_type, int interlace_method, int compression_method, int filter_method);
#line 2245 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_oFFs (png_structp png_ptr, png_infop info_ptr, png_int_32 *offset_x, png_int_32 *offset_y, int *unit_type);
#line 2250 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2251 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_oFFs (png_structp png_ptr, png_infop info_ptr, png_int_32 offset_x, png_int_32 offset_y, int unit_type);
#line 2256 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2257 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_pCAL (png_structp png_ptr, png_infop info_ptr, png_charp *purpose, png_int_32 *X0, png_int_32 *X1, int *type, int *nparams, png_charp *units, png_charpp *params);
#line 2262 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2263 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_pCAL (png_structp png_ptr, png_infop info_ptr, png_charp purpose, png_int_32 X0, png_int_32 X1, int type, int nparams, png_charp units, png_charpp params);
#line 2268 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2269 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_pHYs (png_structp png_ptr, png_infop info_ptr, png_uint_32 *res_x, png_uint_32 *res_y, int *unit_type);
#line 2273 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2274 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_pHYs (png_structp png_ptr, png_infop info_ptr, png_uint_32 res_x, png_uint_32 res_y, int unit_type);
#line 2278 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2279 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_uint_32 __stdcall png_get_PLTE (png_structp png_ptr, png_infop info_ptr, png_colorp *palette, int *num_palette);
#line 2282 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_set_PLTE (png_structp png_ptr, png_infop info_ptr, png_colorp palette, int num_palette);
#line 2285 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_sBIT (png_structp png_ptr, png_infop info_ptr, png_color_8p *sig_bit);
#line 2289 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2290 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_sBIT (png_structp png_ptr, png_infop info_ptr, png_color_8p sig_bit);
#line 2294 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2295 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_sRGB (png_structp png_ptr, png_infop info_ptr, int *intent);
#line 2299 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2300 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_sRGB (png_structp png_ptr, png_infop info_ptr, int intent);
#line 2304 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_set_sRGB_gAMA_and_cHRM (png_structp png_ptr, png_infop info_ptr, int intent);
#line 2306 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2307 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_iCCP (png_structp png_ptr, png_infop info_ptr, png_charpp name, int *compression_type, png_charpp profile, png_uint_32 *proflen);
#line 2312 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
   
#line 2314 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_iCCP (png_structp png_ptr, png_infop info_ptr, png_charp name, int compression_type, png_charp profile, png_uint_32 proflen);
#line 2319 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
   
#line 2321 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_sPLT (png_structp png_ptr, png_infop info_ptr, png_sPLT_tpp entries);
#line 2325 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2326 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_sPLT (png_structp png_ptr, png_infop info_ptr, png_sPLT_tp entries, int nentries);
#line 2330 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2331 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  png_uint_32 __stdcall png_get_text (png_structp png_ptr, png_infop info_ptr, png_textp *text_ptr, int *num_text);
#line 2336 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2337 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"










extern  void __stdcall png_set_text (png_structp png_ptr, png_infop info_ptr, png_textp text_ptr, int num_text);
#line 2349 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2350 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 2355 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 2360 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  png_uint_32 __stdcall png_get_tRNS (png_structp png_ptr, png_infop info_ptr, png_bytep *trans, int *num_trans, png_color_16p *trans_values);
#line 2365 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2366 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern  void __stdcall png_set_tRNS (png_structp png_ptr, png_infop info_ptr, png_bytep trans, int num_trans, png_color_16p trans_values);
#line 2371 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2372 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


#line 2375 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  png_uint_32 __stdcall png_get_sCAL (png_structp png_ptr, png_infop info_ptr, int *unit, double *width, double *height);
#line 2380 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 2386 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2387 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_sCAL (png_structp png_ptr, png_infop info_ptr, int unit, double width, double height);
#line 2392 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 2398 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2399 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"











extern  void __stdcall png_set_keep_unknown_chunks (png_structp png_ptr, int keep, png_bytep chunk_list, int num_chunks);
#line 2412 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_set_unknown_chunks (png_structp png_ptr, png_infop info_ptr, png_unknown_chunkp unknowns, int num_unknowns);
#line 2414 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_set_unknown_chunk_location
   (png_structp png_ptr, png_infop info_ptr, int chunk, int location);
extern  png_uint_32 __stdcall png_get_unknown_chunks (png_structp png_ptr, png_infop info_ptr, png_unknown_chunkpp entries);
#line 2418 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2419 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 int __stdcall png_handle_as_unknown (png_structp png_ptr, png_bytep chunk_name);
#line 2422 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2423 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  void __stdcall png_set_invalid (png_structp png_ptr, png_infop info_ptr, int mask);
#line 2429 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_read_png (png_structp png_ptr, png_infop info_ptr, int transforms, png_voidp params);
#line 2436 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_write_png (png_structp png_ptr, png_infop info_ptr, int transforms, png_voidp params);
#line 2440 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2441 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"












































#line 2486 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


#line 2489 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


#line 2492 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 2496 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  png_charp __stdcall png_get_copyright (png_structp png_ptr);
extern  png_charp __stdcall png_get_header_ver (png_structp png_ptr);
extern  png_charp __stdcall png_get_header_version (png_structp png_ptr);
extern  png_charp __stdcall png_get_libpng_ver (png_structp png_ptr);


extern  png_uint_32 __stdcall png_permit_mng_features (png_structp png_ptr, png_uint_32 mng_features_permitted);
#line 2505 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2506 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



































#line 2542 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  png_uint_32 __stdcall png_get_mmx_flagmask
   (int flag_select, int *compilerID);


extern  png_uint_32 __stdcall png_get_asm_flagmask
   (int flag_select);


extern  png_uint_32 __stdcall png_get_asm_flags
   (png_structp png_ptr);


extern  png_byte __stdcall png_get_mmx_bitdepth_threshold
   (png_structp png_ptr);


extern  png_uint_32 __stdcall png_get_mmx_rowbytes_threshold
   (png_structp png_ptr);


extern  void __stdcall png_set_asm_flags
   (png_structp png_ptr, png_uint_32 asm_flags);


extern  void __stdcall png_set_mmx_thresholds
   (png_structp png_ptr, png_byte mmx_bitdepth_threshold, png_uint_32 mmx_rowbytes_threshold);
#line 2572 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 2574 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  int __stdcall png_mmx_support (void);
#line 2579 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




extern  void __stdcall png_set_strip_error_numbers (png_structp png_ptr, png_uint_32 strip_mode);
#line 2585 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2586 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 2588 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



extern  void __stdcall png_set_user_limits (png_structp png_ptr, png_uint_32 user_width_max, png_uint_32 user_height_max);
#line 2593 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_user_width_max (png_structp png_ptr);
#line 2595 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_user_height_max (png_structp png_ptr);
#line 2597 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2598 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
















 

























#line 2641 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"













#line 2655 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_uint_32 (png_bytep buf);
extern  png_uint_16 __stdcall png_get_uint_16 (png_bytep buf);
extern  png_int_32 __stdcall png_get_int_32 (png_bytep buf);
#line 2659 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  png_uint_32 __stdcall png_get_uint_31
  (png_structp png_ptr, png_bytep buf);




extern  void __stdcall png_save_uint_32
   (png_bytep buf, png_uint_32 i);
extern  void __stdcall png_save_int_32
   (png_bytep buf, png_int_32 i);





extern  void __stdcall png_save_uint_16
   (png_bytep buf, unsigned int i);













































                          














                       


                       
                       
                       
                       
                       



































                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  

































   extern  const png_byte  png_sig[8];




#line 2826 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2827 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




























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
#line 2877 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





extern  void __stdcall png_read_init (png_structp png_ptr);



#line 2887 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_read_init_3 (png_structpp ptr_ptr, png_const_charp user_png_ver, png_size_t png_struct_size);
#line 2890 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_read_init_2 (png_structp png_ptr, png_const_charp user_png_ver, png_size_t png_struct_size, png_size_t png_info_size);
#line 2894 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2895 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





extern  void __stdcall png_write_init (png_structp png_ptr);



#line 2905 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

extern  void __stdcall png_write_init_3 (png_structpp ptr_ptr, png_const_charp user_png_ver, png_size_t png_struct_size);
#line 2908 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
extern  void __stdcall png_write_init_2 (png_structp png_ptr, png_const_charp user_png_ver, png_size_t png_struct_size, png_size_t png_info_size);
#line 2911 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 png_voidp png_create_struct (int type);


 void png_destroy_struct (png_voidp struct_ptr);

 png_voidp png_create_struct_2 (int type, png_malloc_ptr malloc_fn, png_voidp mem_ptr);
#line 2920 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_destroy_struct_2 (png_voidp struct_ptr, png_free_ptr free_fn, png_voidp mem_ptr);
#line 2922 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_info_destroy (png_structp png_ptr, png_infop info_ptr);
#line 2926 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



 voidpf png_zalloc (voidpf png_ptr, uInt items, uInt size);


 void png_zfree (voidpf png_ptr, voidpf ptr);









 void __stdcall png_default_read_data (png_structp png_ptr, png_bytep data, png_size_t length);
#line 2944 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void __stdcall png_push_fill_buffer (png_structp png_ptr, png_bytep buffer, png_size_t length);
#line 2948 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2949 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void __stdcall png_default_write_data (png_structp png_ptr, png_bytep data, png_size_t length);
#line 2952 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 2957 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2958 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 2964 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_reset_crc (png_structp png_ptr);


 void png_write_data (png_structp png_ptr, png_bytep data, png_size_t length);
#line 2971 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_read_data (png_structp png_ptr, png_bytep data, png_size_t length);
#line 2975 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_crc_read (png_structp png_ptr, png_bytep buf, png_size_t length);
#line 2979 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



 png_charp png_decompress_chunk (png_structp png_ptr, int comp_type, png_charp chunkdata, png_size_t chunklength, png_size_t prefix_length, png_size_t *data_length);
#line 2986 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 2987 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 int png_crc_finish (png_structp png_ptr, png_uint_32 skip);


 int png_crc_error (png_structp png_ptr);





 void png_calculate_crc (png_structp png_ptr, png_bytep ptr, png_size_t length);
#line 3000 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_flush (png_structp png_ptr);
#line 3004 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_sig (png_structp png_ptr);






 void png_write_IHDR (png_structp png_ptr, png_uint_32 width, png_uint_32 height, int bit_depth, int color_type, int compression_method, int filter_method, int interlace_method);
#line 3017 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_write_PLTE (png_structp png_ptr, png_colorp palette, png_uint_32 num_pal);
#line 3020 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_write_IDAT (png_structp png_ptr, png_bytep data, png_size_t length);
#line 3023 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_write_IEND (png_structp png_ptr);



 void png_write_gAMA (png_structp png_ptr, double file_gamma);
#line 3030 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_write_gAMA_fixed (png_structp png_ptr, png_fixed_point file_gamma);
#line 3033 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3034 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3035 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_sBIT (png_structp png_ptr, png_color_8p sbit, int color_type);
#line 3039 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3040 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



 void png_write_cHRM (png_structp png_ptr, double white_x, double white_y, double red_x, double red_y, double green_x, double green_y, double blue_x, double blue_y);
#line 3047 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3048 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_write_cHRM_fixed (png_structp png_ptr, png_fixed_point int_white_x, png_fixed_point int_white_y, png_fixed_point int_red_x, png_fixed_point int_red_y, png_fixed_point int_green_x, png_fixed_point int_green_y, png_fixed_point int_blue_x, png_fixed_point int_blue_y);
#line 3054 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3055 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3056 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_sRGB (png_structp png_ptr, int intent);
#line 3060 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3061 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_iCCP (png_structp png_ptr, png_charp name, int compression_type, png_charp profile, int proflen);
#line 3066 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
   
#line 3068 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_sPLT (png_structp png_ptr, png_sPLT_tp palette);
#line 3072 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3073 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_tRNS (png_structp png_ptr, png_bytep trans, png_color_16p values, int number, int color_type);
#line 3077 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3078 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_bKGD (png_structp png_ptr, png_color_16p values, int color_type);
#line 3082 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3083 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_hIST (png_structp png_ptr, png_uint_16p hist, int num_hist);
#line 3087 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3088 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 png_size_t png_check_keyword (png_structp png_ptr, png_charp key, png_charpp new_key);
#line 3093 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3094 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_tEXt (png_structp png_ptr, png_charp key, png_charp text, png_size_t text_len);
#line 3098 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3099 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_zTXt (png_structp png_ptr, png_charp key, png_charp text, png_size_t text_len, int compression);
#line 3103 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3104 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 3110 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 int png_set_text_2 (png_structp png_ptr, png_infop info_ptr, png_textp text_ptr, int num_text);
#line 3114 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3115 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_oFFs (png_structp png_ptr, png_int_32 x_offset, png_int_32 y_offset, int unit_type);
#line 3119 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3120 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_pCAL (png_structp png_ptr, png_charp purpose, png_int_32 X0, png_int_32 X1, int type, int nparams, png_charp units, png_charpp params);
#line 3125 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3126 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_pHYs (png_structp png_ptr, png_uint_32 x_pixels_per_unit, png_uint_32 y_pixels_per_unit, int unit_type);
#line 3131 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3132 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 3137 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 3143 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_write_sCAL_s (png_structp png_ptr, int unit, png_charp width, png_charp height);
#line 3146 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3147 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3148 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3149 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_finish_row (png_structp png_ptr);


 void png_write_start_row (png_structp png_ptr);


 void png_build_gamma_table (png_structp png_ptr);
#line 3159 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_combine_row (png_structp png_ptr, png_bytep row, int mask);
#line 3163 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"







 void png_do_read_interlace (png_structp png_ptr);
#line 3172 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





 void png_do_write_interlace (png_row_infop row_info, png_bytep row, int pass);
#line 3179 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3180 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_read_filter_row (png_structp png_ptr, png_row_infop row_info, png_bytep row, png_bytep prev_row, int filter);
#line 3184 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_find_filter (png_structp png_ptr, png_row_infop row_info);
#line 3188 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_write_filtered_row (png_structp png_ptr, png_bytep filtered_row);
#line 3192 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_read_finish_row (png_structp png_ptr);


 void png_read_start_row (png_structp png_ptr);

 void png_read_transform_info (png_structp png_ptr, png_infop info_ptr);
#line 3200 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



 void png_do_read_filler (png_row_infop row_info, png_bytep row, png_uint_32 filler, png_uint_32 flags);
#line 3205 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3206 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_read_swap_alpha (png_row_infop row_info, png_bytep row);
#line 3210 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3211 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_write_swap_alpha (png_row_infop row_info, png_bytep row);
#line 3215 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3216 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_read_invert_alpha (png_row_infop row_info, png_bytep row);
#line 3220 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3221 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_write_invert_alpha (png_row_infop row_info, png_bytep row);
#line 3225 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3226 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_strip_filler (png_row_infop row_info, png_bytep row, png_uint_32 flags);
#line 3231 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3232 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_swap (png_row_infop row_info, png_bytep row);
#line 3236 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_packswap (png_row_infop row_info, png_bytep row);
#line 3240 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 int png_do_rgb_to_gray (png_structp png_ptr, png_row_infop row_info, png_bytep row);
#line 3244 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3245 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_gray_to_rgb (png_row_infop row_info, png_bytep row);
#line 3249 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3250 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_unpack (png_row_infop row_info, png_bytep row);
#line 3254 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_unshift (png_row_infop row_info, png_bytep row, png_color_8p sig_bits);
#line 3258 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3259 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_invert (png_row_infop row_info, png_bytep row);
#line 3263 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_chop (png_row_infop row_info, png_bytep row);
#line 3267 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_dither (png_row_infop row_info, png_bytep row, png_bytep palette_lookup, png_bytep dither_lookup);
#line 3271 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 3276 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3277 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_bgr (png_row_infop row_info, png_bytep row);
#line 3281 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_pack (png_row_infop row_info, png_bytep row, png_uint_32 bit_depth);
#line 3285 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3286 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_shift (png_row_infop row_info, png_bytep row, png_color_8p bit_depth);
#line 3290 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3291 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



 void png_do_background (png_row_infop row_info, png_bytep row, png_color_16p trans_values, png_color_16p background, png_color_16p background_1, png_bytep gamma_table, png_bytep gamma_from_1, png_bytep gamma_to_1, png_uint_16pp gamma_16, png_uint_16pp gamma_16_from_1, png_uint_16pp gamma_16_to_1, int gamma_shift);
#line 3300 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 3304 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3305 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_gamma (png_row_infop row_info, png_bytep row, png_bytep gamma_table, png_uint_16pp gamma_16_table, int gamma_shift);
#line 3310 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3311 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_expand_palette (png_row_infop row_info, png_bytep row, png_colorp palette, png_bytep trans, int num_trans);
#line 3315 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_do_expand (png_row_infop row_info, png_bytep row, png_color_16p trans_value);
#line 3317 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3318 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"






 void png_handle_IHDR (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3326 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_handle_PLTE (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3328 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_handle_IEND (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3330 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_bKGD (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3334 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3335 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_cHRM (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3339 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3340 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_gAMA (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3344 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3345 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_hIST (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3349 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3350 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern void png_handle_iCCP (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3354 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3355 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 3360 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_oFFs (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3364 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3365 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_pCAL (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3369 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3370 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_pHYs (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3374 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3375 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_sBIT (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3379 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3380 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 3385 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


extern void png_handle_sPLT (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3389 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3390 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_sRGB (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3394 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3395 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_tEXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3399 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3400 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"




#line 3405 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_tRNS (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3409 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3410 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_handle_zTXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3414 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3415 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_handle_unknown (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3418 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_check_chunk_name (png_structp png_ptr, png_bytep chunk_name);
#line 3421 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_read_transformations (png_structp png_ptr);
 void png_do_write_transformations (png_structp png_ptr);

 void png_init_read_transformations (png_structp png_ptr);


 void png_push_read_chunk (png_structp png_ptr, png_infop info_ptr);
#line 3431 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_read_sig (png_structp png_ptr, png_infop info_ptr);
#line 3433 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_check_crc (png_structp png_ptr);
 void png_push_crc_skip (png_structp png_ptr, png_uint_32 length);
#line 3436 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_crc_finish (png_structp png_ptr);
 void png_push_save_buffer (png_structp png_ptr);
 void png_push_restore_buffer (png_structp png_ptr, png_bytep buffer, png_size_t buffer_length);
#line 3440 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_read_IDAT (png_structp png_ptr);
 void png_process_IDAT_data (png_structp png_ptr, png_bytep buffer, png_size_t buffer_length);
#line 3443 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_process_row (png_structp png_ptr);
 void png_push_handle_unknown (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3446 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_have_info (png_structp png_ptr, png_infop info_ptr);
#line 3448 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_have_end (png_structp png_ptr, png_infop info_ptr);
#line 3450 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_have_row (png_structp png_ptr, png_bytep row);
 void png_push_read_end (png_structp png_ptr, png_infop info_ptr);
#line 3453 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_process_some_data (png_structp png_ptr, png_infop info_ptr);
#line 3455 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_read_push_finish_row (png_structp png_ptr);

 void png_push_handle_tEXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3459 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_read_tEXt (png_structp png_ptr, png_infop info_ptr);
#line 3461 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3462 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

 void png_push_handle_zTXt (png_structp png_ptr, png_infop info_ptr, png_uint_32 length);
#line 3465 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_push_read_zTXt (png_structp png_ptr, png_infop info_ptr);
#line 3467 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3468 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 3474 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 3476 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"


 void png_do_read_intrapixel (png_row_infop row_info, png_bytep row);
#line 3480 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
 void png_do_write_intrapixel (png_row_infop row_info, png_bytep row);
#line 3482 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3483 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 3489 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 3490 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





















#line 3512 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 3516 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"





#line 3522 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"

#line 3524 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1 "C:\\dev\\devos_svn\\tree\\include/c\\std_mem.h"


#line 4 "C:\\dev\\devos_svn\\tree\\include/c\\std_mem.h"

typedef void				*mem_ptr;
typedef const void			*const_mem_ptr;



#line 11 "C:\\dev\\devos_svn\\tree\\include/c\\std_mem.h"
	typedef unsigned int	 mem_size;
#line 13 "C:\\dev\\devos_svn\\tree\\include/c\\std_mem.h"





		
__declspec(dllimport) mem_ptr		__stdcall memcpy_c				(mem_ptr dst_ptr,const_mem_ptr src_ptr,mem_size size);
__declspec(dllimport) mem_ptr		__stdcall _intel_fast_memcpy	(mem_ptr dst_ptr,const_mem_ptr src_ptr,mem_size size);


__declspec(dllimport) mem_ptr		__stdcall memmove_c			(mem_ptr dst_ptr,const_mem_ptr src_ptr,mem_size size);
__declspec(dllimport) mem_ptr		__stdcall memset_c				(mem_ptr ptr,unsigned char v,mem_size size);
__declspec(dllimport) mem_ptr		__stdcall memset				(mem_ptr ptr,unsigned char v,mem_size size);
__declspec(dllimport) int			__stdcall memcmp_c				(const_mem_ptr ptr1,const_mem_ptr ptr2,unsigned int size);
__declspec(dllimport) const_mem_ptr	__stdcall memchr_c				(const_mem_ptr ptr,int value,mem_size size);
__declspec(dllimport) void			__stdcall qsort_c				(mem_ptr base, mem_size num, mem_size width,  int ( *comp)(const_mem_ptr,const_mem_ptr));

__declspec(dllimport) mem_ptr		__stdcall realloc_c			(mem_ptr ptr,mem_size sz);
__declspec(dllimport) void			__stdcall free_c				(mem_ptr ptr);
__declspec(dllimport) mem_ptr		__stdcall malloc_c				(mem_size sz);
__declspec(dllimport) mem_ptr		__stdcall calloc_c				(mem_size sz,mem_size blk);

__declspec(dllimport) mem_ptr		__stdcall get_next_aligned_ptr	(mem_ptr ptr);







#line 44 "C:\\dev\\devos_svn\\tree\\include/c\\std_mem.h"



#line 3525 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1 "C:\\dev\\devos_svn\\tree\\include/c\\std_str.h"



__declspec(dllimport) char *			__stdcall strncpy_c			(char *string,const char *src_string,unsigned int cnt);
__declspec(dllimport) int			__stdcall strcpy_s				(char *string,unsigned int size,const char *src_string);
__declspec(dllimport) char *			__stdcall strcpy_c				(char *string,const char *src_string);
__declspec(dllimport) int			__stdcall strcat_s				(char *string,unsigned int size,const char *src_string);
__declspec(dllimport) int			__stdcall strncat_c			(char *string,const char *src_string,unsigned int max);
__declspec(dllimport) int			__stdcall strcat_c				(char *string,const char *src_string);
__declspec(dllimport) int			__stdcall strcmp_c				(const char *string1,const char *string2);
__declspec(dllimport) int			__stdcall strncmp_c			(const char *string1,const char *string2,int len);
__declspec(dllimport) const char	*	__stdcall strrchr_c			(const char *src,int car);
__declspec(dllimport) size_t 		__stdcall strlen_c				(const char *string);
__declspec(dllimport) int 			__stdcall strlpos_c			(const char *string,unsigned int ofset,char c);
__declspec(dllimport) size_t			__stdcall strrpos_c			(const char *string,char c);
__declspec(dllimport) char	*		__stdcall itoa_s				(int value, char *string,int len, int radix);
__declspec(dllimport) long			__stdcall strtol_c				(const char *nptr, char **endptr,int base);
__declspec(dllimport) short			__stdcall strtos_c				(const char *nptr, char **endptr, int base);
__declspec(dllimport) long			__stdcall atol_c				(const char *str ); 
__declspec(dllimport) const char *	__stdcall strstr_c				(const char *buf, const char *sub);
__declspec(dllimport) int			__stdcall strlpos_lim_c		(const char *string,unsigned int ofset,unsigned int size,char c);
__declspec(dllimport) int			__stdcall writestr				(const char *string);
__declspec(dllimport) int			__stdcall writestr_color		(const char *text,unsigned char color);
__declspec(dllimport) void			__stdcall writeint				(int val,int radix);
__declspec(dllimport) void			__stdcall writeptr				(mem_ptr val);
__declspec(dllimport) unsigned int	__stdcall get_new_kern_log_id	(const char *pref,unsigned char color);
__declspec(dllimport) void			__stdcall kernel_log			(unsigned int kern_log_id,const char *str);
__declspec(dllimport) int			__stdcall tolower_c			(int _c);
__declspec(dllimport) int			__stdcall toupper_c			(int _c);
__declspec(dllimport) int			__stdcall isprint_c			(int _c);
__declspec(dllimport) int			__stdcall isalpha_c			(int _c);
__declspec(dllimport) int			__stdcall isdigit_c			(int _c);
__declspec(dllimport) int			__stdcall isdigit_c			(int _c);
__declspec(dllimport) int			__stdcall isxdigit_c			(int _c);
__declspec(dllimport) int			__stdcall isspace_c			(int _c);




#line 3526 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"
#line 1 "C:\\dev\\devos_svn\\tree\\include/c\\std_math.h"



typedef int				vec_2s_t[2];
typedef unsigned char	vec_4uc_t[4];

struct gfx_rect
{
	vec_2s_t	pos;
	vec_2s_t	size;
};






__declspec(dllimport) unsigned int	__stdcall iabs_c	(int v);
__declspec(dllimport) float			__stdcall fabsf_c	(float f);
__declspec(dllimport) double			__stdcall fabs_c	(double f);
__declspec(dllimport) double			__stdcall sin_c	(double f);
__declspec(dllimport) float			__stdcall powf_c	(float x,float y);
__declspec(dllimport) float			__stdcall sinf_c	(float x);
__declspec(dllimport) unsigned long	__stdcall isqrt	(unsigned long x);
__declspec(dllimport) double			__stdcall floor_c	(double f);
__declspec(dllimport) double			__stdcall ceil_c	(double f);
__declspec(dllimport) int			__stdcall icosf	(float f,float m);
__declspec(dllimport) int			__stdcall isinf	(float f,float m);





#line 3527 "c:\\dev\\devos_svn\\tree\\graphic_base\\libpng-1.2.18\\png.h"



#line 18 ".\\pngrtran.c"




void __stdcall
png_set_crc_action(png_structp png_ptr, int crit_action, int ancil_action)
{
   ;
   
   if(png_ptr == (void *)0x00000000) return;
   switch (crit_action)
   {
      case 5:                        
         break;
      case 3:                               
         png_ptr->flags &= ~(0x0400 | 0x0800);
         png_ptr->flags |= 0x0400;
         break;
      case 4:                             
         png_ptr->flags &= ~(0x0400 | 0x0800);
         png_ptr->flags |= 0x0400 |
                           0x0800;
         break;
      case 2:    
         png_warning(png_ptr, "Can't discard critical data on CRC error.");
      case 1:                                
      case 0:
      default:
         png_ptr->flags &= ~(0x0400 | 0x0800);
         break;
   }

   switch (ancil_action)
   {
      case 5:                       
         break;
      case 3:                              
         png_ptr->flags &= ~(0x0100 | 0x0200);
         png_ptr->flags |= 0x0100;
         break;
      case 4:                            
         png_ptr->flags &= ~(0x0100 | 0x0200);
         png_ptr->flags |= 0x0100 |
                           0x0200;
         break;
      case 1:                               
         png_ptr->flags &= ~(0x0100 | 0x0200);
         png_ptr->flags |= 0x0200;
         break;
      case 2:                      
      case 0:
      default:
         png_ptr->flags &= ~(0x0100 | 0x0200);
         break;
   }
}



void __stdcall
png_set_background(png_structp png_ptr,
   png_color_16p background_color, int background_gamma_code,
   int need_expand, double background_gamma)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   if (background_gamma_code == 0)
   {
      png_warning(png_ptr, "Application must supply a known background gamma");
      return;
   }

   png_ptr->transformations |= 0x0080;
   memcpy_c(&(png_ptr->background), background_color,
      sizeof (png_color_16));
   png_ptr->background_gamma = (float)background_gamma;
   png_ptr->background_gamma_type = (png_byte)(background_gamma_code);
   png_ptr->transformations |= (need_expand ? 0x0100 : 0);
}
#line 99 ".\\pngrtran.c"



void __stdcall
png_set_strip_16(png_structp png_ptr)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->transformations |= 0x0400;
}
#line 110 ".\\pngrtran.c"


void __stdcall
png_set_strip_alpha(png_structp png_ptr)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->flags |= 0x400000L;
}
#line 120 ".\\pngrtran.c"











typedef struct png_dsort_struct
{
   struct png_dsort_struct  * next;
   png_byte left;
   png_byte right;
} png_dsort;
typedef png_dsort  *       png_dsortp;
typedef png_dsort  *  * png_dsortpp;

void __stdcall
png_set_dither(png_structp png_ptr, png_colorp palette,
   int num_palette, int maximum_colors, png_uint_16p histogram,
   int full_dither)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->transformations |= 0x0040;

   if (!full_dither)
   {
      int i;

      png_ptr->dither_index = (png_bytep)png_malloc(png_ptr,
         (png_uint_32)(num_palette * sizeof (png_byte)));
      for (i = 0; i < num_palette; i++)
         png_ptr->dither_index[i] = (png_byte)i;
   }

   if (num_palette > maximum_colors)
   {
      if (histogram != (void *)0x00000000)
      {
         


         int i;

         
         png_ptr->dither_sort = (png_bytep)png_malloc(png_ptr,
            (png_uint_32)(num_palette * sizeof (png_byte)));

         
         for (i = 0; i < num_palette; i++)
            png_ptr->dither_sort[i] = (png_byte)i;

         





         for (i = num_palette - 1; i >= maximum_colors; i--)
         {
            int done; 
            int j;

            done = 1;
            for (j = 0; j < i; j++)
            {
               if (histogram[png_ptr->dither_sort[j]]
                   < histogram[png_ptr->dither_sort[j + 1]])
               {
                  png_byte t;

                  t = png_ptr->dither_sort[j];
                  png_ptr->dither_sort[j] = png_ptr->dither_sort[j + 1];
                  png_ptr->dither_sort[j + 1] = t;
                  done = 0;
               }
            }
            if (done)
               break;
         }

         
         if (full_dither)
         {
            int j = num_palette;

            

            for (i = 0; i < maximum_colors; i++)
            {
               if ((int)png_ptr->dither_sort[i] >= maximum_colors)
               {
                  do
                     j--;
                  while ((int)png_ptr->dither_sort[j] >= maximum_colors);
                  palette[i] = palette[j];
               }
            }
         }
         else
         {
            int j = num_palette;

            

            for (i = 0; i < maximum_colors; i++)
            {
               
               if ((int)png_ptr->dither_sort[i] >= maximum_colors)
               {
                  png_color tmp_color;

                  do
                     j--;
                  while ((int)png_ptr->dither_sort[j] >= maximum_colors);

                  tmp_color = palette[j];
                  palette[j] = palette[i];
                  palette[i] = tmp_color;
                  
                  png_ptr->dither_index[j] = (png_byte)i;
                  png_ptr->dither_index[i] = (png_byte)j;
               }
            }

            
            for (i = 0; i < num_palette; i++)
            {
               if ((int)png_ptr->dither_index[i] >= maximum_colors)
               {
                  int min_d, k, min_k, d_index;

                  
                  d_index = png_ptr->dither_index[i];
                  min_d = (iabs_c((int)((palette[d_index]).red) - (int)((palette[0]).red)) + iabs_c((int)((palette[d_index]).green) - (int)((palette[0]).green)) + iabs_c((int)((palette[d_index]).blue) - (int)((palette[0]).blue)));
                  for (k = 1, min_k = 0; k < maximum_colors; k++)
                  {
                     int d;

                     d = (iabs_c((int)((palette[d_index]).red) - (int)((palette[k]).red)) + iabs_c((int)((palette[d_index]).green) - (int)((palette[k]).green)) + iabs_c((int)((palette[d_index]).blue) - (int)((palette[k]).blue)));

                     if (d < min_d)
                     {
                        min_d = d;
                        min_k = k;
                     }
                  }
                  
                  png_ptr->dither_index[i] = (png_byte)min_k;
               }
            }
         }
         png_free(png_ptr, png_ptr->dither_sort);
         png_ptr->dither_sort=(void *)0x00000000;
      }
      else
      {
         







         int i;
         int max_d;
         int num_new_palette;
         png_dsortp t;
         png_dsortpp hash;

         t=(void *)0x00000000;

         
         png_ptr->index_to_palette = (png_bytep)png_malloc(png_ptr,
            (png_uint_32)(num_palette * sizeof (png_byte)));
         png_ptr->palette_to_index = (png_bytep)png_malloc(png_ptr,
            (png_uint_32)(num_palette * sizeof (png_byte)));

         
         for (i = 0; i < num_palette; i++)
         {
            png_ptr->index_to_palette[i] = (png_byte)i;
            png_ptr->palette_to_index[i] = (png_byte)i;
         }

         hash = (png_dsortpp)png_malloc(png_ptr, (png_uint_32)(769 *
            sizeof (png_dsortp)));
         for (i = 0; i < 769; i++)
            hash[i] = (void *)0x00000000;


         num_new_palette = num_palette;

         







         max_d = 96;

         while (num_new_palette > maximum_colors)
         {
            for (i = 0; i < num_new_palette - 1; i++)
            {
               int j;

               for (j = i + 1; j < num_new_palette; j++)
               {
                  int d;

                  d = (iabs_c((int)((palette[i]).red) - (int)((palette[j]).red)) + iabs_c((int)((palette[i]).green) - (int)((palette[j]).green)) + iabs_c((int)((palette[i]).blue) - (int)((palette[j]).blue)));

                  if (d <= max_d)
                  {

                     t = (png_dsortp)png_malloc_warn(png_ptr,
                         (png_uint_32)(sizeof (png_dsort)));
                     if (t == (void *)0x00000000)
                         break;
                     t->next = hash[d];
                     t->left = (png_byte)i;
                     t->right = (png_byte)j;
                     hash[d] = t;
                  }
               }
               if (t == (void *)0x00000000)
                  break;
            }

            if (t != (void *)0x00000000)
            for (i = 0; i <= max_d; i++)
            {
               if (hash[i] != (void *)0x00000000)
               {
                  png_dsortp p;

                  for (p = hash[i]; p; p = p->next)
                  {
                     if ((int)png_ptr->index_to_palette[p->left]
                        < num_new_palette &&
                        (int)png_ptr->index_to_palette[p->right]
                        < num_new_palette)
                     {
                        int j, next_j;

                        if (num_new_palette & 0x01)
                        {
                           j = p->left;
                           next_j = p->right;
                        }
                        else
                        {
                           j = p->right;
                           next_j = p->left;
                        }

                        num_new_palette--;
                        palette[png_ptr->index_to_palette[j]]
                          = palette[num_new_palette];
                        if (!full_dither)
                        {
                           int k;

                           for (k = 0; k < num_palette; k++)
                           {
                              if (png_ptr->dither_index[k] ==
                                 png_ptr->index_to_palette[j])
                                 png_ptr->dither_index[k] =
                                    png_ptr->index_to_palette[next_j];
                              if ((int)png_ptr->dither_index[k] ==
                                 num_new_palette)
                                 png_ptr->dither_index[k] =
                                    png_ptr->index_to_palette[j];
                           }
                        }

                        png_ptr->index_to_palette[png_ptr->palette_to_index
                           [num_new_palette]] = png_ptr->index_to_palette[j];
                        png_ptr->palette_to_index[png_ptr->index_to_palette[j]]
                           = png_ptr->palette_to_index[num_new_palette];

                        png_ptr->index_to_palette[j] = (png_byte)num_new_palette;
                        png_ptr->palette_to_index[num_new_palette] = (png_byte)j;
                     }
                     if (num_new_palette <= maximum_colors)
                        break;
                  }
                  if (num_new_palette <= maximum_colors)
                     break;
               }
            }

            for (i = 0; i < 769; i++)
            {
               if (hash[i] != (void *)0x00000000)
               {
                  png_dsortp p = hash[i];
                  while (p)
                  {
                     t = p->next;
                     png_free(png_ptr, p);
                     p = t;
                  }
               }
               hash[i] = 0;
            }
            max_d += 96;
         }
         png_free(png_ptr, hash);
         png_free(png_ptr, png_ptr->palette_to_index);
         png_free(png_ptr, png_ptr->index_to_palette);
         png_ptr->palette_to_index=(void *)0x00000000;
         png_ptr->index_to_palette=(void *)0x00000000;
      }
      num_palette = maximum_colors;
   }
   if (png_ptr->palette == (void *)0x00000000)
   {
      png_ptr->palette = palette;
   }
   png_ptr->num_palette = (png_uint_16)num_palette;

   if (full_dither)
   {
      int i;
      png_bytep distance;
      int total_bits = 5 + 5 +
         5;
      int num_red = (1 << 5);
      int num_green = (1 << 5);
      int num_blue = (1 << 5);
      png_size_t num_entries = ((png_size_t)1 << total_bits);

      png_ptr->palette_lookup = (png_bytep )png_malloc(png_ptr,
         (png_uint_32)(num_entries * sizeof (png_byte)));

      memset_c(png_ptr->palette_lookup,0,num_entries * sizeof (png_byte));
#line 466 ".\\pngrtran.c"

      distance = (png_bytep)png_malloc(png_ptr, (png_uint_32)(num_entries *
         sizeof (png_byte)));

      memset_c(distance,0,num_entries * sizeof (png_byte));

      for (i = 0; i < num_palette; i++)
      {
         int ir, ig, ib;
         int r = (palette[i].red >> (8 - 5));
         int g = (palette[i].green >> (8 - 5));
         int b = (palette[i].blue >> (8 - 5));

         for (ir = 0; ir < num_red; ir++)
         {
            
            int dr = ((ir > r) ? ir - r : r - ir);
            int index_r = (ir << (5 + 5));

            for (ig = 0; ig < num_green; ig++)
            {
               
               int dg = ((ig > g) ? ig - g : g - ig);
               int dt = dr + dg;
               int dm = ((dr > dg) ? dr : dg);
               int index_g = index_r | (ig << 5);

               for (ib = 0; ib < num_blue; ib++)
               {
                  int d_index = index_g | ib;
                  
                  int db = ((ib > b) ? ib - b : b - ib);
                  int dmax = ((dm > db) ? dm : db);
                  int d = dmax + dt + db;

                  if (d < (int)distance[d_index])
                  {
                     distance[d_index] = (png_byte)d;
                     png_ptr->palette_lookup[d_index] = (png_byte)i;
                  }
               }
            }
         }
      }

      png_free(png_ptr, distance);
   }
}
#line 515 ".\\pngrtran.c"











void __stdcall
png_set_gamma(png_structp png_ptr, double scrn_gamma, double file_gamma)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   if ((fabsf_c(scrn_gamma * file_gamma - 1.0) > 0.05) ||
       (png_ptr->color_type & 4) ||
       (png_ptr->color_type == (2 | 1)))
     png_ptr->transformations |= 0x2000;
   png_ptr->gamma = (float)file_gamma;
   png_ptr->screen_gamma = (float)scrn_gamma;
}
#line 539 ".\\pngrtran.c"






void __stdcall
png_set_expand(png_structp png_ptr)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->transformations |= (0x1000 | 0x2000000L);
}



















void __stdcall
png_set_palette_to_rgb(png_structp png_ptr)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->transformations |= (0x1000 | 0x2000000L);
}



void __stdcall
png_set_expand_gray_1_2_4_to_8(png_structp png_ptr)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->transformations |= 0x1000;
}
#line 589 ".\\pngrtran.c"




void __stdcall
png_set_gray_1_2_4_to_8(png_structp png_ptr)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   png_ptr->transformations |= (0x1000 | 0x2000000L);
}
#line 601 ".\\pngrtran.c"



void __stdcall
png_set_tRNS_to_alpha(png_structp png_ptr)
{
   ;
   png_ptr->transformations |= (0x1000 | 0x2000000L);
}
#line 611 ".\\pngrtran.c"


void __stdcall
png_set_gray_to_rgb(png_structp png_ptr)
{
   ;
   png_ptr->transformations |= 0x4000;
}
#line 620 ".\\pngrtran.c"







void __stdcall
png_set_rgb_to_gray(png_structp png_ptr, int error_action, double red,
   double green)
{
      int red_fixed = (int)((float)red*100000.0 + 0.5);
      int green_fixed = (int)((float)green*100000.0 + 0.5);
      if(png_ptr == (void *)0x00000000) return;
      png_set_rgb_to_gray_fixed(png_ptr, error_action, red_fixed, green_fixed);
}
#line 637 ".\\pngrtran.c"

void __stdcall
png_set_rgb_to_gray_fixed(png_structp png_ptr, int error_action,
   png_fixed_point red, png_fixed_point green)
{
   ;
   if(png_ptr == (void *)0x00000000) return;
   switch(error_action)
   {
      case 1: png_ptr->transformations |= 0x600000L;
              break;
      case 2: png_ptr->transformations |= 0x400000L;
              break;
      case 3: png_ptr->transformations |= 0x200000L;
   }
   if (png_ptr->color_type == (2 | 1))

      png_ptr->transformations |= 0x1000;





#line 661 ".\\pngrtran.c"
   {
      png_uint_16 red_int, green_int;
      if(red < 0 || green < 0)
      {
         red_int   =  6968; 
         green_int = 23434; 
      }
      else if(red + green < 100000L)
      {
        red_int = (png_uint_16)(((png_uint_32)red*32768L)/100000L);
        green_int = (png_uint_16)(((png_uint_32)green*32768L)/100000L);
      }
      else
      {
         png_warning(png_ptr, "ignoring out of range rgb_to_gray coefficients");
         red_int   =  6968;
         green_int = 23434;
      }
      png_ptr->rgb_to_gray_red_coeff   = red_int;
      png_ptr->rgb_to_gray_green_coeff = green_int;
      png_ptr->rgb_to_gray_blue_coeff  = (png_uint_16)(32768-red_int-green_int);
   }
}
#line 685 ".\\pngrtran.c"


void __stdcall
png_set_read_user_transform_fn(png_structp png_ptr, png_user_transform_ptr
   read_user_transform_fn)
{
   ;
   if(png_ptr == (void *)0x00000000) return;

   png_ptr->transformations |= 0x100000L;
   png_ptr->read_user_transform_fn = read_user_transform_fn;
#line 699 ".\\pngrtran.c"





}
#line 706 ".\\pngrtran.c"




void 
png_init_read_transformations(png_structp png_ptr)
{
   ;


#line 717 ".\\pngrtran.c"
  {

   int color_type = png_ptr->color_type;
#line 722 ".\\pngrtran.c"




   

   






   if ((png_ptr->transformations & 0x0100) &&
       !(color_type & 2))
   {
          png_ptr->mode |= 0x800;
   } else if ((png_ptr->transformations & 0x0080) &&
              !(png_ptr->transformations & 0x0100) &&
              (png_ptr->transformations & 0x4000) &&
              png_ptr->background.red == png_ptr->background.green &&
              png_ptr->background.red == png_ptr->background.blue)
   {
          png_ptr->mode |= 0x800;
          png_ptr->background.gray = png_ptr->background.red;
   }
#line 749 ".\\pngrtran.c"

   if ((png_ptr->transformations & 0x0100) &&
       (png_ptr->transformations & 0x1000))
   {
      if (!(color_type & 2))  
      {
         
         switch (png_ptr->bit_depth)
         {
            case 1:
               png_ptr->background.gray *= (png_uint_16)0xff;
               png_ptr->background.red = png_ptr->background.green
                 =  png_ptr->background.blue = png_ptr->background.gray;
               if (!(png_ptr->transformations & 0x2000000L))
               {
                 png_ptr->trans_values.gray *= (png_uint_16)0xff;
                 png_ptr->trans_values.red = png_ptr->trans_values.green
                   = png_ptr->trans_values.blue = png_ptr->trans_values.gray;
               }
               break;
            case 2:
               png_ptr->background.gray *= (png_uint_16)0x55;
               png_ptr->background.red = png_ptr->background.green
                 = png_ptr->background.blue = png_ptr->background.gray;
               if (!(png_ptr->transformations & 0x2000000L))
               {
                 png_ptr->trans_values.gray *= (png_uint_16)0x55;
                 png_ptr->trans_values.red = png_ptr->trans_values.green
                   = png_ptr->trans_values.blue = png_ptr->trans_values.gray;
               }
               break;
            case 4:
               png_ptr->background.gray *= (png_uint_16)0x11;
               png_ptr->background.red = png_ptr->background.green
                 = png_ptr->background.blue = png_ptr->background.gray;
               if (!(png_ptr->transformations & 0x2000000L))
               {
                 png_ptr->trans_values.gray *= (png_uint_16)0x11;
                 png_ptr->trans_values.red = png_ptr->trans_values.green
                   = png_ptr->trans_values.blue = png_ptr->trans_values.gray;
               }
               break;
            case 8:
            case 16:
               png_ptr->background.red = png_ptr->background.green
                 = png_ptr->background.blue = png_ptr->background.gray;
               break;
         }
      }
      else if (color_type == (2 | 1))
      {
         png_ptr->background.red   =
            png_ptr->palette[png_ptr->background.index].red;
         png_ptr->background.green =
            png_ptr->palette[png_ptr->background.index].green;
         png_ptr->background.blue  =
            png_ptr->palette[png_ptr->background.index].blue;


        if (png_ptr->transformations & 0x80000L)
        {

           if (!(png_ptr->transformations & 0x2000000L))
#line 813 ".\\pngrtran.c"
           {
           

              int i,istop;
              istop=(int)png_ptr->num_trans;
              for (i=0; i<istop; i++)
                 png_ptr->trans[i] = (png_byte)(255 - png_ptr->trans[i]);
           }
        }
#line 823 ".\\pngrtran.c"

      }
   }
#line 827 ".\\pngrtran.c"


   png_ptr->background_1 = png_ptr->background;
#line 831 ".\\pngrtran.c"


   if ((color_type == (2 | 1) && png_ptr->num_trans != 0)
       && (fabsf_c(png_ptr->screen_gamma * png_ptr->gamma - 1.0)
         < 0.05))
   {
    int i,k;
    k=0;
    for (i=0; i<png_ptr->num_trans; i++)
    {
      if (png_ptr->trans[i] != 0 && png_ptr->trans[i] != 0xff)
        k=1; 
    }
    if (k == 0)
      png_ptr->transformations &= (~0x2000);
   }

   if ((png_ptr->transformations & (0x2000 | 0x600000L)) &&
        png_ptr->gamma != 0.0)
   {
      png_build_gamma_table(png_ptr);

      if (png_ptr->transformations & 0x0080)
      {
         if (color_type == (2 | 1))
         {
           

            png_color back, back_1;
            png_colorp palette = png_ptr->palette;
            int num_palette = png_ptr->num_palette;
            int i;
            if (png_ptr->background_gamma_type == 2)
            {
               back.red = png_ptr->gamma_table[png_ptr->background.red];
               back.green = png_ptr->gamma_table[png_ptr->background.green];
               back.blue = png_ptr->gamma_table[png_ptr->background.blue];

               back_1.red = png_ptr->gamma_to_1[png_ptr->background.red];
               back_1.green = png_ptr->gamma_to_1[png_ptr->background.green];
               back_1.blue = png_ptr->gamma_to_1[png_ptr->background.blue];
            }
            else
            {
               double g, gs;

               switch (png_ptr->background_gamma_type)
               {
                  case 1:
                     g = (png_ptr->screen_gamma);
                     gs = 1.0;
                     break;
                  case 2:
                     g = 1.0 / (png_ptr->gamma);
                     gs = 1.0 / (png_ptr->gamma * png_ptr->screen_gamma);
                     break;
                  case 3:
                     g = 1.0 / (png_ptr->background_gamma);
                     gs = 1.0 / (png_ptr->background_gamma *
                                 png_ptr->screen_gamma);
                     break;
                  default:
                     g = 1.0;    
                     gs = 1.0;   
               }

               if ( fabsf_c(gs - 1.0) < 0.05)
               {
                  back.red   = (png_byte)png_ptr->background.red;
                  back.green = (png_byte)png_ptr->background.green;
                  back.blue  = (png_byte)png_ptr->background.blue;
               }
               else
               {
                  back.red = (png_byte)(powf_c(png_ptr->background.red/255, gs) * 255.0f + 0.5f);
                  back.green = (png_byte)(powf_c(png_ptr->background.green/255, gs) * 255.0f + 0.5f);
                  back.blue = (png_byte)(powf_c(png_ptr->background.blue/255, gs) * 255.0f + 0.5f);
               }

               back_1.red = (png_byte)(powf_c(png_ptr->background.red/255, g) * 255.0f + 0.5f);
               back_1.green = (png_byte)(powf_c(png_ptr->background.green/255, g) * 255.0f + 0.5f);
               back_1.blue = (png_byte)(powf_c(png_ptr->background.blue/255, g) * 255.0f + 0.5f);
            }
            for (i = 0; i < num_palette; i++)
            {
               if (i < (int)png_ptr->num_trans && png_ptr->trans[i] != 0xff)
               {
                  if (png_ptr->trans[i] == 0)
                  {
                     palette[i] = back;
                  }
                  else 
                  {
                     png_byte v, w;

                     v = png_ptr->gamma_to_1[palette[i].red];
                     { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(png_ptr->trans[i]) + (png_uint_16)(back_1.red)*(png_uint_16)(255 - (png_uint_16)(png_ptr->trans[i])) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                     palette[i].red = png_ptr->gamma_from_1[w];

                     v = png_ptr->gamma_to_1[palette[i].green];
                     { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(png_ptr->trans[i]) + (png_uint_16)(back_1.green)*(png_uint_16)(255 - (png_uint_16)(png_ptr->trans[i])) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                     palette[i].green = png_ptr->gamma_from_1[w];

                     v = png_ptr->gamma_to_1[palette[i].blue];
                     { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(png_ptr->trans[i]) + (png_uint_16)(back_1.blue)*(png_uint_16)(255 - (png_uint_16)(png_ptr->trans[i])) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                     palette[i].blue = png_ptr->gamma_from_1[w];
                  }
               }
               else
               {
                  palette[i].red = png_ptr->gamma_table[palette[i].red];
                  palette[i].green = png_ptr->gamma_table[palette[i].green];
                  palette[i].blue = png_ptr->gamma_table[palette[i].blue];
               }
            }
         }
         
         else
         
         {
            double m = (double)(((png_uint_32)1 << png_ptr->bit_depth) - 1);
            double g = 1.0;
            double gs = 1.0;

            switch (png_ptr->background_gamma_type)
            {
               case 1:
                  g = (png_ptr->screen_gamma);
                  gs = 1.0;
                  break;
               case 2:
                  g = 1.0 / (png_ptr->gamma);
                  gs = 1.0 / (png_ptr->gamma * png_ptr->screen_gamma);
                  break;
               case 3:
                  g = 1.0 / (png_ptr->background_gamma);
                  gs = 1.0 / (png_ptr->background_gamma *
                     png_ptr->screen_gamma);
                  break;
            }

            png_ptr->background_1.gray = (png_uint_16)(powf_c(
               (double)png_ptr->background.gray / m, g) * m + 0.5f);
            png_ptr->background.gray = (png_uint_16)(powf_c(
               (double)png_ptr->background.gray / m, gs) * m + 0.5f);

            if ((png_ptr->background.red != png_ptr->background.green) ||
                (png_ptr->background.red != png_ptr->background.blue) ||
                (png_ptr->background.red != png_ptr->background.gray))
            {
               
               png_ptr->background_1.red = (png_uint_16)(powf_c(
                  (double)png_ptr->background.red / m, g) * m + 0.5f);
               png_ptr->background_1.green = (png_uint_16)(powf_c(
                  (double)png_ptr->background.green / m, g) * m + 0.5f);
               png_ptr->background_1.blue = (png_uint_16)(powf_c(
                  (double)png_ptr->background.blue / m, g) * m + 0.5f);
               png_ptr->background.red = (png_uint_16)(powf_c(
                  (double)png_ptr->background.red / m, gs) * m + 0.5f);
               png_ptr->background.green = (png_uint_16)(powf_c(
                  (double)png_ptr->background.green / m, gs) * m + 0.5f);
               png_ptr->background.blue = (png_uint_16)(powf_c(
                  (double)png_ptr->background.blue / m, gs) * m + 0.5f);
            }
            else
            {
               
               png_ptr->background_1.red = png_ptr->background_1.green
                 = png_ptr->background_1.blue = png_ptr->background_1.gray;
               png_ptr->background.red = png_ptr->background.green
                 = png_ptr->background.blue = png_ptr->background.gray;
            }
         }
      }
      else
      
#line 1008 ".\\pngrtran.c"
      if (color_type == (2 | 1))
      {
         png_colorp palette = png_ptr->palette;
         int num_palette = png_ptr->num_palette;
         int i;

         for (i = 0; i < num_palette; i++)
         {
            palette[i].red = png_ptr->gamma_table[palette[i].red];
            palette[i].green = png_ptr->gamma_table[palette[i].green];
            palette[i].blue = png_ptr->gamma_table[palette[i].blue];
         }
      }
   }

   else
#line 1025 ".\\pngrtran.c"
#line 1026 ".\\pngrtran.c"

   
   if ((png_ptr->transformations & 0x0080) &&
       (color_type == (2 | 1)))
   {
      int i;
      int istop = (int)png_ptr->num_trans;
      png_color back;
      png_colorp palette = png_ptr->palette;

      back.red   = (png_byte)png_ptr->background.red;
      back.green = (png_byte)png_ptr->background.green;
      back.blue  = (png_byte)png_ptr->background.blue;

      for (i = 0; i < istop; i++)
      {
         if (png_ptr->trans[i] == 0)
         {
            palette[i] = back;
         }
         else if (png_ptr->trans[i] != 0xff)
         {
            
            { png_uint_16 temp = (png_uint_16)((png_uint_16)(palette[i].red) * (png_uint_16)(png_ptr->trans[i]) + (png_uint_16)(back.red)*(png_uint_16)(255 - (png_uint_16)(png_ptr->trans[i])) + (png_uint_16)128); (palette[i].red) = (png_byte)((temp + (temp >> 8)) >> 8); };
#line 1051 ".\\pngrtran.c"
            { png_uint_16 temp = (png_uint_16)((png_uint_16)(palette[i].green) * (png_uint_16)(png_ptr->trans[i]) + (png_uint_16)(back.green)*(png_uint_16)(255 - (png_uint_16)(png_ptr->trans[i])) + (png_uint_16)128); (palette[i].green) = (png_byte)((temp + (temp >> 8)) >> 8); };
#line 1053 ".\\pngrtran.c"
            { png_uint_16 temp = (png_uint_16)((png_uint_16)(palette[i].blue) * (png_uint_16)(png_ptr->trans[i]) + (png_uint_16)(back.blue)*(png_uint_16)(255 - (png_uint_16)(png_ptr->trans[i])) + (png_uint_16)128); (palette[i].blue) = (png_byte)((temp + (temp >> 8)) >> 8); };
#line 1055 ".\\pngrtran.c"
         }
      }
   }
#line 1059 ".\\pngrtran.c"


   if ((png_ptr->transformations & 0x0008) &&
      (color_type == (2 | 1)))
   {
      png_uint_16 i;
      png_uint_16 istop = png_ptr->num_palette;
      int sr = 8 - png_ptr->sig_bit.red;
      int sg = 8 - png_ptr->sig_bit.green;
      int sb = 8 - png_ptr->sig_bit.blue;

      if (sr < 0 || sr > 8)
         sr = 0;
      if (sg < 0 || sg > 8)
         sg = 0;
      if (sb < 0 || sb > 8)
         sb = 0;
      for (i = 0; i < istop; i++)
      {
         png_ptr->palette[i].red >>= sr;
         png_ptr->palette[i].green >>= sg;
         png_ptr->palette[i].blue >>= sb;
      }
   }
#line 1084 ".\\pngrtran.c"
 }



#line 1090 ".\\pngrtran.c"
}





void 
png_read_transform_info(png_structp png_ptr, png_infop info_ptr)
{
   ;

   if (png_ptr->transformations & 0x1000)
   {
      if (info_ptr->color_type == (2 | 1))
      {
         if (png_ptr->num_trans && (png_ptr->transformations & 0x2000000L))
            info_ptr->color_type = (2 | 4);
         else
            info_ptr->color_type = (2);
         info_ptr->bit_depth = 8;
         info_ptr->num_trans = 0;
      }
      else
      {
         if (png_ptr->num_trans)
         {
            if (png_ptr->transformations & 0x2000000L)
              info_ptr->color_type |= 4;
            else
              info_ptr->color_type |= 2;
         }
         if (info_ptr->bit_depth < 8)
            info_ptr->bit_depth = 8;
         info_ptr->num_trans = 0;
      }
   }
#line 1127 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0080)
   {
      info_ptr->color_type &= ~4;
      info_ptr->num_trans = 0;
      info_ptr->background = png_ptr->background;
   }
#line 1136 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x2000)
   {

      info_ptr->gamma = png_ptr->gamma;
#line 1143 ".\\pngrtran.c"

      info_ptr->int_gamma = png_ptr->int_gamma;
#line 1146 ".\\pngrtran.c"
   }
#line 1148 ".\\pngrtran.c"


   if ((png_ptr->transformations & 0x0400) && (info_ptr->bit_depth == 16))
      info_ptr->bit_depth = 8;
#line 1153 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x4000)
      info_ptr->color_type |= 2;
#line 1158 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x600000L)
      info_ptr->color_type &= ~2;
#line 1163 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0040)
   {
      if (((info_ptr->color_type == (2)) ||
         (info_ptr->color_type == (2 | 4))) &&
         png_ptr->palette_lookup && info_ptr->bit_depth == 8)
      {
         info_ptr->color_type = (2 | 1);
      }
   }
#line 1175 ".\\pngrtran.c"


   if ((png_ptr->transformations & 0x0004) && (info_ptr->bit_depth < 8))
      info_ptr->bit_depth = 8;
#line 1180 ".\\pngrtran.c"

   if (info_ptr->color_type == (2 | 1))
      info_ptr->channels = 1;
   else if (info_ptr->color_type & 2)
      info_ptr->channels = 3;
   else
      info_ptr->channels = 1;


   if (png_ptr->flags & 0x400000L)
      info_ptr->color_type &= ~4;
#line 1192 ".\\pngrtran.c"

   if (info_ptr->color_type & 4)
      info_ptr->channels++;


   
   if ((png_ptr->transformations & 0x8000L) &&
       ((info_ptr->color_type == (2)) ||
       (info_ptr->color_type == 0)))
   {
      info_ptr->channels++;
      

      if (png_ptr->transformations & 0x1000000L)
        info_ptr->color_type |= 4;
#line 1208 ".\\pngrtran.c"
   }
#line 1210 ".\\pngrtran.c"


   if(png_ptr->transformations & 0x100000L)
     {
       if(info_ptr->bit_depth < png_ptr->user_transform_depth)
         info_ptr->bit_depth = png_ptr->user_transform_depth;
       if(info_ptr->channels < png_ptr->user_transform_channels)
         info_ptr->channels = png_ptr->user_transform_channels;
     }
#line 1221 ".\\pngrtran.c"

   info_ptr->pixel_depth = (png_byte)(info_ptr->channels *
      info_ptr->bit_depth);

   info_ptr->rowbytes = ((info_ptr->pixel_depth) >= 8 ? ((info_ptr->width) * (((png_uint_32)(info_ptr->pixel_depth)) >> 3)) : (( ((info_ptr->width) * ((png_uint_32)(info_ptr->pixel_depth))) + 7) >> 3) );




#line 1231 ".\\pngrtran.c"
}





void 
png_do_read_transformations(png_structp png_ptr)
{
   ;

   if (png_ptr->row_buf == (void *)0x00000000)
   {






#line 1251 ".\\pngrtran.c"
      png_error(png_ptr, "NULL row buffer");
#line 1253 ".\\pngrtran.c"
   }
#line 1255 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x1000)
   {
      if (png_ptr->row_info.color_type == (2 | 1))
      {
         png_do_expand_palette(&(png_ptr->row_info), png_ptr->row_buf + 1,
            png_ptr->palette, png_ptr->trans, png_ptr->num_trans);
      }
      else
      {
         if (png_ptr->num_trans && (png_ptr->transformations & 0x2000000L))
            png_do_expand(&(png_ptr->row_info), png_ptr->row_buf + 1,
               &(png_ptr->trans_values));
         else
            png_do_expand(&(png_ptr->row_info), png_ptr->row_buf + 1,
               (void *)0x00000000);
      }
   }
#line 1275 ".\\pngrtran.c"


   if (png_ptr->flags & 0x400000L)
      png_do_strip_filler(&(png_ptr->row_info), png_ptr->row_buf + 1,
         0x0080 | (png_ptr->flags & 0x400000L));
#line 1281 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x600000L)
   {
      int rgb_error =
         png_do_rgb_to_gray(png_ptr, &(png_ptr->row_info), png_ptr->row_buf + 1);
      if(rgb_error)
      {
         png_ptr->rgb_to_gray_status=1;
         if(png_ptr->transformations & 0x400000L)
            png_warning(png_ptr, "png_do_rgb_to_gray found nongray pixel");
         if(png_ptr->transformations & 0x200000L)
            png_error(png_ptr, "png_do_rgb_to_gray found nongray pixel");
      }
   }
#line 1297 ".\\pngrtran.c"
































   

   if ((png_ptr->transformations & 0x4000) &&
       !(png_ptr->mode & 0x800))
      png_do_gray_to_rgb(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1335 ".\\pngrtran.c"


   if ((png_ptr->transformations & 0x0080) &&
      ((png_ptr->num_trans != 0 ) ||
      (png_ptr->color_type & 4)))
      png_do_background(&(png_ptr->row_info), png_ptr->row_buf + 1,
         &(png_ptr->trans_values), &(png_ptr->background)

         , &(png_ptr->background_1),
         png_ptr->gamma_table, png_ptr->gamma_from_1,
         png_ptr->gamma_to_1, png_ptr->gamma_16_table,
         png_ptr->gamma_16_from_1, png_ptr->gamma_16_to_1,
         png_ptr->gamma_shift
#line 1349 ".\\pngrtran.c"
);
#line 1351 ".\\pngrtran.c"


   if ((png_ptr->transformations & 0x2000) &&

      !((png_ptr->transformations & 0x0080) &&
      ((png_ptr->num_trans != 0) ||
      (png_ptr->color_type & 4))) &&
#line 1359 ".\\pngrtran.c"
      (png_ptr->color_type != (2 | 1)))
      png_do_gamma(&(png_ptr->row_info), png_ptr->row_buf + 1,
         png_ptr->gamma_table, png_ptr->gamma_16_table,
         png_ptr->gamma_shift);
#line 1364 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0400)
      png_do_chop(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1369 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0040)
   {
      png_do_dither((png_row_infop)&(png_ptr->row_info), png_ptr->row_buf + 1,
         png_ptr->palette_lookup, png_ptr->dither_index);
      if(png_ptr->row_info.rowbytes == (png_uint_32)0)
         png_error(png_ptr, "png_do_dither returned rowbytes=0");
   }
#line 1379 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0020)
      png_do_invert(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1384 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0008)
      png_do_unshift(&(png_ptr->row_info), png_ptr->row_buf + 1,
         &(png_ptr->shift));
#line 1390 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0004)
      png_do_unpack(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1395 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0001)
      png_do_bgr(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1400 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x10000L)
      png_do_packswap(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1405 ".\\pngrtran.c"


   
   if ((png_ptr->transformations & 0x4000) &&
       (png_ptr->mode & 0x800))
      png_do_gray_to_rgb(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1412 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x8000L)
      png_do_read_filler(&(png_ptr->row_info), png_ptr->row_buf + 1,
         (png_uint_32)png_ptr->filler, png_ptr->flags);
#line 1418 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x80000L)
      png_do_read_invert_alpha(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1423 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x20000L)
      png_do_read_swap_alpha(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1428 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x0010)
      png_do_swap(&(png_ptr->row_info), png_ptr->row_buf + 1);
#line 1433 ".\\pngrtran.c"


   if (png_ptr->transformations & 0x100000L)
    {
      if(png_ptr->read_user_transform_fn != (void *)0x00000000)
        (*(png_ptr->read_user_transform_fn)) 
          (png_ptr,                    
           &(png_ptr->row_info),       
             
             
             
             
             
             
           png_ptr->row_buf + 1);      

      if(png_ptr->user_transform_depth)
         png_ptr->row_info.bit_depth = png_ptr->user_transform_depth;
      if(png_ptr->user_transform_channels)
         png_ptr->row_info.channels = png_ptr->user_transform_channels;
#line 1454 ".\\pngrtran.c"
      png_ptr->row_info.pixel_depth = (png_byte)(png_ptr->row_info.bit_depth *
         png_ptr->row_info.channels);
      png_ptr->row_info.rowbytes = ((png_ptr->row_info.pixel_depth) >= 8 ? ((png_ptr->row_info.width) * (((png_uint_32)(png_ptr->row_info.pixel_depth)) >> 3)) : (( ((png_ptr->row_info.width) * ((png_uint_32)(png_ptr->row_info.pixel_depth))) + 7) >> 3) );
#line 1458 ".\\pngrtran.c"
   }
#line 1460 ".\\pngrtran.c"

}








void 
png_do_unpack(png_row_infop row_info, png_bytep row)
{
   ;


#line 1477 ".\\pngrtran.c"
   if (row_info->bit_depth < 8)
#line 1479 ".\\pngrtran.c"
   {
      png_uint_32 i;
      png_uint_32 row_width=row_info->width;

      switch (row_info->bit_depth)
      {
         case 1:
         {
            png_bytep sp = row + (png_size_t)((row_width - 1) >> 3);
            png_bytep dp = row + (png_size_t)row_width - 1;
            png_uint_32 shift = 7 - (int)((row_width + 7) & 0x07);
            for (i = 0; i < row_width; i++)
            {
               *dp = (png_byte)((*sp >> shift) & 0x01);
               if (shift == 7)
               {
                  shift = 0;
                  sp--;
               }
               else
                  shift++;

               dp--;
            }
            break;
         }
         case 2:
         {

            png_bytep sp = row + (png_size_t)((row_width - 1) >> 2);
            png_bytep dp = row + (png_size_t)row_width - 1;
            png_uint_32 shift = (int)((3 - ((row_width + 3) & 0x03)) << 1);
            for (i = 0; i < row_width; i++)
            {
               *dp = (png_byte)((*sp >> shift) & 0x03);
               if (shift == 6)
               {
                  shift = 0;
                  sp--;
               }
               else
                  shift += 2;

               dp--;
            }
            break;
         }
         case 4:
         {
            png_bytep sp = row + (png_size_t)((row_width - 1) >> 1);
            png_bytep dp = row + (png_size_t)row_width - 1;
            png_uint_32 shift = (int)((1 - ((row_width + 1) & 0x01)) << 2);
            for (i = 0; i < row_width; i++)
            {
               *dp = (png_byte)((*sp >> shift) & 0x0f);
               if (shift == 4)
               {
                  shift = 0;
                  sp--;
               }
               else
                  shift = 4;

               dp--;
            }
            break;
         }
      }
      row_info->bit_depth = 8;
      row_info->pixel_depth = (png_byte)(8 * row_info->channels);
      row_info->rowbytes = row_width * row_info->channels;
   }
}
#line 1553 ".\\pngrtran.c"







void 
png_do_unshift(png_row_infop row_info, png_bytep row, png_color_8p sig_bits)
{
   ;
   if (


#line 1568 ".\\pngrtran.c"
       row_info->color_type != (2 | 1))
   {
      int shift[4];
      int channels = 0;
      int c;
      png_uint_16 value = 0;
      png_uint_32 row_width = row_info->width;

      if (row_info->color_type & 2)
      {
         shift[channels++] = row_info->bit_depth - sig_bits->red;
         shift[channels++] = row_info->bit_depth - sig_bits->green;
         shift[channels++] = row_info->bit_depth - sig_bits->blue;
      }
      else
      {
         shift[channels++] = row_info->bit_depth - sig_bits->gray;
      }
      if (row_info->color_type & 4)
      {
         shift[channels++] = row_info->bit_depth - sig_bits->alpha;
      }

      for (c = 0; c < channels; c++)
      {
         if (shift[c] <= 0)
            shift[c] = 0;
         else
            value = 1;
      }

      if (!value)
         return;

      switch (row_info->bit_depth)
      {
         case 2:
         {
            png_bytep bp;
            png_uint_32 i;
            png_uint_32 istop = row_info->rowbytes;

            for (bp = row, i = 0; i < istop; i++)
            {
               *bp >>= 1;
               *bp++ &= 0x55;
            }
            break;
         }
         case 4:
         {
            png_bytep bp = row;
            png_uint_32 i;
            png_uint_32 istop = row_info->rowbytes;
            png_byte mask = (png_byte)((((int)0xf0 >> shift[0]) & (int)0xf0) |
               (png_byte)((int)0xf >> shift[0]));

            for (i = 0; i < istop; i++)
            {
               *bp >>= shift[0];
               *bp++ &= mask;
            }
            break;
         }
         case 8:
         {
            png_bytep bp = row;
            png_uint_32 i;
            png_uint_32 istop = row_width * channels;

            for (i = 0; i < istop; i++)
            {
               *bp++ >>= shift[i%channels];
            }
            break;
         }
         case 16:
         {
            png_bytep bp = row;
            png_uint_32 i;
            png_uint_32 istop = channels * row_width;

            for (i = 0; i < istop; i++)
            {
               value = (png_uint_16)((*bp << 8) + *(bp + 1));
               value >>= shift[i%channels];
               *bp++ = (png_byte)(value >> 8);
               *bp++ = (png_byte)(value & 0xff);
            }
            break;
         }
      }
   }
}
#line 1663 ".\\pngrtran.c"



void 
png_do_chop(png_row_infop row_info, png_bytep row)
{
   ;


#line 1673 ".\\pngrtran.c"
   if (row_info->bit_depth == 16)
#line 1675 ".\\pngrtran.c"
   {
      png_bytep sp = row;
      png_bytep dp = row;
      png_uint_32 i;
      png_uint_32 istop = row_info->width * row_info->channels;

      for (i = 0; i<istop; i++, sp += 2, dp++)
      {
























#line 1708 ".\\pngrtran.c"
       
         *dp = *sp;
#line 1711 ".\\pngrtran.c"
      }
      row_info->bit_depth = 8;
      row_info->pixel_depth = (png_byte)(8 * row_info->channels);
      row_info->rowbytes = row_info->width * row_info->channels;
   }
}
#line 1718 ".\\pngrtran.c"


void 
png_do_read_swap_alpha(png_row_infop row_info, png_bytep row)
{
   ;


#line 1727 ".\\pngrtran.c"
   {
      png_uint_32 row_width = row_info->width;
      if (row_info->color_type == (2 | 4))
      {
         
         if (row_info->bit_depth == 8)
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_byte save;
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               save = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = save;
            }
         }
         
         else
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_byte save[2];
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               save[0] = *(--sp);
               save[1] = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = save[0];
               *(--dp) = save[1];
            }
         }
      }
      else if (row_info->color_type == (4))
      {
         
         if (row_info->bit_depth == 8)
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_byte save;
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               save = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = save;
            }
         }
         
         else
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_byte save[2];
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               save[0] = *(--sp);
               save[1] = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = save[0];
               *(--dp) = save[1];
            }
         }
      }
   }
}
#line 1810 ".\\pngrtran.c"


void 
png_do_read_invert_alpha(png_row_infop row_info, png_bytep row)
{
   ;


#line 1819 ".\\pngrtran.c"
   {
      png_uint_32 row_width = row_info->width;
      if (row_info->color_type == (2 | 4))
      {
         
         if (row_info->bit_depth == 8)
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               *(--dp) = (png_byte)(255 - *(--sp));







               sp-=3;
               dp=sp;
            }
         }
         
         else
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               *(--dp) = (png_byte)(255 - *(--sp));
               *(--dp) = (png_byte)(255 - *(--sp));










               sp-=6;
               dp=sp;
            }
         }
      }
      else if (row_info->color_type == (4))
      {
         
         if (row_info->bit_depth == 8)
         {
            png_bytep sp = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               *(--dp) = (png_byte)(255 - *(--sp));
               *(--dp) = *(--sp);
            }
         }
         
         else
         {
            png_bytep sp  = row + row_info->rowbytes;
            png_bytep dp = sp;
            png_uint_32 i;

            for (i = 0; i < row_width; i++)
            {
               *(--dp) = (png_byte)(255 - *(--sp));
               *(--dp) = (png_byte)(255 - *(--sp));




               sp-=2;
               dp=sp;
            }
         }
      }
   }
}
#line 1908 ".\\pngrtran.c"



void 
png_do_read_filler(png_row_infop row_info, png_bytep row,
   png_uint_32 filler, png_uint_32 flags)
{
   png_uint_32 i;
   png_uint_32 row_width = row_info->width;

   png_byte hi_filler = (png_byte)((filler>>8) & 0xff);
   png_byte lo_filler = (png_byte)(filler & 0xff);

   ;
   if (


#line 1926 ".\\pngrtran.c"
       row_info->color_type == 0)
   {
      if(row_info->bit_depth == 8)
      {
         
         if (flags & 0x0080)
         {
            png_bytep sp = row + (png_size_t)row_width;
            png_bytep dp =  sp + (png_size_t)row_width;
            for (i = 1; i < row_width; i++)
            {
               *(--dp) = lo_filler;
               *(--dp) = *(--sp);
            }
            *(--dp) = lo_filler;
            row_info->channels = 2;
            row_info->pixel_depth = 16;
            row_info->rowbytes = row_width * 2;
         }
      
         else
         {
            png_bytep sp = row + (png_size_t)row_width;
            png_bytep dp = sp  + (png_size_t)row_width;
            for (i = 0; i < row_width; i++)
            {
               *(--dp) = *(--sp);
               *(--dp) = lo_filler;
            }
            row_info->channels = 2;
            row_info->pixel_depth = 16;
            row_info->rowbytes = row_width * 2;
         }
      }
      else if(row_info->bit_depth == 16)
      {
         
         if (flags & 0x0080)
         {
            png_bytep sp = row + (png_size_t)row_width * 2;
            png_bytep dp = sp  + (png_size_t)row_width * 2;
            for (i = 1; i < row_width; i++)
            {
               *(--dp) = hi_filler;
               *(--dp) = lo_filler;
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
            }
            *(--dp) = hi_filler;
            *(--dp) = lo_filler;
            row_info->channels = 2;
            row_info->pixel_depth = 32;
            row_info->rowbytes = row_width * 4;
         }
         
         else
         {
            png_bytep sp = row + (png_size_t)row_width * 2;
            png_bytep dp = sp  + (png_size_t)row_width * 2;
            for (i = 0; i < row_width; i++)
            {
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = hi_filler;
               *(--dp) = lo_filler;
            }
            row_info->channels = 2;
            row_info->pixel_depth = 32;
            row_info->rowbytes = row_width * 4;
         }
      }
   } 
   else if (row_info->color_type == (2))
   {
      if(row_info->bit_depth == 8)
      {
         
         if (flags & 0x0080)
         {
            png_bytep sp = row + (png_size_t)row_width * 3;
            png_bytep dp = sp  + (png_size_t)row_width;
            for (i = 1; i < row_width; i++)
            {
               *(--dp) = lo_filler;
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
            }
            *(--dp) = lo_filler;
            row_info->channels = 4;
            row_info->pixel_depth = 32;
            row_info->rowbytes = row_width * 4;
         }
      
         else
         {
            png_bytep sp = row + (png_size_t)row_width * 3;
            png_bytep dp = sp + (png_size_t)row_width;
            for (i = 0; i < row_width; i++)
            {
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = lo_filler;
            }
            row_info->channels = 4;
            row_info->pixel_depth = 32;
            row_info->rowbytes = row_width * 4;
         }
      }
      else if(row_info->bit_depth == 16)
      {
         
         if (flags & 0x0080)
         {
            png_bytep sp = row + (png_size_t)row_width * 6;
            png_bytep dp = sp  + (png_size_t)row_width * 2;
            for (i = 1; i < row_width; i++)
            {
               *(--dp) = hi_filler;
               *(--dp) = lo_filler;
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
            }
            *(--dp) = hi_filler;
            *(--dp) = lo_filler;
            row_info->channels = 4;
            row_info->pixel_depth = 64;
            row_info->rowbytes = row_width * 8;
         }
         
         else
         {
            png_bytep sp = row + (png_size_t)row_width * 6;
            png_bytep dp = sp  + (png_size_t)row_width * 2;
            for (i = 0; i < row_width; i++)
            {
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = *(--sp);
               *(--dp) = hi_filler;
               *(--dp) = lo_filler;
            }
            row_info->channels = 4;
            row_info->pixel_depth = 64;
            row_info->rowbytes = row_width * 8;
         }
      }
   } 
}
#line 2084 ".\\pngrtran.c"



void 
png_do_gray_to_rgb(png_row_infop row_info, png_bytep row)
{
   png_uint_32 i;
   png_uint_32 row_width = row_info->width;

   ;
   if (row_info->bit_depth >= 8 &&


#line 2098 ".\\pngrtran.c"
      !(row_info->color_type & 2))
   {
      if (row_info->color_type == 0)
      {
         if (row_info->bit_depth == 8)
         {
            png_bytep sp = row + (png_size_t)row_width - 1;
            png_bytep dp = sp  + (png_size_t)row_width * 2;
            for (i = 0; i < row_width; i++)
            {
               *(dp--) = *sp;
               *(dp--) = *sp;
               *(dp--) = *(sp--);
            }
         }
         else
         {
            png_bytep sp = row + (png_size_t)row_width * 2 - 1;
            png_bytep dp = sp  + (png_size_t)row_width * 4;
            for (i = 0; i < row_width; i++)
            {
               *(dp--) = *sp;
               *(dp--) = *(sp - 1);
               *(dp--) = *sp;
               *(dp--) = *(sp - 1);
               *(dp--) = *(sp--);
               *(dp--) = *(sp--);
            }
         }
      }
      else if (row_info->color_type == (4))
      {
         if (row_info->bit_depth == 8)
         {
            png_bytep sp = row + (png_size_t)row_width * 2 - 1;
            png_bytep dp = sp  + (png_size_t)row_width * 2;
            for (i = 0; i < row_width; i++)
            {
               *(dp--) = *(sp--);
               *(dp--) = *sp;
               *(dp--) = *sp;
               *(dp--) = *(sp--);
            }
         }
         else
         {
            png_bytep sp = row + (png_size_t)row_width * 4 - 1;
            png_bytep dp = sp  + (png_size_t)row_width * 4;
            for (i = 0; i < row_width; i++)
            {
               *(dp--) = *(sp--);
               *(dp--) = *(sp--);
               *(dp--) = *sp;
               *(dp--) = *(sp - 1);
               *(dp--) = *sp;
               *(dp--) = *(sp - 1);
               *(dp--) = *(sp--);
               *(dp--) = *(sp--);
            }
         }
      }
      row_info->channels += (png_byte)2;
      row_info->color_type |= 2;
      row_info->pixel_depth = (png_byte)(row_info->channels *
         row_info->bit_depth);
      row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
   }
}
#line 2167 ".\\pngrtran.c"





















int 
png_do_rgb_to_gray(png_structp png_ptr, png_row_infop row_info, png_bytep row)

{
   png_uint_32 i;

   png_uint_32 row_width = row_info->width;
   int rgb_error = 0;

   ;
   if (


#line 2202 ".\\pngrtran.c"
      (row_info->color_type & 2))
   {
      png_uint_32 rc = png_ptr->rgb_to_gray_red_coeff;
      png_uint_32 gc = png_ptr->rgb_to_gray_green_coeff;
      png_uint_32 bc = png_ptr->rgb_to_gray_blue_coeff;

      if (row_info->color_type == (2))
      {
         if (row_info->bit_depth == 8)
         {

            if (png_ptr->gamma_from_1 != (void *)0x00000000 && png_ptr->gamma_to_1 != (void *)0x00000000)
            {
               png_bytep sp = row;
               png_bytep dp = row;

               for (i = 0; i < row_width; i++)
               {
                  png_byte red   = png_ptr->gamma_to_1[*(sp++)];
                  png_byte green = png_ptr->gamma_to_1[*(sp++)];
                  png_byte blue  = png_ptr->gamma_to_1[*(sp++)];
                  if(red != green || red != blue)
                  {
                     rgb_error |= 1;
                     *(dp++) = png_ptr->gamma_from_1[
                       (rc*red+gc*green+bc*blue)>>15];
                  }
                  else
                     *(dp++) = *(sp-1);
               }
            }
            else
#line 2235 ".\\pngrtran.c"
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_byte red   = *(sp++);
                  png_byte green = *(sp++);
                  png_byte blue  = *(sp++);
                  if(red != green || red != blue)
                  {
                     rgb_error |= 1;
                     *(dp++) = (png_byte)((rc*red+gc*green+bc*blue)>>15);
                  }
                  else
                     *(dp++) = *(sp-1);
               }
            }
         }

         else 
         {

            if (png_ptr->gamma_16_to_1 != (void *)0x00000000 &&
                png_ptr->gamma_16_from_1 != (void *)0x00000000)
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 red, green, blue, w;

                  red   = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;
                  green = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;
                  blue  = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;

                  if(red == green && red == blue)
                     w = red;
                  else
                  {
                     png_uint_16 red_1   = png_ptr->gamma_16_to_1[(red&0xff) >>
                                  png_ptr->gamma_shift][red>>8];
                     png_uint_16 green_1 = png_ptr->gamma_16_to_1[(green&0xff) >>
                                  png_ptr->gamma_shift][green>>8];
                     png_uint_16 blue_1  = png_ptr->gamma_16_to_1[(blue&0xff) >>
                                  png_ptr->gamma_shift][blue>>8];
                     png_uint_16 gray16  = (png_uint_16)((rc*red_1 + gc*green_1
                                  + bc*blue_1)>>15);
                     w = png_ptr->gamma_16_from_1[(gray16&0xff) >>
                         png_ptr->gamma_shift][gray16 >> 8];
                     rgb_error |= 1;
                  }

                  *(dp++) = (png_byte)((w>>8) & 0xff);
                  *(dp++) = (png_byte)(w & 0xff);
               }
            }
            else
#line 2293 ".\\pngrtran.c"
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 red, green, blue, gray16;

                  red   = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;
                  green = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;
                  blue  = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;

                  if(red != green || red != blue)
                     rgb_error |= 1;
                  gray16  = (png_uint_16)((rc*red + gc*green + bc*blue)>>15);
                  *(dp++) = (png_byte)((gray16>>8) & 0xff);
                  *(dp++) = (png_byte)(gray16 & 0xff);
               }
            }
         }
      }
      if (row_info->color_type == (2 | 4))
      {
         if (row_info->bit_depth == 8)
         {

            if (png_ptr->gamma_from_1 != (void *)0x00000000 && png_ptr->gamma_to_1 != (void *)0x00000000)
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_byte red   = png_ptr->gamma_to_1[*(sp++)];
                  png_byte green = png_ptr->gamma_to_1[*(sp++)];
                  png_byte blue  = png_ptr->gamma_to_1[*(sp++)];
                  if(red != green || red != blue)
                     rgb_error |= 1;
                  *(dp++) =  png_ptr->gamma_from_1
                             [(rc*red + gc*green + bc*blue)>>15];
                  *(dp++) = *(sp++);  
               }
            }
            else
#line 2336 ".\\pngrtran.c"
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_byte red   = *(sp++);
                  png_byte green = *(sp++);
                  png_byte blue  = *(sp++);
                  if(red != green || red != blue)
                     rgb_error |= 1;
                  *(dp++) =  (png_byte)((rc*red + gc*green + bc*blue)>>15);
                  *(dp++) = *(sp++);  
               }
            }
         }
         else 
         {

            if (png_ptr->gamma_16_to_1 != (void *)0x00000000 &&
                png_ptr->gamma_16_from_1 != (void *)0x00000000)
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 red, green, blue, w;

                  red   = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;
                  green = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;
                  blue  = (png_uint_16)(((*(sp))<<8) | *(sp+1)); sp+=2;

                  if(red == green && red == blue)
                     w = red;
                  else
                  {
                     png_uint_16 red_1   = png_ptr->gamma_16_to_1[(red&0xff) >>
                                  png_ptr->gamma_shift][red>>8];
                     png_uint_16 green_1 = png_ptr->gamma_16_to_1[(green&0xff) >>
                                  png_ptr->gamma_shift][green>>8];
                     png_uint_16 blue_1  = png_ptr->gamma_16_to_1[(blue&0xff) >>
                                  png_ptr->gamma_shift][blue>>8];
                     png_uint_16 gray16  = (png_uint_16)((rc * red_1
                                  + gc * green_1 + bc * blue_1)>>15);
                     w = png_ptr->gamma_16_from_1[(gray16&0xff) >>
                         png_ptr->gamma_shift][gray16 >> 8];
                     rgb_error |= 1;
                  }

                  *(dp++) = (png_byte)((w>>8) & 0xff);
                  *(dp++) = (png_byte)(w & 0xff);
                  *(dp++) = *(sp++);  
                  *(dp++) = *(sp++);
               }
            }
            else
#line 2392 ".\\pngrtran.c"
            {
               png_bytep sp = row;
               png_bytep dp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 red, green, blue, gray16;
                  red   = (png_uint_16)((*(sp)<<8) | *(sp+1)); sp+=2;
                  green = (png_uint_16)((*(sp)<<8) | *(sp+1)); sp+=2;
                  blue  = (png_uint_16)((*(sp)<<8) | *(sp+1)); sp+=2;
                  if(red != green || red != blue)
                     rgb_error |= 1;
                  gray16  = (png_uint_16)((rc*red + gc*green + bc*blue)>>15);
                  *(dp++) = (png_byte)((gray16>>8) & 0xff);
                  *(dp++) = (png_byte)(gray16 & 0xff);
                  *(dp++) = *(sp++);  
                  *(dp++) = *(sp++);
               }
            }
         }
      }
   row_info->channels -= (png_byte)2;
      row_info->color_type &= ~2;
      row_info->pixel_depth = (png_byte)(row_info->channels *
         row_info->bit_depth);
      row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
   }
   return rgb_error;
}
#line 2421 ".\\pngrtran.c"






void __stdcall
png_build_grayscale_palette(int bit_depth, png_colorp palette)
{
   int num_palette;
   int color_inc;
   int i;
   int v;

   ;
   if (palette == (void *)0x00000000)
      return;

   switch (bit_depth)
   {
      case 1:
         num_palette = 2;
         color_inc = 0xff;
         break;
      case 2:
         num_palette = 4;
         color_inc = 0x55;
         break;
      case 4:
         num_palette = 16;
         color_inc = 0x11;
         break;
      case 8:
         num_palette = 256;
         color_inc = 1;
         break;
      default:
         num_palette = 0;
         color_inc = 0;
         break;
   }

   for (i = 0, v = 0; i < num_palette; i++, v += color_inc)
   {
      palette[i].red = (png_byte)v;
      palette[i].green = (png_byte)v;
      palette[i].blue = (png_byte)v;
   }
}





















































































































































































#line 2652 ".\\pngrtran.c"






void 
png_do_background(png_row_infop row_info, png_bytep row,
   png_color_16p trans_values, png_color_16p background

   , png_color_16p background_1,
   png_bytep gamma_table, png_bytep gamma_from_1, png_bytep gamma_to_1,
   png_uint_16pp gamma_16, png_uint_16pp gamma_16_from_1,
   png_uint_16pp gamma_16_to_1, int gamma_shift
#line 2667 ".\\pngrtran.c"
   )
{
   png_bytep sp, dp;
   png_uint_32 i;
   png_uint_32 row_width=row_info->width;
   int shift;

   ;
   if (background != (void *)0x00000000 &&


#line 2679 ".\\pngrtran.c"
      (!(row_info->color_type & 4) ||
      (row_info->color_type != (2 | 1) && trans_values)))
   {
      switch (row_info->color_type)
      {
         case 0:
         {
            switch (row_info->bit_depth)
            {
               case 1:
               {
                  sp = row;
                  shift = 7;
                  for (i = 0; i < row_width; i++)
                  {
                     if ((png_uint_16)((*sp >> shift) & 0x01)
                        == trans_values->gray)
                     {
                        *sp &= (png_byte)((0x7f7f >> (7 - shift)) & 0xff);
                        *sp |= (png_byte)(background->gray << shift);
                     }
                     if (!shift)
                     {
                        shift = 7;
                        sp++;
                     }
                     else
                        shift--;
                  }
                  break;
               }
               case 2:
               {

                  if (gamma_table != (void *)0x00000000)
                  {
                     sp = row;
                     shift = 6;
                     for (i = 0; i < row_width; i++)
                     {
                        if ((png_uint_16)((*sp >> shift) & 0x03)
                            == trans_values->gray)
                        {
                           *sp &= (png_byte)((0x3f3f >> (6 - shift)) & 0xff);
                           *sp |= (png_byte)(background->gray << shift);
                        }
                        else
                        {
                           png_byte p = (png_byte)((*sp >> shift) & 0x03);
                           png_byte g = (png_byte)((gamma_table [p | (p << 2) |
                               (p << 4) | (p << 6)] >> 6) & 0x03);
                           *sp &= (png_byte)((0x3f3f >> (6 - shift)) & 0xff);
                           *sp |= (png_byte)(g << shift);
                        }
                        if (!shift)
                        {
                           shift = 6;
                           sp++;
                        }
                        else
                           shift -= 2;
                     }
                  }
                  else
#line 2744 ".\\pngrtran.c"
                  {
                     sp = row;
                     shift = 6;
                     for (i = 0; i < row_width; i++)
                     {
                        if ((png_uint_16)((*sp >> shift) & 0x03)
                            == trans_values->gray)
                        {
                           *sp &= (png_byte)((0x3f3f >> (6 - shift)) & 0xff);
                           *sp |= (png_byte)(background->gray << shift);
                        }
                        if (!shift)
                        {
                           shift = 6;
                           sp++;
                        }
                        else
                           shift -= 2;
                     }
                  }
                  break;
               }
               case 4:
               {

                  if (gamma_table != (void *)0x00000000)
                  {
                     sp = row;
                     shift = 4;
                     for (i = 0; i < row_width; i++)
                     {
                        if ((png_uint_16)((*sp >> shift) & 0x0f)
                            == trans_values->gray)
                        {
                           *sp &= (png_byte)((0xf0f >> (4 - shift)) & 0xff);
                           *sp |= (png_byte)(background->gray << shift);
                        }
                        else
                        {
                           png_byte p = (png_byte)((*sp >> shift) & 0x0f);
                           png_byte g = (png_byte)((gamma_table[p |
                             (p << 4)] >> 4) & 0x0f);
                           *sp &= (png_byte)((0xf0f >> (4 - shift)) & 0xff);
                           *sp |= (png_byte)(g << shift);
                        }
                        if (!shift)
                        {
                           shift = 4;
                           sp++;
                        }
                        else
                           shift -= 4;
                     }
                  }
                  else
#line 2800 ".\\pngrtran.c"
                  {
                     sp = row;
                     shift = 4;
                     for (i = 0; i < row_width; i++)
                     {
                        if ((png_uint_16)((*sp >> shift) & 0x0f)
                            == trans_values->gray)
                        {
                           *sp &= (png_byte)((0xf0f >> (4 - shift)) & 0xff);
                           *sp |= (png_byte)(background->gray << shift);
                        }
                        if (!shift)
                        {
                           shift = 4;
                           sp++;
                        }
                        else
                           shift -= 4;
                     }
                  }
                  break;
               }
               case 8:
               {

                  if (gamma_table != (void *)0x00000000)
                  {
                     sp = row;
                     for (i = 0; i < row_width; i++, sp++)
                     {
                        if (*sp == trans_values->gray)
                        {
                           *sp = (png_byte)background->gray;
                        }
                        else
                        {
                           *sp = gamma_table[*sp];
                        }
                     }
                  }
                  else
#line 2842 ".\\pngrtran.c"
                  {
                     sp = row;
                     for (i = 0; i < row_width; i++, sp++)
                     {
                        if (*sp == trans_values->gray)
                        {
                           *sp = (png_byte)background->gray;
                        }
                     }
                  }
                  break;
               }
               case 16:
               {

                  if (gamma_16 != (void *)0x00000000)
                  {
                     sp = row;
                     for (i = 0; i < row_width; i++, sp += 2)
                     {
                        png_uint_16 v;

                        v = (png_uint_16)(((*sp) << 8) + *(sp + 1));
                        if (v == trans_values->gray)
                        {
                           
                           *sp = (png_byte)((background->gray >> 8) & 0xff);
                           *(sp + 1) = (png_byte)(background->gray & 0xff);
                        }
                        else
                        {
                           v = gamma_16[*(sp + 1) >> gamma_shift][*sp];
                           *sp = (png_byte)((v >> 8) & 0xff);
                           *(sp + 1) = (png_byte)(v & 0xff);
                        }
                     }
                  }
                  else
#line 2881 ".\\pngrtran.c"
                  {
                     sp = row;
                     for (i = 0; i < row_width; i++, sp += 2)
                     {
                        png_uint_16 v;

                        v = (png_uint_16)(((*sp) << 8) + *(sp + 1));
                        if (v == trans_values->gray)
                        {
                           *sp = (png_byte)((background->gray >> 8) & 0xff);
                           *(sp + 1) = (png_byte)(background->gray & 0xff);
                        }
                     }
                  }
                  break;
               }
            }
            break;
         }
         case (2):
         {
            if (row_info->bit_depth == 8)
            {

               if (gamma_table != (void *)0x00000000)
               {
                  sp = row;
                  for (i = 0; i < row_width; i++, sp += 3)
                  {
                     if (*sp == trans_values->red &&
                        *(sp + 1) == trans_values->green &&
                        *(sp + 2) == trans_values->blue)
                     {
                        *sp = (png_byte)background->red;
                        *(sp + 1) = (png_byte)background->green;
                        *(sp + 2) = (png_byte)background->blue;
                     }
                     else
                     {
                        *sp = gamma_table[*sp];
                        *(sp + 1) = gamma_table[*(sp + 1)];
                        *(sp + 2) = gamma_table[*(sp + 2)];
                     }
                  }
               }
               else
#line 2928 ".\\pngrtran.c"
               {
                  sp = row;
                  for (i = 0; i < row_width; i++, sp += 3)
                  {
                     if (*sp == trans_values->red &&
                        *(sp + 1) == trans_values->green &&
                        *(sp + 2) == trans_values->blue)
                     {
                        *sp = (png_byte)background->red;
                        *(sp + 1) = (png_byte)background->green;
                        *(sp + 2) = (png_byte)background->blue;
                     }
                  }
               }
            }
            else 
            {

               if (gamma_16 != (void *)0x00000000)
               {
                  sp = row;
                  for (i = 0; i < row_width; i++, sp += 6)
                  {
                     png_uint_16 r = (png_uint_16)(((*sp) << 8) + *(sp + 1));
                     png_uint_16 g = (png_uint_16)(((*(sp+2)) << 8) + *(sp+3));
                     png_uint_16 b = (png_uint_16)(((*(sp+4)) << 8) + *(sp+5));
                     if (r == trans_values->red && g == trans_values->green &&
                        b == trans_values->blue)
                     {
                        
                        *sp = (png_byte)((background->red >> 8) & 0xff);
                        *(sp + 1) = (png_byte)(background->red & 0xff);
                        *(sp + 2) = (png_byte)((background->green >> 8) & 0xff);
                        *(sp + 3) = (png_byte)(background->green & 0xff);
                        *(sp + 4) = (png_byte)((background->blue >> 8) & 0xff);
                        *(sp + 5) = (png_byte)(background->blue & 0xff);
                     }
                     else
                     {
                        png_uint_16 v = gamma_16[*(sp + 1) >> gamma_shift][*sp];
                        *sp = (png_byte)((v >> 8) & 0xff);
                        *(sp + 1) = (png_byte)(v & 0xff);
                        v = gamma_16[*(sp + 3) >> gamma_shift][*(sp + 2)];
                        *(sp + 2) = (png_byte)((v >> 8) & 0xff);
                        *(sp + 3) = (png_byte)(v & 0xff);
                        v = gamma_16[*(sp + 5) >> gamma_shift][*(sp + 4)];
                        *(sp + 4) = (png_byte)((v >> 8) & 0xff);
                        *(sp + 5) = (png_byte)(v & 0xff);
                     }
                  }
               }
               else
#line 2981 ".\\pngrtran.c"
               {
                  sp = row;
                  for (i = 0; i < row_width; i++, sp += 6)
                  {
                     png_uint_16 r = (png_uint_16)(((*sp) << 8) + *(sp+1));
                     png_uint_16 g = (png_uint_16)(((*(sp+2)) << 8) + *(sp+3));
                     png_uint_16 b = (png_uint_16)(((*(sp+4)) << 8) + *(sp+5));

                     if (r == trans_values->red && g == trans_values->green &&
                        b == trans_values->blue)
                     {
                        *sp = (png_byte)((background->red >> 8) & 0xff);
                        *(sp + 1) = (png_byte)(background->red & 0xff);
                        *(sp + 2) = (png_byte)((background->green >> 8) & 0xff);
                        *(sp + 3) = (png_byte)(background->green & 0xff);
                        *(sp + 4) = (png_byte)((background->blue >> 8) & 0xff);
                        *(sp + 5) = (png_byte)(background->blue & 0xff);
                     }
                  }
               }
            }
            break;
         }
         case (4):
         {
            if (row_info->bit_depth == 8)
            {

               if (gamma_to_1 != (void *)0x00000000 && gamma_from_1 != (void *)0x00000000 &&
                   gamma_table != (void *)0x00000000)
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 2, dp++)
                  {
                     png_uint_16 a = *(sp + 1);

                     if (a == 0xff)
                     {
                        *dp = gamma_table[*sp];
                     }
                     else if (a == 0)
                     {
                        
                        *dp = (png_byte)background->gray;
                     }
                     else
                     {
                        png_byte v, w;

                        v = gamma_to_1[*sp];
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(a) + (png_uint_16)(background_1->gray)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                        *dp = gamma_from_1[w];
                     }
                  }
               }
               else
#line 3039 ".\\pngrtran.c"
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 2, dp++)
                  {
                     png_byte a = *(sp + 1);

                     if (a == 0xff)
                     {
                        *dp = *sp;
                     }

                     else if (a == 0)
                     {
                        *dp = (png_byte)background->gray;
                     }
                     else
                     {
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(*sp) * (png_uint_16)(a) + (png_uint_16)(background_1->gray)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (*dp) = (png_byte)((temp + (temp >> 8)) >> 8); };
                     }


#line 3062 ".\\pngrtran.c"
                  }
               }
            }
            else 
            {

               if (gamma_16 != (void *)0x00000000 && gamma_16_from_1 != (void *)0x00000000 &&
                   gamma_16_to_1 != (void *)0x00000000)
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 4, dp += 2)
                  {
                     png_uint_16 a = (png_uint_16)(((*(sp+2)) << 8) + *(sp+3));

                     if (a == (png_uint_16)0xffff)
                     {
                        png_uint_16 v;

                        v = gamma_16[*(sp + 1) >> gamma_shift][*sp];
                        *dp = (png_byte)((v >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(v & 0xff);
                     }

                     else if (a == 0)


#line 3090 ".\\pngrtran.c"
                     {
                        
                        *dp = (png_byte)((background->gray >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(background->gray & 0xff);
                     }

                     else
                     {
                        png_uint_16 g, v, w;

                        g = gamma_16_to_1[*(sp + 1) >> gamma_shift][*sp];
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(g) * (png_uint_32)(a) + (png_uint_32)(background_1->gray)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (v) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        w = gamma_16_from_1[(v&0xff) >> gamma_shift][v >> 8];
                        *dp = (png_byte)((w >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(w & 0xff);
                     }
#line 3107 ".\\pngrtran.c"
                  }
               }
               else
#line 3111 ".\\pngrtran.c"
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 4, dp += 2)
                  {
                     png_uint_16 a = (png_uint_16)(((*(sp+2)) << 8) + *(sp+3));
                     if (a == (png_uint_16)0xffff)
                     {
                        memcpy_c(dp, sp, 2);
                     }

                     else if (a == 0)


#line 3126 ".\\pngrtran.c"
                     {
                        *dp = (png_byte)((background->gray >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(background->gray & 0xff);
                     }

                     else
                     {
                        png_uint_16 g, v;

                        g = (png_uint_16)(((*sp) << 8) + *(sp + 1));
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(g) * (png_uint_32)(a) + (png_uint_32)(background_1->gray)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (v) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        *dp = (png_byte)((v >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(v & 0xff);
                     }
#line 3141 ".\\pngrtran.c"
                  }
               }
            }
            break;
         }
         case (2 | 4):
         {
            if (row_info->bit_depth == 8)
            {

               if (gamma_to_1 != (void *)0x00000000 && gamma_from_1 != (void *)0x00000000 &&
                   gamma_table != (void *)0x00000000)
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 4, dp += 3)
                  {
                     png_byte a = *(sp + 3);

                     if (a == 0xff)
                     {
                        *dp = gamma_table[*sp];
                        *(dp + 1) = gamma_table[*(sp + 1)];
                        *(dp + 2) = gamma_table[*(sp + 2)];
                     }
                     else if (a == 0)
                     {
                        
                        *dp = (png_byte)background->red;
                        *(dp + 1) = (png_byte)background->green;
                        *(dp + 2) = (png_byte)background->blue;
                     }
                     else
                     {
                        png_byte v, w;

                        v = gamma_to_1[*sp];
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(a) + (png_uint_16)(background_1->red)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                        *dp = gamma_from_1[w];
                        v = gamma_to_1[*(sp + 1)];
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(a) + (png_uint_16)(background_1->green)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                        *(dp + 1) = gamma_from_1[w];
                        v = gamma_to_1[*(sp + 2)];
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(v) * (png_uint_16)(a) + (png_uint_16)(background_1->blue)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (w) = (png_byte)((temp + (temp >> 8)) >> 8); };
                        *(dp + 2) = gamma_from_1[w];
                     }
                  }
               }
               else
#line 3191 ".\\pngrtran.c"
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 4, dp += 3)
                  {
                     png_byte a = *(sp + 3);

                     if (a == 0xff)
                     {
                        *dp = *sp;
                        *(dp + 1) = *(sp + 1);
                        *(dp + 2) = *(sp + 2);
                     }
                     else if (a == 0)
                     {
                        *dp = (png_byte)background->red;
                        *(dp + 1) = (png_byte)background->green;
                        *(dp + 2) = (png_byte)background->blue;
                     }
                     else
                     {
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(*sp) * (png_uint_16)(a) + (png_uint_16)(background->red)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (*dp) = (png_byte)((temp + (temp >> 8)) >> 8); };
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(*(sp + 1)) * (png_uint_16)(a) + (png_uint_16)(background->green)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (*(dp + 1)) = (png_byte)((temp + (temp >> 8)) >> 8); };
#line 3215 ".\\pngrtran.c"
                        { png_uint_16 temp = (png_uint_16)((png_uint_16)(*(sp + 2)) * (png_uint_16)(a) + (png_uint_16)(background->blue)*(png_uint_16)(255 - (png_uint_16)(a)) + (png_uint_16)128); (*(dp + 2)) = (png_byte)((temp + (temp >> 8)) >> 8); };
#line 3217 ".\\pngrtran.c"
                     }
                  }
               }
            }
            else 
            {

               if (gamma_16 != (void *)0x00000000 && gamma_16_from_1 != (void *)0x00000000 &&
                   gamma_16_to_1 != (void *)0x00000000)
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 8, dp += 6)
                  {
                     png_uint_16 a = (png_uint_16)(((png_uint_16)(*(sp + 6))
                         << 8) + (png_uint_16)(*(sp + 7)));
                     if (a == (png_uint_16)0xffff)
                     {
                        png_uint_16 v;

                        v = gamma_16[*(sp + 1) >> gamma_shift][*sp];
                        *dp = (png_byte)((v >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(v & 0xff);
                        v = gamma_16[*(sp + 3) >> gamma_shift][*(sp + 2)];
                        *(dp + 2) = (png_byte)((v >> 8) & 0xff);
                        *(dp + 3) = (png_byte)(v & 0xff);
                        v = gamma_16[*(sp + 5) >> gamma_shift][*(sp + 4)];
                        *(dp + 4) = (png_byte)((v >> 8) & 0xff);
                        *(dp + 5) = (png_byte)(v & 0xff);
                     }
                     else if (a == 0)
                     {
                        
                        *dp = (png_byte)((background->red >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(background->red & 0xff);
                        *(dp + 2) = (png_byte)((background->green >> 8) & 0xff);
                        *(dp + 3) = (png_byte)(background->green & 0xff);
                        *(dp + 4) = (png_byte)((background->blue >> 8) & 0xff);
                        *(dp + 5) = (png_byte)(background->blue & 0xff);
                     }
                     else
                     {
                        png_uint_16 v, w, x;

                        v = gamma_16_to_1[*(sp + 1) >> gamma_shift][*sp];
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(v) * (png_uint_32)(a) + (png_uint_32)(background_1->red)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (w) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        x = gamma_16_from_1[((w&0xff) >> gamma_shift)][w >> 8];
                        *dp = (png_byte)((x >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(x & 0xff);
                        v = gamma_16_to_1[*(sp + 3) >> gamma_shift][*(sp + 2)];
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(v) * (png_uint_32)(a) + (png_uint_32)(background_1->green)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (w) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        x = gamma_16_from_1[((w&0xff) >> gamma_shift)][w >> 8];
                        *(dp + 2) = (png_byte)((x >> 8) & 0xff);
                        *(dp + 3) = (png_byte)(x & 0xff);
                        v = gamma_16_to_1[*(sp + 5) >> gamma_shift][*(sp + 4)];
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(v) * (png_uint_32)(a) + (png_uint_32)(background_1->blue)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (w) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        x = gamma_16_from_1[(w & 0xff) >> gamma_shift][w >> 8];
                        *(dp + 4) = (png_byte)((x >> 8) & 0xff);
                        *(dp + 5) = (png_byte)(x & 0xff);
                     }
                  }
               }
               else
#line 3281 ".\\pngrtran.c"
               {
                  sp = row;
                  dp = row;
                  for (i = 0; i < row_width; i++, sp += 8, dp += 6)
                  {
                     png_uint_16 a = (png_uint_16)(((png_uint_16)(*(sp + 6))
                        << 8) + (png_uint_16)(*(sp + 7)));
                     if (a == (png_uint_16)0xffff)
                     {
                        memcpy_c(dp, sp, 6);
                     }
                     else if (a == 0)
                     {
                        *dp = (png_byte)((background->red >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(background->red & 0xff);
                        *(dp + 2) = (png_byte)((background->green >> 8) & 0xff);
                        *(dp + 3) = (png_byte)(background->green & 0xff);
                        *(dp + 4) = (png_byte)((background->blue >> 8) & 0xff);
                        *(dp + 5) = (png_byte)(background->blue & 0xff);
                     }
                     else
                     {
                        png_uint_16 v;

                        png_uint_16 r = (png_uint_16)(((*sp) << 8) + *(sp + 1));
                        png_uint_16 g = (png_uint_16)(((*(sp + 2)) << 8)
                            + *(sp + 3));
                        png_uint_16 b = (png_uint_16)(((*(sp + 4)) << 8)
                            + *(sp + 5));

                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(r) * (png_uint_32)(a) + (png_uint_32)(background->red)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (v) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        *dp = (png_byte)((v >> 8) & 0xff);
                        *(dp + 1) = (png_byte)(v & 0xff);
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(g) * (png_uint_32)(a) + (png_uint_32)(background->green)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (v) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        *(dp + 2) = (png_byte)((v >> 8) & 0xff);
                        *(dp + 3) = (png_byte)(v & 0xff);
                        { png_uint_32 temp = (png_uint_32)((png_uint_32)(b) * (png_uint_32)(a) + (png_uint_32)(background->blue)*(png_uint_32)(65535L - (png_uint_32)(a)) + (png_uint_32)32768L); (v) = (png_uint_16)((temp + (temp >> 16)) >> 16); };
                        *(dp + 4) = (png_byte)((v >> 8) & 0xff);
                        *(dp + 5) = (png_byte)(v & 0xff);
                     }
                  }
               }
            }
            break;
         }
      }

      if (row_info->color_type & 4)
      {
         row_info->color_type &= ~4;
         row_info->channels--;
         row_info->pixel_depth = (png_byte)(row_info->channels *
            row_info->bit_depth);
         row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
      }
   }
}
#line 3339 ".\\pngrtran.c"








void 
png_do_gamma(png_row_infop row_info, png_bytep row,
   png_bytep gamma_table, png_uint_16pp gamma_16_table,
   int gamma_shift)
{
   png_bytep sp;
   png_uint_32 i;
   png_uint_32 row_width=row_info->width;

   ;
   if (


#line 3361 ".\\pngrtran.c"
       ((row_info->bit_depth <= 8 && gamma_table != (void *)0x00000000) ||
        (row_info->bit_depth == 16 && gamma_16_table != (void *)0x00000000)))
   {
      switch (row_info->color_type)
      {
         case (2):
         {
            if (row_info->bit_depth == 8)
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  *sp = gamma_table[*sp];
                  sp++;
                  *sp = gamma_table[*sp];
                  sp++;
                  *sp = gamma_table[*sp];
                  sp++;
               }
            }
            else 
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 v;

                  v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 2;
                  v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 2;
                  v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 2;
               }
            }
            break;
         }
         case (2 | 4):
         {
            if (row_info->bit_depth == 8)
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  *sp = gamma_table[*sp];
                  sp++;
                  *sp = gamma_table[*sp];
                  sp++;
                  *sp = gamma_table[*sp];
                  sp++;
                  sp++;
               }
            }
            else 
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 2;
                  v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 2;
                  v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 4;
               }
            }
            break;
         }
         case (4):
         {
            if (row_info->bit_depth == 8)
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  *sp = gamma_table[*sp];
                  sp += 2;
               }
            }
            else 
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 4;
               }
            }
            break;
         }
         case 0:
         {
            if (row_info->bit_depth == 2)
            {
               sp = row;
               for (i = 0; i < row_width; i += 4)
               {
                  int a = *sp & 0xc0;
                  int b = *sp & 0x30;
                  int c = *sp & 0x0c;
                  int d = *sp & 0x03;

                  *sp = (png_byte)(
                        ((((int)gamma_table[a|(a>>2)|(a>>4)|(a>>6)])   ) & 0xc0)|
                        ((((int)gamma_table[(b<<2)|b|(b>>2)|(b>>4)])>>2) & 0x30)|
                        ((((int)gamma_table[(c<<4)|(c<<2)|c|(c>>2)])>>4) & 0x0c)|
                        ((((int)gamma_table[(d<<6)|(d<<4)|(d<<2)|d])>>6) ));
                  sp++;
               }
            }
            if (row_info->bit_depth == 4)
            {
               sp = row;
               for (i = 0; i < row_width; i += 2)
               {
                  int msb = *sp & 0xf0;
                  int lsb = *sp & 0x0f;

                  *sp = (png_byte)((((int)gamma_table[msb | (msb >> 4)]) & 0xf0)
                          | (((int)gamma_table[(lsb << 4) | lsb]) >> 4));
                  sp++;
               }
            }
            else if (row_info->bit_depth == 8)
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  *sp = gamma_table[*sp];
                  sp++;
               }
            }
            else if (row_info->bit_depth == 16)
            {
               sp = row;
               for (i = 0; i < row_width; i++)
               {
                  png_uint_16 v = gamma_16_table[*(sp + 1) >> gamma_shift][*sp];
                  *sp = (png_byte)((v >> 8) & 0xff);
                  *(sp + 1) = (png_byte)(v & 0xff);
                  sp += 2;
               }
            }
            break;
         }
      }
   }
}
#line 3524 ".\\pngrtran.c"





void 
png_do_expand_palette(png_row_infop row_info, png_bytep row,
   png_colorp palette, png_bytep trans, int num_trans)
{
   int shift, value;
   png_bytep sp, dp;
   png_uint_32 i;
   png_uint_32 row_width=row_info->width;

   ;
   if (


#line 3543 ".\\pngrtran.c"
       row_info->color_type == (2 | 1))
   {
      if (row_info->bit_depth < 8)
      {
         switch (row_info->bit_depth)
         {
            case 1:
            {
               sp = row + (png_size_t)((row_width - 1) >> 3);
               dp = row + (png_size_t)row_width - 1;
               shift = 7 - (int)((row_width + 7) & 0x07);
               for (i = 0; i < row_width; i++)
               {
                  if ((*sp >> shift) & 0x01)
                     *dp = 1;
                  else
                     *dp = 0;
                  if (shift == 7)
                  {
                     shift = 0;
                     sp--;
                  }
                  else
                     shift++;

                  dp--;
               }
               break;
            }
            case 2:
            {
               sp = row + (png_size_t)((row_width - 1) >> 2);
               dp = row + (png_size_t)row_width - 1;
               shift = (int)((3 - ((row_width + 3) & 0x03)) << 1);
               for (i = 0; i < row_width; i++)
               {
                  value = (*sp >> shift) & 0x03;
                  *dp = (png_byte)value;
                  if (shift == 6)
                  {
                     shift = 0;
                     sp--;
                  }
                  else
                     shift += 2;

                  dp--;
               }
               break;
            }
            case 4:
            {
               sp = row + (png_size_t)((row_width - 1) >> 1);
               dp = row + (png_size_t)row_width - 1;
               shift = (int)((row_width & 0x01) << 2);
               for (i = 0; i < row_width; i++)
               {
                  value = (*sp >> shift) & 0x0f;
                  *dp = (png_byte)value;
                  if (shift == 4)
                  {
                     shift = 0;
                     sp--;
                  }
                  else
                     shift += 4;

                  dp--;
               }
               break;
            }
         }
         row_info->bit_depth = 8;
         row_info->pixel_depth = 8;
         row_info->rowbytes = row_width;
      }
      switch (row_info->bit_depth)
      {
         case 8:
         {
            if (trans != (void *)0x00000000)
            {
               sp = row + (png_size_t)row_width - 1;
               dp = row + (png_size_t)(row_width << 2) - 1;

               for (i = 0; i < row_width; i++)
               {
                  if ((int)(*sp) >= num_trans)
                     *dp-- = 0xff;
                  else
                     *dp-- = trans[*sp];
                  *dp-- = palette[*sp].blue;
                  *dp-- = palette[*sp].green;
                  *dp-- = palette[*sp].red;
                  sp--;
               }
               row_info->bit_depth = 8;
               row_info->pixel_depth = 32;
               row_info->rowbytes = row_width * 4;
               row_info->color_type = 6;
               row_info->channels = 4;
            }
            else
            {
               sp = row + (png_size_t)row_width - 1;
               dp = row + (png_size_t)(row_width * 3) - 1;

               for (i = 0; i < row_width; i++)
               {
                  *dp-- = palette[*sp].blue;
                  *dp-- = palette[*sp].green;
                  *dp-- = palette[*sp].red;
                  sp--;
               }
               row_info->bit_depth = 8;
               row_info->pixel_depth = 24;
               row_info->rowbytes = row_width * 3;
               row_info->color_type = 2;
               row_info->channels = 3;
            }
            break;
         }
      }
   }
}




void 
png_do_expand(png_row_infop row_info, png_bytep row,
   png_color_16p trans_value)
{
   int shift, value;
   png_bytep sp, dp;
   png_uint_32 i;
   png_uint_32 row_width=row_info->width;

   ;


#line 3685 ".\\pngrtran.c"
   {
      if (row_info->color_type == 0)
      {
         png_uint_16 gray = (png_uint_16)(trans_value ? trans_value->gray : 0);

         if (row_info->bit_depth < 8)
         {
            switch (row_info->bit_depth)
            {
               case 1:
               {
                  gray = (png_uint_16)(gray*0xff);
                  sp = row + (png_size_t)((row_width - 1) >> 3);
                  dp = row + (png_size_t)row_width - 1;
                  shift = 7 - (int)((row_width + 7) & 0x07);
                  for (i = 0; i < row_width; i++)
                  {
                     if ((*sp >> shift) & 0x01)
                        *dp = 0xff;
                     else
                        *dp = 0;
                     if (shift == 7)
                     {
                        shift = 0;
                        sp--;
                     }
                     else
                        shift++;

                     dp--;
                  }
                  break;
               }
               case 2:
               {
                  gray = (png_uint_16)(gray*0x55);
                  sp = row + (png_size_t)((row_width - 1) >> 2);
                  dp = row + (png_size_t)row_width - 1;
                  shift = (int)((3 - ((row_width + 3) & 0x03)) << 1);
                  for (i = 0; i < row_width; i++)
                  {
                     value = (*sp >> shift) & 0x03;
                     *dp = (png_byte)(value | (value << 2) | (value << 4) |
                        (value << 6));
                     if (shift == 6)
                     {
                        shift = 0;
                        sp--;
                     }
                     else
                        shift += 2;

                     dp--;
                  }
                  break;
               }
               case 4:
               {
                  gray = (png_uint_16)(gray*0x11);
                  sp = row + (png_size_t)((row_width - 1) >> 1);
                  dp = row + (png_size_t)row_width - 1;
                  shift = (int)((1 - ((row_width + 1) & 0x01)) << 2);
                  for (i = 0; i < row_width; i++)
                  {
                     value = (*sp >> shift) & 0x0f;
                     *dp = (png_byte)(value | (value << 4));
                     if (shift == 4)
                     {
                        shift = 0;
                        sp--;
                     }
                     else
                        shift = 4;

                     dp--;
                  }
                  break;
               }
            }
            row_info->bit_depth = 8;
            row_info->pixel_depth = 8;
            row_info->rowbytes = row_width;
         }

         if (trans_value != (void *)0x00000000)
         {
            if (row_info->bit_depth == 8)
            {
               sp = row + (png_size_t)row_width - 1;
               dp = row + (png_size_t)(row_width << 1) - 1;
               for (i = 0; i < row_width; i++)
               {
                  if (*sp == gray)
                     *dp-- = 0;
                  else
                     *dp-- = 0xff;
                  *dp-- = *sp--;
               }
            }
            else if (row_info->bit_depth == 16)
            {
               sp = row + row_info->rowbytes - 1;
               dp = row + (row_info->rowbytes << 1) - 1;
               for (i = 0; i < row_width; i++)
               {
                  if (((png_uint_16)*(sp) |
                     ((png_uint_16)*(sp - 1) << 8)) == gray)
                  {
                     *dp-- = 0;
                     *dp-- = 0;
                  }
                  else
                  {
                     *dp-- = 0xff;
                     *dp-- = 0xff;
                  }
                  *dp-- = *sp--;
                  *dp-- = *sp--;
               }
            }
            row_info->color_type = (4);
            row_info->channels = 2;
            row_info->pixel_depth = (png_byte)(row_info->bit_depth << 1);
            row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
#line 3810 ".\\pngrtran.c"
         }
      }
      else if (row_info->color_type == (2) && trans_value)
      {
         if (row_info->bit_depth == 8)
         {
            sp = row + (png_size_t)row_info->rowbytes - 1;
            dp = row + (png_size_t)(row_width << 2) - 1;
            for (i = 0; i < row_width; i++)
            {
               if (*(sp - 2) == trans_value->red &&
                  *(sp - 1) == trans_value->green &&
                  *(sp - 0) == trans_value->blue)
                  *dp-- = 0;
               else
                  *dp-- = 0xff;
               *dp-- = *sp--;
               *dp-- = *sp--;
               *dp-- = *sp--;
            }
         }
         else if (row_info->bit_depth == 16)
         {
            sp = row + row_info->rowbytes - 1;
            dp = row + (png_size_t)(row_width << 3) - 1;
            for (i = 0; i < row_width; i++)
            {
               if ((((png_uint_16)*(sp - 4) |
                  ((png_uint_16)*(sp - 5) << 8)) == trans_value->red) &&
                  (((png_uint_16)*(sp - 2) |
                  ((png_uint_16)*(sp - 3) << 8)) == trans_value->green) &&
                  (((png_uint_16)*(sp - 0) |
                  ((png_uint_16)*(sp - 1) << 8)) == trans_value->blue))
               {
                  *dp-- = 0;
                  *dp-- = 0;
               }
               else
               {
                  *dp-- = 0xff;
                  *dp-- = 0xff;
               }
               *dp-- = *sp--;
               *dp-- = *sp--;
               *dp-- = *sp--;
               *dp-- = *sp--;
               *dp-- = *sp--;
               *dp-- = *sp--;
            }
         }
         row_info->color_type = (2 | 4);
         row_info->channels = 4;
         row_info->pixel_depth = (png_byte)(row_info->bit_depth << 2);
         row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
      }
   }
}
#line 3868 ".\\pngrtran.c"


void 
png_do_dither(png_row_infop row_info, png_bytep row,
    png_bytep palette_lookup, png_bytep dither_lookup)
{
   png_bytep sp, dp;
   png_uint_32 i;
   png_uint_32 row_width=row_info->width;

   ;


#line 3882 ".\\pngrtran.c"
   {
      if (row_info->color_type == (2) &&
         palette_lookup && row_info->bit_depth == 8)
      {
         int r, g, b, p;
         sp = row;
         dp = row;
         for (i = 0; i < row_width; i++)
         {
            r = *sp++;
            g = *sp++;
            b = *sp++;

            






            p = (((r >> (8 - 5)) &
               ((1 << 5) - 1)) <<
               (5 + 5)) |
               (((g >> (8 - 5)) &
               ((1 << 5) - 1)) <<
               (5)) |
               ((b >> (8 - 5)) &
               ((1 << 5) - 1));

            *dp++ = palette_lookup[p];
         }
         row_info->color_type = (2 | 1);
         row_info->channels = 1;
         row_info->pixel_depth = row_info->bit_depth;
         row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
      }
      else if (row_info->color_type == (2 | 4) &&
         palette_lookup != (void *)0x00000000 && row_info->bit_depth == 8)
      {
         int r, g, b, p;
         sp = row;
         dp = row;
         for (i = 0; i < row_width; i++)
         {
            r = *sp++;
            g = *sp++;
            b = *sp++;
            sp++;

            p = (((r >> (8 - 5)) &
               ((1 << 5) - 1)) <<
               (5 + 5)) |
               (((g >> (8 - 5)) &
               ((1 << 5) - 1)) <<
               (5)) |
               ((b >> (8 - 5)) &
               ((1 << 5) - 1));

            *dp++ = palette_lookup[p];
         }
         row_info->color_type = (2 | 1);
         row_info->channels = 1;
         row_info->pixel_depth = row_info->bit_depth;
         row_info->rowbytes = ((row_info->pixel_depth) >= 8 ? ((row_width) * (((png_uint_32)(row_info->pixel_depth)) >> 3)) : (( ((row_width) * ((png_uint_32)(row_info->pixel_depth))) + 7) >> 3) );
      }
      else if (row_info->color_type == (2 | 1) &&
         dither_lookup && row_info->bit_depth == 8)
      {
         sp = row;
         for (i = 0; i < row_width; i++, sp++)
         {
            *sp = dither_lookup[*sp];
         }
      }
   }
}
#line 3959 ".\\pngrtran.c"



const static int png_gamma_shift[] =
   {0x10, 0x21, 0x42, 0x84, 0x110, 0x248, 0x550, 0xff0, 0x00};






void 
png_build_gamma_table(png_structp png_ptr)
{
  ;

  if (png_ptr->bit_depth <= 8)
  {
     int i;
     double g;

     if (png_ptr->screen_gamma > .000001)
        g = 1.0 / (png_ptr->gamma * png_ptr->screen_gamma);
     else
        g = 1.0;

     png_ptr->gamma_table = (png_bytep)png_malloc(png_ptr,
        (png_uint_32)256);

     for (i = 0; i < 256; i++)
     {
        png_ptr->gamma_table[i] = (png_byte)(powf_c((double)i / 255.0,
           g) * 255.0 + .5);
     }


     if (png_ptr->transformations & ((0x0080) | 0x600000L))
     {

        g = 1.0 / (png_ptr->gamma);

        png_ptr->gamma_to_1 = (png_bytep)png_malloc(png_ptr,
           (png_uint_32)256);

        for (i = 0; i < 256; i++)
        {
           png_ptr->gamma_to_1[i] = (png_byte)(powf_c((double)i / 255.0,
              g) * 255.0 + .5);
        }


        png_ptr->gamma_from_1 = (png_bytep)png_malloc(png_ptr,
           (png_uint_32)256);

        if(png_ptr->screen_gamma > 0.000001)
           g = 1.0 / png_ptr->screen_gamma;
        else
           g = png_ptr->gamma;   

        for (i = 0; i < 256; i++)
        {
           png_ptr->gamma_from_1[i] = (png_byte)(powf_c((double)i / 255.0,
              g) * 255.0 + .5);

        }
     }
#line 4027 ".\\pngrtran.c"
  }
  else
  {
     double g;
     int i, j, shift, num;
     int sig_bit;
     png_uint_32 ig;

     if (png_ptr->color_type & 2)
     {
        sig_bit = (int)png_ptr->sig_bit.red;
        if ((int)png_ptr->sig_bit.green > sig_bit)
           sig_bit = png_ptr->sig_bit.green;
        if ((int)png_ptr->sig_bit.blue > sig_bit)
           sig_bit = png_ptr->sig_bit.blue;
     }
     else
     {
        sig_bit = (int)png_ptr->sig_bit.gray;
     }

     if (sig_bit > 0)
        shift = 16 - sig_bit;
     else
        shift = 0;

     if (png_ptr->transformations & 0x0400)
     {
        if (shift < (16 - 11))
           shift = (16 - 11);
     }

     if (shift > 8)
        shift = 8;
     if (shift < 0)
        shift = 0;

     png_ptr->gamma_shift = (png_byte)shift;

     num = (1 << (8 - shift));

     if (png_ptr->screen_gamma > .000001)
        g = 1.0 / (png_ptr->gamma * png_ptr->screen_gamma);
     else
        g = 1.0;

     png_ptr->gamma_16_table = (png_uint_16pp)png_malloc(png_ptr,
        (png_uint_32)(num * sizeof (png_uint_16p)));

     if (png_ptr->transformations & (0x0400 | 0x0080))
     {
        double fin, fout;
        png_uint_32 last, max;

        for (i = 0; i < num; i++)
        {
           png_ptr->gamma_16_table[i] = (png_uint_16p)png_malloc(png_ptr,
              (png_uint_32)(256 * sizeof (png_uint_16)));
        }

        g = 1.0 / g;
        last = 0;
        for (i = 0; i < 256; i++)
        {
           fout = ((double)i + 0.5) / 256.0;
           fin = powf_c(fout, g);
           max = (png_uint_32)(fin * (double)((png_uint_32)num << 8));
           while (last <= max)
           {
              png_ptr->gamma_16_table[(int)(last & (0xff >> shift))]
                 [(int)(last >> (8 - shift))] = (png_uint_16)(
                 (png_uint_16)i | ((png_uint_16)i << 8));
              last++;
           }
        }
        while (last < ((png_uint_32)num << 8))
        {
           png_ptr->gamma_16_table[(int)(last & (0xff >> shift))]
              [(int)(last >> (8 - shift))] = (png_uint_16)65535L;
           last++;
        }
     }
     else
     {
        for (i = 0; i < num; i++)
        {
           png_ptr->gamma_16_table[i] = (png_uint_16p)png_malloc(png_ptr,
              (png_uint_32)(256 * sizeof (png_uint_16)));

           ig = (((png_uint_32)i * (png_uint_32)png_gamma_shift[shift]) >> 4);
           for (j = 0; j < 256; j++)
           {
              png_ptr->gamma_16_table[i][j] =
                 (png_uint_16)(powf_c((double)(ig + ((png_uint_32)j << 8)) /
                    65535.0, g) * 65535.0 + .5);
           }
        }
     }


     if (png_ptr->transformations & (0x0080 | 0x600000L))
     {

        g = 1.0 / (png_ptr->gamma);

        png_ptr->gamma_16_to_1 = (png_uint_16pp)png_malloc(png_ptr,
           (png_uint_32)(num * sizeof (png_uint_16p)));

        for (i = 0; i < num; i++)
        {
           png_ptr->gamma_16_to_1[i] = (png_uint_16p)png_malloc(png_ptr,
              (png_uint_32)(256 * sizeof (png_uint_16)));

           ig = (((png_uint_32)i *
              (png_uint_32)png_gamma_shift[shift]) >> 4);
           for (j = 0; j < 256; j++)
           {
              png_ptr->gamma_16_to_1[i][j] =
                 (png_uint_16)(powf_c((double)(ig + ((png_uint_32)j << 8)) /
                    65535.0, g) * 65535.0 + .5);
           }
        }

        if(png_ptr->screen_gamma > 0.000001)
           g = 1.0 / png_ptr->screen_gamma;
        else
           g = png_ptr->gamma;   

        png_ptr->gamma_16_from_1 = (png_uint_16pp)png_malloc(png_ptr,
           (png_uint_32)(num * sizeof (png_uint_16p)));

        for (i = 0; i < num; i++)
        {
           png_ptr->gamma_16_from_1[i] = (png_uint_16p)png_malloc(png_ptr,
              (png_uint_32)(256 * sizeof (png_uint_16)));

           ig = (((png_uint_32)i *
              (png_uint_32)png_gamma_shift[shift]) >> 4);
           for (j = 0; j < 256; j++)
           {
              png_ptr->gamma_16_from_1[i][j] =
                 (png_uint_16)(powf_c((double)(ig + ((png_uint_32)j << 8)) /
                    65535.0, g) * 65535.0 + .5);
           }
        }
     }
#line 4175 ".\\pngrtran.c"
  }
}
#line 4178 ".\\pngrtran.c"

#line 4180 ".\\pngrtran.c"



void 
png_do_read_intrapixel(png_row_infop row_info, png_bytep row)
{
   ;
   if (


#line 4191 ".\\pngrtran.c"
       (row_info->color_type & 2))
   {
      int bytes_per_pixel;
      png_uint_32 row_width = row_info->width;
      if (row_info->bit_depth == 8)
      {
         png_bytep rp;
         png_uint_32 i;

         if (row_info->color_type == (2))
            bytes_per_pixel = 3;
         else if (row_info->color_type == (2 | 4))
            bytes_per_pixel = 4;
         else
            return;

         for (i = 0, rp = row; i < row_width; i++, rp += bytes_per_pixel)
         {
            *(rp) = (png_byte)((256 + *rp + *(rp+1))&0xff);
            *(rp+2) = (png_byte)((256 + *(rp+2) + *(rp+1))&0xff);
         }
      }
      else if (row_info->bit_depth == 16)
      {
         png_bytep rp;
         png_uint_32 i;

         if (row_info->color_type == (2))
            bytes_per_pixel = 6;
         else if (row_info->color_type == (2 | 4))
            bytes_per_pixel = 8;
         else
            return;

         for (i = 0, rp = row; i < row_width; i++, rp += bytes_per_pixel)
         {
            png_uint_32 s0   = (*(rp  ) << 8) | *(rp+1);
            png_uint_32 s1   = (*(rp+2) << 8) | *(rp+3);
            png_uint_32 s2   = (*(rp+4) << 8) | *(rp+5);
            png_uint_32 red  = (png_uint_32)((s0+s1+65536L) & 0xffffL);
            png_uint_32 blue = (png_uint_32)((s2+s1+65536L) & 0xffffL);
            *(rp  ) = (png_byte)((red >> 8) & 0xff);
            *(rp+1) = (png_byte)(red & 0xff);
            *(rp+4) = (png_byte)((blue >> 8) & 0xff);
            *(rp+5) = (png_byte)(blue & 0xff);
         }
      }
   }
}
#line 4241 ".\\pngrtran.c"
#line 4242 ".\\pngrtran.c"

