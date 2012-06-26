#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>

int test_stat_struct(struct stat* t) {
		printf("t->st_dev==0: %d, %d\n", t->st_dev==0, t->st_dev);
		printf("t->st_mode==6: %d, %d\n", t->st_mode==6, t->st_mode);
		printf("t->st_nlink==7: %d, %d\n", t->st_nlink==7, t->st_nlink);
		printf("t->st_uid==1: %d, %d\n", t->st_uid==1, t->st_uid);
		printf("t->st_blksize==2: %d, %d\n", t->st_blksize==2, t->st_blksize);
		printf("t->st_blocks==3: %d, %d\n", t->st_blocks==3, t->st_blocks);
		printf("t->st_atim.tv_sec==4: %d, %d\n", t->st_atim.tv_sec==4, t->st_atim.tv_sec);
		printf("t->st_ino==5: %d, %d\n", t->st_ino==5, t->st_ino);
		return (t->st_dev==0 && t->st_mode==6 && t->st_uid==1 && t->st_blksize==2 && t->st_blocks==3 && t->st_atim.tv_sec==4 && t->st_ino==5);
}

size_t stat_struct_size() {
		return sizeof(struct stat);
}
