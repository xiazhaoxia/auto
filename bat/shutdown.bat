z:
echo "******************Please CTRL+C  close the siebel server******************"
pause

cd \siebel\javacontainer\javacontainer-sieb\bin
call "shutdown.bat"
echo  "******************shudown the Sieb  Server******************s"
pause

cd z:\siebel\javacontainer\javacontainer-gtwy\bin
call "shutdown.bat"
echo "******************sshutdown the Gtwy Server******************s"
pause

cd z:\siebel\javacontainer\javacontainer-swsm\bin
call "shutdown.bat"
echo "******************shudown the Swsm Server, please close the zookeeper**************"
pause
