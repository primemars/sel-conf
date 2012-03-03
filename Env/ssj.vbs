Const ForAppending = 8
Dim strTextFile
Set objArgs = WScript.Arguments
strTextFile = "D:\shawn\dev_env\ssj\ssj.txt"
Set objFSO = CreateObject("Scripting.FileSystemObject")
If objFSO.FileExists(strTextFile) Then
Set objFile = objFSO.OpenTextFile(strTextFile, ForAppending)
Else
Set objFile = objFSO.CreateTextFile(strTextFile)
End If
objFile.WriteLine objArgs(0)
objFile.Close