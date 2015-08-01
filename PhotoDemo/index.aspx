<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PhotoDemo.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="gallery">
        <asp:Repeater ID="rptPhotos" runat="server" DataSourceID="ObjectDataSource1">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <div class="name"><%# Eval("PTitle") %></div>
                    <div class="screen">
                        <a href="details.aspx?id=<%# Eval("PId") %>">
                            <img src="images/<%# Eval("PUrl") %>" width="200px" height="200px" alt="">
                        </a>
                    </div>
                    <%--<div class="vote">
            <ul>
              <li><a href="#"><img src="images/stars/yellow_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
              <li class="last"><a href="#"><img src="images/stars/green_star.gif" alt=""></a></li>
            </ul>
            <div class="totalvotes">1/10 from 1 Votes</div>
          </div>--%>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetPhotos" TypeName="MyPhotos.BLL.PhotoBLL"></asp:ObjectDataSource>
    </div>
</asp:Content>
