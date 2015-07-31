<%@ WebHandler Language="C#" Class="exit" %>

using System;
using System.Web;
using System.Web.SessionState;
public class exit : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //清除session
        context.Session.Abandon();
        //重新跳转到登录页面
        context.Response.Redirect("login.ashx");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}