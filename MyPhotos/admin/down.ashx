<%@ WebHandler Language="C#" Class="down" %>

using System;
using System.Web;
using System.Web.SessionState;
using Common;
using MyPhotos.Model;

public class down : IHttpHandler,IReadOnlySessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //判断是否登录
        User u= context.Session["userName"] as User;
        if (u==null)
        {
            WebCommon.ReturnMstAndRedirect("请先登录", "login.ashx");
        }
        string url = context.Request.QueryString["u"];
       
        //解决ie乱码问题
        string name = HttpUtility.UrlEncode(url);
        //告诉浏览器是附件，直接下载  设置响应头
        context.Response.AddHeader("Content-Disposition", "attachment;filename=" +name);
        string path = context.Server.MapPath("~/images/" + url);
        context.Response.WriteFile(path);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}