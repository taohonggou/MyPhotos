<%@ WebHandler Language="C#" Class="WriteSession" %>

using System;
using System.Web;
using System.Web.SessionState;

public class WriteSession : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        context.Session["user"] = "admin";
        context.Response.Write("成功");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}