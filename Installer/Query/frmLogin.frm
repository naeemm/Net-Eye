1
      Left            =   120
      TabIndex        =   2
      Top             =   540
      Width           =   1080
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    End
End Sub

Private Sub cmdOK_Click()
    If txtPassword = "eye" And txtUserName = "net" Then
        PlaySound "NetEye.wav"
        Unload Me
        Query.Show
    Else
        MsgBox "Invalid Password, try again!", , "Login"
        txtPassword.SetFocus
        SendKeys "{Home}+{End}"
    End If
End Sub

Private Sub Form_Load()
  App.HelpFile = App.Path & "\NetEye.chm"
End Sub

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    >  lt  6             �  &        (    (       @         �                        �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ���                 �����   �����                  ��������������                  ���     ���    � �     � �    � �     � �    ���     ���                                               �����  �����                 ��������������                  ���     ���    � �     � �    � �     � �    ���     ���                                                     p                          ����                            ��                                         ��                        � ���� ���>��>��>��>��~����� � ����  ���>��>��>��>��~�������������