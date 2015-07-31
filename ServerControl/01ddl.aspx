<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01ddl.aspx.cs" Inherits="ServerControl._01ddl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
    <a href="07Request.aspx">07Request</a>
    </div>
        <img src="http://localhost:50686/images/10.jpg" />
    </form>
</body>
</html>
