#include <sys/types.h>
#include <sys/stat.h>
#include <sys/statvfs.h>
#include <stdio.h>

int c_test_stat_struct(struct stat* t) {
/*		printf("t->st_dev==0: %d, %d\n", t->st_dev==0, t->st_dev);
		printf("t->st_mode==6: %d, %d\n", t->st_mode==6, t->st_mode);
		printf("t->st_nlink==7: %d, %d\n", t->st_nlink==7, t->st_nlink);
		printf("t->st_uid==1: %d, %d\n", t->st_uid==1, t->st_uid);
		printf("t->st_blksize==2: %d, %d\n", t->st_blksize==2, t->st_blksize);
		printf("t->st_blocks==3: %d, %d\n", t->st_blocks==3, t->st_blocks);
		printf("t->st_atim.tv_sec==4: %d, %d\n", t->st_atim.tv_sec==4, t->st_atim.tv_sec);
		printf("t->st_ino==5: %d, %d\n", t->st_ino==5, t->st_ino);
		printf("ptrdiff: %d\n", (void*)(&t->st_ino)-(void*)(&t->__pad1));
		printf("sizeof(ino_t): %d\n", sizeof(ino_t));
*/
		return (t->st_dev==0 && t->st_mode==6 && t->st_uid==1 && t->st_blksize==2 && t->st_blocks==3 && t->st_atim.tv_sec==4 && t->st_ino==5);
}

size_t c_get_stat_struct_size() {
		return sizeof(struct stat);
}
size_t c_get_statvfs_size() {
	return sizeof(struct statvfs); 
}

int c_check_statvfs_struct(struct statvfs* t) {
#ifdef STATVFSBUF_F_UNUSED
	int start=11;
#else
	int start=10;
#endif

	return (t->f_bsize==1 && t->f_frsize==2 && t->f_blocks==3 &&
			t->f_bfree==4 && t->f_bavail==5 && t->f_files==6 && t->f_ffree==7 && t->f_favail==8 &&
			t->f_fsid==9 && t->f_flag==start && t->f_namemax==start+1);
}
