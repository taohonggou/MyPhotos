<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="10Ajax.aspx.cs" Inherits="ServerControl._10Ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                </ContentTemplate>
            </asp:UpdatePanel>

        

            <br />
            <br />
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                        <Columns>
                            <asp:BoundField DataField="PId" HeaderText="PId" SortExpression="PId" />
                            <asp:BoundField DataField="PTypeId" HeaderText="PTypeId" SortExpression="PTypeId" />
                            <asp:BoundField DataField="PTitle" HeaderText="PTitle" SortExpression="PTitle" />
                            <asp:BoundField DataField="PUrl" HeaderText="PUrl" SortExpression="PUrl" />
                            <asp:BoundField DataField="PDes" HeaderText="PDes" SortExpression="PDes" />
                            <asp:BoundField DataField="PClicks" HeaderText="PClicks" SortExpression="PClicks" />
                            <asp:BoundField DataField="PTime" HeaderText="PTime" SortExpression="PTime" />
                            <asp:BoundField DataField="PUp" HeaderText="PUp" SortExpression="PUp" />
                            <asp:BoundField DataField="PDown" HeaderText="PDown" SortExpression="PDown" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPhotos" TypeName="MyPhotos.BLL.PhotoBLL"></asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                    </asp:Timer>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />

        

        </div>
        
    </form>
</body>
</html>
