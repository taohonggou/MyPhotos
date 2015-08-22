<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" CodeFile="Page.aspx.cs" Inherits="Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
    <title>Gallery | Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="stylesheet" href="styles/layout.css" type="text/css" />
    <link rel="stylesheet" href="styles/2col.css" type="text/css" />
    <link rel="stylesheet" href="styles/gallery.css" type="text/css" />
    <script type="text/javascript" src="script/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="script/jsrender.js"></script>
    <script id="comment" type="text/x-jsrender">
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

    <script id="hot" type="text/x-jsrender">
        {{for #data.hotPhotos}}
        <li><a href="photo-{{:PId}}.htm">
            <img src="Handler/thumbnail.ashx?u={{:PUrl}}&w=125&h=125" alt="" /></a></li>
        {{/for}}
    </script>

    <script type="text/javascript">
        $(function () {
            //加载最热图片
            loadHotPhotos();
            //加载图片评论
            loadComments();
            //发表评论
            $("#submit").click(function () {
                var data = getJsonStr("form1");
                $.post("Handler/SendComment.ashx", { json: data }, function (msg) {
                    if (msg == 1) {
                        $("#reset").click();
                        loadComments();
                    } else if (msg == 0) {
                        alert("添加失败");
                    } else {
                        alert("未知错误");
                    }
                })
            });
        })
        //加载最热图片
        function loadHotPhotos() {
            $.getJSON("Handler/GetHotPhotos.ashx?_" + Math.random(), function (json) {

                var html = $("#hot").render({ "hotPhotos": json });
                $("#banner125").html(html);
            })
        }

        //加载评论
        function loadComments() {
            //拿到id
            var id = $("#hdId").val();
            $.getJSON("Handler/GetComment.ashx?id=" + id, function (array) {
                var html = $("#comment").render({ array: array }, { cvt: ChangeDateFormat });
                $("#cmt").html(html);
            })
        }

        //将毫秒的时间转换为普通时间
        function ChangeDateFormat(cellval) {
            var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            var hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            return date.getFullYear() + "-" + month + "-" + currentDate + " " + hour + ":" + minute + ":" + second;
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
    </script>

</head>
<body id="top">
    <div class="wrapper col1">
        <div id="head">
            <h1><a href="Index.html">Gallery</a></h1>
            <p></p>
            <div id="topnav">
                <ul>
                    <li><a href="Index.html">Home</a></li>
                    
                    <li><a class="active" href="Page.aspx?id=1">Page</a></li>
                    <li><a href="About.html">About</a></li>

                </ul>
            </div>
        </div>
    </div>
    <!--  / Head -->
    <div class="wrapper col2">
        <div class="container">

            <div id="content">
                <h1><%=p.PTitle %></h1>
                <div id="screen"><a href="javascript:void(0);">
                    <img src="images/<%=p.PUrl %>" width="660" alt="" /></a></div>
                <div id="info">
                    <p><%=p.PDes %></p>
                </div>
                <div id="comments">
                    <h2>Comments</h2>
                    <div id="cmt">
                    </div>
                </div>
                <h2>Write A Comment</h2>
                <div id="respond">
                    <form action="#" method="post" id="form1">
                        <input type="hidden" name="CPhotoId" id="hdId" value="<%= p.PId %>" />
                        <p>
                            <input type="text" name="CuserName" id="name" value="" size="22" />
                            <label for="name"><small>用户名</small></label>
                        </p>
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

            <div id="column">
                <div class="sponsors">
                    <h2 class="title">最热图片</h2>
                    <ul id="banner125">
                    </ul>
                    <div class="clear"></div>
                </div>

            </div>

            <div class="clear"></div>
        </div>
    </div>
    <div class="wrapper col3">
        <div id="copyright">
            <ul>
                <li>Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></li>
                <li><a target="_blank" rel="nofollow" href="http://validator.w3.org/check?uri=referer">Valid XHTML</a></li>
                <li><a target="_blank" rel="nofollow" href="http://jigsaw.w3.org/css-validator/check/referer">Valid CSS</a></li>
                <li class="last">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></li>
            </ul>
        </div>
    </div>
    <div style="text-align: center; font-size: 12px; margin: 10px">
        <script language="javascript" src="http://www.sharejs.com/js/720.js"></script>

        <br>
        <br>
        Download from <a href="http://www.sharejs.com">www.sharejs.com</a>
    </div>
</body>
</html>

