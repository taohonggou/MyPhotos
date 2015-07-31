using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PhotoDemo
{
    public class FDL : IHttpHandler
    {
        public bool IsReusable
        {
            get
            {
                return true;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "image/jpeg";
            //获取当前请求的url
            Uri url = context.Request.Url;
            //获取referrer地址
            Uri referrer = context.Request.UrlReferrer;
            //比较两个url地址是否相同
            string r = "";
            if (CompareUrl(url,referrer))
            {//合法
                //获得请求的RawUrl，并将地址装换为物理路径
                r = context.Request.RawUrl;
            }
            else
            {
                //输出违法图片
                r = "~/images/daolian.jpg";
            }
            string path = context.Request.MapPath(r);
            context.Response.WriteFile(path);
        }

        private bool CompareUrl(Uri u1,Uri u2)
        {
            return Uri.Compare(u1, u2, UriComponents.HostAndPort, UriFormat.SafeUnescaped, StringComparison.CurrentCultureIgnoreCase) == 0;
        }
    }
}