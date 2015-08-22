<%@ WebHandler Language="C#" Class="SendComment" %>

using System;
using System.Web;
using MyPhotos.Model;
using MyPhotos.BLL;
using System.Web.Script.Serialization;

public class SendComment : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}