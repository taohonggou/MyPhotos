using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// FDL 的摘要说明
/// </summary>
public class FDL:IHttpModule
{
    
    public void Dispose()
    {
        
    }

    public void Init(HttpApplication context)
    {
        context.BeginRequest += Context_BeginRequest;
    }

    private void Context_BeginRequest(object sender, EventArgs e)
    {
        HttpApplication app = sender as HttpApplication;
        if (app!=null)
        {
            string  u = app.Request.RawUrl;
            if (u.Contains("/images/"))
            {
                Uri url = app.Request.Url;
                Uri refUrl = app.Request.UrlReferrer;
                if (!CompareUrl(url,refUrl))
                {//不合法
                    app.Response.ContentType = "image/jpeg";
                    string path = app.Request.MapPath("~/images/daolian.jpg");
                    app.Response.WriteFile(path);
                    app.Response.End();
                }
            }
        }
    }

    private bool CompareUrl(Uri u1,Uri u2)
    {
        return Uri.Compare(u1, u2, UriComponents.HostAndPort, UriFormat.SafeUnescaped, StringComparison.CurrentCultureIgnoreCase) == 0;
    }
}