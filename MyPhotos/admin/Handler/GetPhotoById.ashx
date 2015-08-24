<%@ WebHandler Language="C#" Class="GetPhotoById" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using MyPhotos.Model;
using MyPhotos.BLL;
public class GetPhotoById : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string sId = context.Request.QueryString["id"];
        int id;
        if (int.TryParse(sId, out id))
        {
            PhotoBLL pB = new PhotoBLL();
            Photos p = pB.GetPhotoById(id);
            JavaScriptSerializer jss = new JavaScriptSerializer();
            string jsonStr = jss.Serialize(p);
            context.Response.Write(jsonStr); 
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