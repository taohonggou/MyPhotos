<%@ WebHandler Language="C#" Class="GetPhotoTypeById" %>

using System;
using System.Web;
using MyPhotos.Model;
using MyPhotos.BLL;
using System.Web.Script.Serialization;

public class GetPhotoTypeById : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        PhotoTypeBLL pTB = new PhotoTypeBLL();
        int id = Convert.ToInt32(context.Request["id"]);
        PhotoType pt = pTB.GetPTypeById(id);
        JavaScriptSerializer jss = new JavaScriptSerializer();
        context.Response.Write(jss.Serialize(pt));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}