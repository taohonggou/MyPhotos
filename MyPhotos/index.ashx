<%@ WebHandler Language="C#" Class="index" %>

using System;
using System.Web;
using Common;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Collections.Generic;
using System.Web.SessionState;
public class index : IHttpHandler,IRequiresSessionState
{

    public void ProcessRequest(HttpContext context) {
        context.Response.ContentType = "text/html";


        //context.Response.Write(this.GetType().Assembly.Location);    获取网站dll的位置

        PhotoBLL photoB=new PhotoBLL();
        //List<Photos> listCount=photoB.GetPhotos();//图片总数
        int pageIndex = 1;
        if (context.Request["pageIndex"]!=null)
        {
            pageIndex = Convert.ToInt32(context.Request["pageIndex"]);
        }
        int pageCount = 0;
        List<Photos> listCount = photoB.GetPagePhotos(9, pageIndex, out pageCount);//得到分页数据

        List<Photos> l = photoB.GetToPHotPhotos(6);//最火图片
        //int count =Convert.ToInt32( context.Application["num"]);
        var listPhoto = new { listCount = listCount, listTop = l ,count=pageCount};
        NVelocityHelper nv = new NVelocityHelper("photos",listPhoto);
        nv.Render("front/index.html");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}