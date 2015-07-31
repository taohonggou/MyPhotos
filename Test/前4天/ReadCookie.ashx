<%@ WebHandler Language="C#" Class="ReadCookie" %>

using System;
using System.Web;

public class ReadCookie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpCookie hc = context.Request.Cookies["time"];
        if (hc!=null)
        {
            context.Response.Write(hc.Value);
        }
        else
        {
            context.Response.Write("读取失败");
        }

        hc = context.Request.Cookies["path"];
        if (hc!=null)
        {
            context.Response.Write(hc.Value);
        }
        else
        {
            context.Response.Write("读取失败");
               
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}