<%@ WebHandler Language="C#" Class="GetHotPhotos" %>

using System;
using System.Web;
using System.Collections.Generic;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Web.Script.Serialization;
public class GetHotPhotos : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        PhotoBLL pb = new PhotoBLL();
        List<Photos> list = pb.GetToPHotPhotos(6);
        JavaScriptSerializer jss = new JavaScriptSerializer();
        context.Response.Write(jss.Serialize(list));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}