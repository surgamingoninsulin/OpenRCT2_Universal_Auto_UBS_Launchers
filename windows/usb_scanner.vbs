Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

strLetter = ""

' 1. Use native Windows WMI to instantly look for the drive labeled 'OpenRCT2_USB'
Set objWMIService = GetObject("winmgmts:\\.\\root\\cimv2")
Set colVolumes = objWMIService.ExecQuery("Select DriveLetter from Win32_Volume Where Label = 'OpenRCT2_USB'")

' 2. Extract the clean drive letter if the volume is mounted and active
For Each objVolume In colVolumes
    If Not IsNull(objVolume.DriveLetter) And objVolume.DriveLetter <> "" Then
        strLetter = objVolume.DriveLetter
        Exit For
    End If
Next

' 3. If found, execute the launch sequence safely
If strLetter <> "" Then
    strUSB = strLetter & "\"
    strTargetExe = strUSB & "openrct2.exe"
    strDataFolder = strUSB & "data"
    
    If objFSO.FileExists(strTargetExe) Then
        objShell.CurrentDirectory = strUSB
        strLaunch = "\"" & strTargetExe & "\" --user-data-path=\"" & strDataFolder & "\""
        objShell.Run strLaunch, 1, False
    End If
End If
