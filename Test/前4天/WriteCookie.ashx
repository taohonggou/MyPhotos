<%@ WebHandler Language="C#" Class="WriteCookie" %>

using System;
using System.Web;

public class WriteCookie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        HttpCookie hc = new HttpCookie("time");
        hc.Value = DateTime.Now.ToString();
        hc.Expires = DateTime.Now.AddDays(7);
        context.Response.Cookies.Add(hc);
        context.Response.Write("写入cookie成功");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}