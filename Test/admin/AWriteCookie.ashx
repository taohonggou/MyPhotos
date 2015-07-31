<%@ WebHandler Language="C#" Class="AWriteCookie" %>

using System;
using System.Web;

public class AWriteCookie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpCookie hc = new HttpCookie("path");
        //hc.Expires = DateTime.Now.AddDays(2);
        //hc.Value = "asfdasfs";
        hc.Path = "~/admin";
        context.Response.Cookies.Add(hc);
        context.Response.Write("写入成功");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}