z:
cd \siebel\bin
perl dbgsrvr.pl
echo "Need run twice"
pause
perl dbgsrvr.pl

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
echo "Open the task manager,open 'https://<your server>.us.oracle.com:16690/siebel/smc' to config  when CPU is stable"
pause

cd \siebel\bin\w32ud
call "nsprime1.bat"
pause

call "startappsrvr.bat"
echo "wait for starting siebel server"
pause

call "startsrvrmgr.bat"
echo "go next if the server is up"
pause

cd Z:\siebel\javacontainer\javacontainer-sieb\bin
call "starup.bat"
echo  "go next to config the AI"
pause