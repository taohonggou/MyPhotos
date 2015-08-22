<%@ WebHandler Language="C#" Class="GetComment" %>

using System;
using System.Web;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class GetComment : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string sId = context.Request.QueryString["id"];
        int id;
        if (int.TryParse(sId, out id))
        {
            CommentsBLL cB = new CommentsBLL();
            List<Comments> list = cB.GetCommentsByPId(id);
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string jsonStr = jss.Serialize(list);
            context.Response.Write(jsonStr);
        }
        else
        {
            context.Response.Write("[]");
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