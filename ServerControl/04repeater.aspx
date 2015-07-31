<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="04repeater.aspx.cs" Inherits="ServerControl._04repeater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #photo,#photo td{
           border-collapse: collapse;
            border:1px solid red;
            cursor:pointer;
        }
    </style>
    <script src="jquery-2.1.4.js"></script>
    <script type="text/javascript">
        $(function () {
            //$("#photo tr:not(:first):even").css("background-color", "red");
            //$("#photo tr:not(:first):odd").css("background-color", "gray");
            var bg;
            $("#photo tr:not(:first)").hover(function () {
                bg = $(this).css("background-color");
                $(this).css("background-color", "black");
            }, function () {
                $(this).css("background-color", bg);
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="rpt" runat="server" OnItemDataBound="rpt_ItemDataBound" OnItemCommand="rpt_ItemCommand">
            <HeaderTemplate>
                <table id="photo">
                    <tr>
                        <td>序号</td>
                        <td>标题</td>
                        <td>图片</td>
                        <td>点击次数</td>
                        <td>支持</td>
                        <td>反对</td>
                        <td>时间</td>
                        <td>操作</td>
                    </tr>
                
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%# Container.ItemIndex+1 %>
                    </td>
                    <td><%# Eval("PTitle") %></td>
                    <td><%# Eval("PUrl") %></td>
                    <td>
                        <asp:Label ID="lblClicks" runat="server" Text='<%# Eval("PClicks") %>'></asp:Label> 
                        </td>
                    <td>
                        <asp:ImageButton ID="btnUp" CommandArgument='<%# Eval("PId") %>' ImageUrl="~/85.gif" runat="server" CommandName="up" />
                        <%# Eval("PUP") %></td>
                    <td>
                        <asp:ImageButton ID="btnDown" runat="server" CommandName="down" CommandArgument='<%# Eval("PId") %>' ImageUrl="~/86.gif" />
                        <%# Eval("PDown") %></td>
                    <td><%# Eval("PTime","{0:yyyy-mm-dd hh-mm-ss}") %></td>
                    <td>
                        <asp:LinkButton CommandArgument='<%# Eval("PId") %>' ID="btnDelete" CommandName="delete" runat="server">删除</asp:LinkButton>
                       </td>
                </tr>

            </ItemTemplate>
            
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    </form>
</body>
</html>
