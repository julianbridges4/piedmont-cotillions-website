<%@ Page Language="VB" %>
<script runat="server">


	Function GetFileList() As String
		
		Dim TargetDirectory As String = "/GERI/images/galleryx/"
		If Request.QueryString("dir") <> "" Then
			TargetDirectory = Request.QueryString("dir")
		End If
		
		Dim di As New IO.DirectoryInfo(Server.MapPath(TargetDirectory))
		Dim diar1 As IO.FileInfo() = di.GetFiles()
		Dim dra As IO.FileInfo
		Dim output As String = "["
		Dim sep As String = ""
		
		'list the names of all files in the specified directory
		For Each dra In diar1
			output &= sep & """" & TargetDirectory & dra.Name & """"
			sep = ","
		Next
		Return output & "]"
	End Function
	
	Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
		Response.Write(GetFileList)
	End Sub
</script>
