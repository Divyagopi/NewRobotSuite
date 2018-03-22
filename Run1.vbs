Set oShell = WScript.CreateObject ("WScript.Shell")
oShell.run "cmd.exe /k"
WScript.Sleep(300) 
oShell.SendKeys("CD \")
oShell.SendKeys "{ENTER}"
WScript.Sleep(300)
oShell.SendKeys "cd Sample_RobotExample"
oShell.SendKeys "{ENTER}"
oShell.SendKeys "Run.bat"
oShell.SendKeys "{ENTER}"
oShell.SendKeys "log.html"
oShell.SendKeys "{ENTER}"
WScript.Sleep(300)