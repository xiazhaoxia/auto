z:
cd \siebel\javacontainer\javacontainer-sieb\bin
call "shutdown.bat"
echo "******************shutdown the sieb Server******************s"
pause

cd \siebel\javacontainer\javacontainer-gtwy\bin
call "shutdown.bat"
echo "******************sshutdown the Gtwy Server******************s"
pause

cd \siebel\javacontainer\javacontainer-swsm\bin
call "shutdown.bat"
echo "******************shudown the Swsm Server,please close the zookeeper and go next**************"
pause

cd \siebel\bin\w32ud
set JAVA_HOME=Z:\Siebel\jre
start call "m:\siebel\src\3rdparty\zookeeper\server\bin\zkServer.cmd" 
echo "wait information in zookeeper:  binding to port 0.0.0.0/0.0.0.0:2320"
pause


cd Z:\siebel\javacontainer\javacontainer-gtwy\bin
call "startup.bat"
echo "Open the task manager, go next step when CPU is stable"
pause

cd Z:\siebel\javacontainer\javacontainer-swsm\bin
call "startup.bat"
echo "Open the task manager, go next step when CPU is stable"
pause

cd \siebel\bin\w32ud
call "startappsrvr.bat"
echo "wait for starting siebel server"
pause

call "startsrvrmgr.bat"
echo "go next if the server is up"
pause

cd Z:\siebel\javacontainer\javacontainer-sieb\bin
call "startup.bat"
pause



cd \siebel\bin\w32ud