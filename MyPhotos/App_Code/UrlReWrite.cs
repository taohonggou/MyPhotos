using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
/// <summary>
/// UrlReWrite 的摘要说明
/// </summary>
public class UrlReWrite:IHttpModule
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
            //判断请求地址格式
            Regex regex = new Regex(@"/photo\-(\d{1,6})\.htm");
            string rawUrl = app.Request.RawUrl;
            Match m = regex.Match(rawUrl);
            if (m.Success)
            {
                //获取照片的id
                string pId = m.Groups[1].Value;
                app.Context.RewritePath("~/Page.aspx?id=" + pId);
            }
        }
    }
}