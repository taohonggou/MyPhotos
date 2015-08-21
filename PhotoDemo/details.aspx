<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="PhotoDemo.details" %>

<%@ OutputCache VaryByParam="id" Duration="20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-2.1.4.js"></script>
    <script src="script/jsrender.js"></script>
    <script id="tmpl" type="text/x-jsrender">
        <ul class="commentlist">
            {{for #data.array}}
            <li class="comment_odd">
                <div class="author">
                    <img class="avatar" src="images/demo/avatar.gif" width="32" height="32" alt="" />
                    <span class="name"><a href="#">{{:CUserName}}</a></span>
                    <span class="wrote">wrote:</span>
                </div>
                <div class="submitdate">
                    <a href="#">{{:~cvt(CTime)}}</a>
                </div>
                <p>
                    {{:CText}}
                </p>
            </li>
            {{/for}}
        </ul>
    </script>

    <script type="text/javascript">
        $(function () {
            $("#c").text("正在加载评论");
            loadComments();

            //发表评论
            $("#submit").click(function () {
                var data = getJsonStr("f1");
                $.post("handler/SendComment.ashx", { json: data }, function (msg) {
                    if (msg == 1) {
                        loadComments();
                    } else if (msg == 0) {
                        alert("添加失败");
                    } else {
                        alert("未知错误");
                    }
                })
            });

        })


        function loadComments() {

            //拿到id
            var id = $("#hdId").val();
            $.getJSON("handler/GetComments.ashx", { id: id }, function (array) {
                var html = $("#tmpl").render({ array: array }, { cvt: ChangeDateFormat });
                $("#c").html(html);
            })
        }
        //把form中的具有name属性的表单元素，最终构建成json形式的字符串
        function getJsonStr(formId) {
            //会把表单中具有name属性的表单元素的值提取  [name:表单元素的name属性,value:表单元素的值]
            var array = $("#" + formId).serializeArray();
            //{表单元素的name:表单元素的值,}
            var json = {};
            for (var i = 0; i < array.length; i++) {
                var j = array[i];  //  {name:"PTitle",value:"aa"}
                json[j.name] = j.value;
            }
            //把json对象转换成json形式的字符串
            var jsonStr = JSON.stringify(json);
            return jsonStr;
        }
        function ChangeDateFormat(cellval) {
            var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            var hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            return date.getFullYear() + "-" + month + "-" + currentDate + " " + hour + ":" + minute + ":" + second;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">

        <h1><%= p.PTitle %></h1>
        <div id="screen">
            <a href="#">
                <img src="images/<%= p.PUrl %>" width="660" alt="" /></a>
        </div>
        <div id="info">
            <p><%= p.PDes %></p>
        </div>





        <div id="comments">
            <h2>评论列表</h2>
            <div id="c">
            </div>
        </div>



        <h2>Write A Comment</h2>
        <div id="respond">
            <form id="f1" action="#" method="post">
                <input type="hidden" name="CPhotoId" id="hdId" value="<%= p.PId %>" />
                <input type="text" name="CuserName" id="name" value="" size="22" />
                <label for="name"><small>用户名</small></label>
                <br />

                <p>
                    <textarea name="CText" id="message" cols="100%" rows="10"></textarea>
                    <label for="message" style="display: none;"><small>Message</small></label>
                </p>
                <p>
                    <input name="submit" type="button" id="submit" value="Submit Form" />
                    &nbsp;
            <input name="reset" type="reset" id="reset" tabindex="5" value="Reset Form" />
                </p>
            </form>
        </div>
    </div>
</asp:Content>
