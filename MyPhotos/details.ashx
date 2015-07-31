<%@ WebHandler Language="C#" Class="details" %>

using System;
using System.Web;
using MyPhotos.Model;
using MyPhotos.BLL;
using System.Collections.Generic;
using Common;

public class details : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/html";
        string strId = context.Request.QueryString["id"];
        int id;
        if (int.TryParse(strId,out id))
        {//得到图片id，显示在大图中
            PhotoBLL pBLL = new PhotoBLL();
            Photos photo = pBLL.GetPhotoById(id);
            List<Photos> list = pBLL.GetToPHotPhotos(6);
            var v=new {p=photo,l=list};
            NVelocityHelper nv = new NVelocityHelper("model", v);
            nv.Render("front/details.html");
        }
        else
        {
            context.Response.Write("请不要随意修改URL地址栏中的内容");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}