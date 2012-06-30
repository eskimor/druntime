/**
 * D header file for POSIX.
 *
 * Copyright: Copyright Robert Klotzner 2012
 * License:   <a href="http://www.boost.org/LICENSE_1_0.txt">Boost License 1.0</a>.
 * Authors:   Robert Klotzner
 */

module core.sys.posix.sys.statvfs;
import core.stdc.config;
import core.sys.posix.config;
import core.sys.posix.sys.types;

extern (C) :
version(linux) {
	static if(__WORDSIZE == 32) {
		version=_STATVFSBUF_F_UNUSED;
	}
	version(unittest) {
		extern size_t c_get_statvfs_size();
		extern int c_check_statvfs_struct(statvfs_t* t);
	}
	unittest {
		assert(statvfs_t.sizeof==c_get_statvfs_size());
		statvfs_t t;
		foreach(i, m ; __traits(allMembers, statvfs_t)) {
			mixin("t."~m~"=i+1;");
		}
	}
	struct statvfs_t
	{
		c_ulong f_bsize;
		c_ulong f_frsize;
		fsblkcnt_t f_blocks;
		fsblkcnt_t f_bfree;
		fsblkcnt_t f_bavail;
		fsfilcnt_t f_files;
		fsfilcnt_t f_ffree;
		fsfilcnt_t f_favail;
		c_ulong f_fsid;
		version(_STATVFSBUF_F_UNUSED) {
			int __f_unused;
		}
		c_ulong f_flag;
		c_ulong f_namemax;
		int __f_spare[6];
	}
	alias statvfs_t statvfs64_t;
	/* Definitions for the flag in `f_flag'.  These definitions should be
		  kept in sync with the definitions in <sys/mount.h>.  */
	static if(__USE_GNU) {
		enum FFlag
		{
			ST_RDONLY = 1,        /* Mount read-only.  */
			ST_NOSUID = 2,
			ST_NODEV = 4,         /* Disallow access to device special files.  */
			ST_NOEXEC = 8,        /* Disallow program execution.  */
			ST_SYNCHRONOUS = 16,      /* Writes are synced at once.  */
			ST_MANDLOCK = 64,     /* Allow mandatory locks on an FS.  */
			ST_WRITE = 128,       /* Write on file/directory/symlink.  */
			ST_APPEND = 256,      /* Append-only file.  */
			ST_IMMUTABLE = 512,       /* Immutable file.  */
			ST_NOATIME = 1024,        /* Do not update access times.  */
			ST_NODIRATIME = 2048,     /* Do not update directory access times.  */
			ST_RELATIME = 4096        /* Update atime relative to mtime/ctime.  */

		}
	}  /* Use GNU.  */
	else {
		enum FFlag
		{
			ST_RDONLY = 1,        /* Mount read-only.  */
			ST_NOSUID = 2
		}
	}
	/* Return information about the filesystem on which FILE resides.  */
	static if( __USE_FILE_OFFSET64 || __USE_LARGEFILE64) {
		extern int statvfs64 (const char * file, statvfs64_t* buf) nothrow;
		/* Return information about the filesystem containing the file FILDES
		   refers to.  */
		extern int fstatvfs64 (int fildes, statvfs64_t *buf) nothrow;
	}
	else {
		extern int statvfs (const char * file, statvfs_t* buf);
		extern int fstatvfs (int fildes, statvfs_t *buf) nothrow;
	}
}

