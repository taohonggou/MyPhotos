<%@ WebHandler Language="C#" Class="deleteCookies" %>

using System;
using System.Web;

public class deleteCookies : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        int hcCount = context.Request.Cookies.Count;
        for (int i = 0; i < hcCount; i++)
        {
            HttpCookie hc = context.Request.Cookies[i];
            hc.Expires = DateTime.Now.AddDays(-1);
            context.Response.Cookies.Add(hc);
        }
        context.Response.Write("删除成功");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}