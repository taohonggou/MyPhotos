<%@ WebHandler Language="C#" Class="GetAllPhotoType" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using MyPhotos.BLL;
using MyPhotos.Model;

public class GetAllPhotoType : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        PhotoTypeBLL ptB = new PhotoTypeBLL();
        List<PhotoType> list = ptB.GetPhotoType();
        JavaScriptSerializer jss = new JavaScriptSerializer();
        context.Response.Write( jss.Serialize(list));
     
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}