Imports System.Data.Odbc
Public Class FormLogin
    Private Sub FormLogin_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call KondisiAwal()
    End Sub
    Sub Terbuka()
        FormmenuUtama.LoginToolStripMenuItem.Enabled = True
        FormmenuUtama.LogoutToolStripMenuItem.Enabled = True
        FormmenuUtama.MasterToolStripMenuItem.Enabled = True
        FormmenuUtama.TransaksiToolStripMenuItem.Enabled = True
        FormmenuUtama.LaporanToolStripMenuItem.Enabled = True
        FormmenuUtama.UtilityToolStripMenuItem.Enabled = True
    End Sub
    Sub KondisiAwal()
        TextBox1.Text = ""
        TextBox2.Text = ""
    End Sub
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Or TextBox2.Text = "" Then
            MsgBox("Kode Admin dan Password Tidak Boleh Kosong!!")
        Else
            Call Koneksi()
            Cmd = New OdbcCommand("Select * From tbl_admin Where kodeadmin= '" & TextBox1.Text & "' and passwordadmin= '" & TextBox2.Text & "'", Conn)
            Rd = Cmd.ExecuteReader
            Rd.Read()
            If Rd.HasRows Then
                Me.Close()
                Call Terbuka()
                FormmenuUtama.STLabel2.Text = Rd!KodeAdmin
                FormmenuUtama.STLabel4.Text = Rd!NamaAdmin
                FormmenuUtama.STLabel6.Text = Rd!LevelAdmin
                If FormmenuUtama.STLabel6.Text = "USER" Then
                    FormmenuUtama.AdminToolStripMenuItem.Enabled = False
                End If
            Else
                MsgBox("kodeadmin atau password salah!")
            End If
        End If
    End Sub
  
   
End Class