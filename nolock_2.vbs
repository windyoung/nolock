Set ws=Wscript.CreateObject("Wscript.Shell")
If ws.expandenvironmentstrings("%strikkeyflag%")=("on")Then
        wscript.echo("Screen Never Lockout")
        ws.Environment("user").Item("strikkeyflag")="off"
        set mi=getobject("winmgmts:win32_process").instances_
        for each p in mi
        if ucase(p.name)=ucase("wscript.exe")then
            p.terminate
        End If
        Next
        wscript.quit
Else
        wscript.echo("Screen Never Lockout")
        ws.Environment("user").Item("strikkeyflag")="on"
    do
        set WshShell = CreateObject("WScript.Shell")
        WshShell.SendKeys"{ScrollLock}"
        wscript.sleep(280000) 'ms
    Loop
end if
