= &H206
Public Const WM_RBUTTONDOWN = &H204
Public Const WM_RBUTTONUP = &H205

Public Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Dim TrayI As NOTIFYICONDATA




'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Declare Function ReleaseDC& Lib "user32" (ByVal hWnd As Long, ByVal hdc As Long)


Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, _
    ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, _
    ByVal cy As Long, ByVal wFlags As Long) As Long

Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long

Public Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, _
    ByVal yPoint As Long) As Long
    
Public Declare Function GetParent Lib "user32" (ByVal hWnd As Long) As Long

Public Declare Function GetClassName Lib "user32" Alias "GetClassNameA" _
    (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long

Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" _
    (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''               some structures     ''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Type POINTAPI
  X As Long
  Y As Long
End Type

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''' Sound Object from Windows Media Player ...(msdxm.ocx)  ''''
Dim Sound As New MediaPlayer.MediaPlayer
Public Function PlaySound(ByVal strFile As String)
 On Error GoTo EH
  Sound.Open App.Path & "\" & strFile
  Exit Function
EH:
  Query.txtDisplay = Err.Number & Space(2) & Err.Description & vbCrLf & "PlaySound(strFile)"
End Function
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''


'''''''''''''Tray Icon Code  '''''''''''

Public Sub Create_Tray()
On Error GoTo EH

    TrayI.cbSize = Len(TrayI)
    TrayI.hWnd = Query.picTray.hWnd 'Link the trayicon to this picturebox
    TrayI.uId = 1&
    TrayI.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
    TrayI.ucallbackMessage = WM_LBUTTONDOWN
    TrayI.hIcon = Query.picTray.Picture
    TrayI.szTip = "Net Eye"
    'Create the icon
    Shell_NotifyIcon NIM_ADD, TrayI
    Query.Hide
    
    Exit Sub
EH:
   Query.txtDisplay = Err.Number & Space(2) & Err.Description & vbCrLf & "Create_Tray()"
End Sub

Public Sub Delete_Tray()
  On Error GoTo EH
  
    TrayI.cbSize = Len(TrayI)
    TrayI.hWnd = Query.picTray.hWnd
    TrayI.uId = 1&
    'Delete the icon
    Shell_NotifyIcon NIM_DELETE, TrayI
 
 Exit Sub
EH:
 Query.txtDisplay = Err.Number & Space(2) & Err.Description & vbCrLf & "Delete_Tray()"
End Sub

'''''''''''''''''''''''''''''''''''''''''





                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  VERSION 5.00
Begin VB.Form frmAbout 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Spy....."
   ClientHeight    =   3465
   ClientLeft      =   3630
   ClientTop       =   675
   ClientWidth     =   5745
   ForeColor       =   &H00FFFFFF&
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   231
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   383
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdSysInfo 
      Caption         =   "&System Info"
      Height          =   375
      Left            =   4680
      TabIndex        =   6
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   2520
 