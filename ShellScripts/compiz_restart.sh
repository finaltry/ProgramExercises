sudo kill -KILL `ps -ef | grep compiz | grep -v grep | head -1 | awk '{print $2}'`
#sudo killall -KILL compiz
