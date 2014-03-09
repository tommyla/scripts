echo "gimme cookie!"
read down
lftp -e 'pget -n 5 '$down' && exit'
echo "done."
