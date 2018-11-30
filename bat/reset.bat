z:
cd z:\siebel\javacontainer\javacontainer-gtwy\bin
call "shutdown.bat"
pause

cd z:\siebel\javacontainer\javacontainer-swsm\bin
call "shutdown.bat"
echo "please close the zookeeper window"
pause

c:
cd share\setupEnv
gradle reset
pause
gradle resetProperty
pause