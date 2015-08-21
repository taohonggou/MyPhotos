using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using MyPhotos.BLL;
using MyPhotos.Model;

namespace PhotoDemo.handler
{
    /// <summary>
    /// SendComment 的摘要说明
    /// </summary>
    public class SendComment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string jsonStr = context.Request.Form["json"];
            JavaScriptSerializer jss = new JavaScriptSerializer();
            Comments comment= jss.Deserialize<Comments>(jsonStr);
            if (comment!=null)
            {
                CommentsBLL cB = new CommentsBLL();
                if (cB.AddComment(comment)>0)
                {
                    context.Response.Write(1);
                }
                else
                {
                    context.Response.Write(0);
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}