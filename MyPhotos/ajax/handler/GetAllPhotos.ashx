<%@ WebHandler Language="C#" Class="GetAllPhotos" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Web.SessionState;
public class GetAllPhotos : IHttpHandler,IReadOnlySessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //判断是否登录
        User u;
        u = context.Session["user"] as User;
        int status = 1;
        if (u==null)
        {
            status = 0;
            context.Response.Write("{\"status\":"+status+"}");
            context.Response.End();
        }
        
        PhotoBLL pB = new PhotoBLL();
        List<Photos> list = new List<Photos>();
        //获取分页数据、
        int pageIndex =Convert.ToInt32( context.Request.QueryString["pageIndex"]);
        int pageCount;
        int pageSize = 10;
        list = pB.GetPagePhotos(pageSize, pageIndex, out pageCount);
        JavaScriptSerializer jss = new JavaScriptSerializer();
        //string jsonStr = jss.Serialize(list);
        var data = new { status=status,photos=list,pageCount=pageCount};//匿名类
            
        context.Response.Write(jss.Serialize(data));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}