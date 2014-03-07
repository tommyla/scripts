#
#          /\
#         /  \
#        /    \
#       /______\
#      /\      /\
#     /  \    /  \
#    /    \  /    \
#   /______\/______\
#   T R I F O R C E
# Simple Backup Script v1.2
#
# contact: triforce@nwgat.net
#
# use AquaFS, Dropbox, S3fs (Amazon S3), SSHFS (FTP over SSH), CurlFtpFS (FTP) to backup the output files
# you can also backup to external harddrive/usbstick by using its path
#
# MySQL Settings:
# PASSWORD to database password
# you must change /path/to/backupdir and test.db
#
# Files Settings:
# you must change /path/to/backupdir/ , /home/user/ , test.files and test.db
# 
# setup crontab to send mail and schedule with 
# @daily sh /path/to/triforce.v1.sh
# @hourly sh /path/to/triforce.v1.sh
# MAILTO=my@mail.com
#

# MySQL password
mysqlpass=
# database backup directory
dbbakdir=
# html source directory
htsrcdir=
# html backup directory
htbakdir=

# nothing to change here, move over
echo ""
echo "Triforce Simple Backup Script"
echo "$(date +%Y-%m-%d) $(date +%H:%M:%S)"
echo ""
# mysql database backup, change --all-databases to your database if only one database
echo "Backing up MySQL"
mysqldump -u root -p$mysqlpass --all-databases | gzip -9 > $dbbakdir/$(date +%Y-%m-%d-%H.%M.%S)test.db.sql.gz
echo "MySQL, Done"
# html files backup
echo "Backing up Files"
tar -zcPf $htsrcdir/$(date +%Y-%m-%d-%H.%M.%S).html.tgz $htbakdir/
echo "Files, Done"
echo ""
