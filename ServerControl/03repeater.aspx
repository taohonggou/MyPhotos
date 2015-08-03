<%@  Page Language="C#" Title="主页" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="03repeater.aspx.cs" Inherits="ServerControl._03repeater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
       *{
           margin:0px;
           padding:0px;
       }
         #p{
            list-style-type:none;
        }
         #p li{
             float:left;
             border:1px solid red;
             margin-right:5px;
             margin-bottom:5px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
            <HeaderTemplate>
                <ul id="p">
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <img src="images/<%# Eval("PUrl") %>" width="100px" height="150px" />
                    <br />
                    <span><%# Eval("PTitle") %></span>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        
        
        <asp:ObjectDataSource EnableCaching="true" CacheDuration="10" ID="ObjectDataSource1" runat="server" SelectMethod="GetPhotos" TypeName="MyPhotos.BLL.PhotoBLL"></asp:ObjectDataSource>
    
</asp:Content>

  

