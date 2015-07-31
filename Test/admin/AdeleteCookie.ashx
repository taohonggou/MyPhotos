<%@ WebHandler Language="C#" Class="AdeleteCookie" %>

using System;
using System.Web;

public class AdeleteCookie : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        int cookieCount = context.Request.Cookies.Count;
        for (int i = 0; i < cookieCount; i++)
        {
            HttpCookie hc = context.Request.Cookies[i];
            hc.Expires = DateTime.Now.AddDays(-1);
            context.Response.Cookies.Add(hc);
        }
        context.Response.Write("删除成功");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}