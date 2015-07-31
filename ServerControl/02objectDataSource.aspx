<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02objectDataSource.aspx.cs" Inherits="ServerControl._02objectDataSource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="TypeName" DataValueField="TypeId">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPhotoType" TypeName="MyPhotos.DAL.PhotoTypeDAL"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
