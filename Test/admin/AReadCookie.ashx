<%@ WebHandler Language="C#" Class="AReadCookie" %>

using System;
using System.Web;

public class AReadCookie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpCookie hc = context.Request.Cookies["path"];
        if (hc!=null)
        {
            context.Response.Write(hc.Value);
        }
        else
        {
            context.Response.Write("失败");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}