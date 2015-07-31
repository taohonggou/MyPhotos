<%@ WebHandler Language="C#" Class="index" %>

using System;
using System.Web;
using System.Web.SessionState;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Collections.Generic;
using Common;

public class index : IHttpHandler,IReadOnlySessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/html";
        //判断是否有session
        object obj = context.Session["userName"];
        if (obj == null)
        {
            WebCommon.ReturnMstAndRedirect("请先登录", "login.ashx");
        }
        int pageIndex=1;
        int pageSize=10;
        int pageCount=-1;

       string page= context.Request.QueryString["page"];
       if (!int.TryParse(page,out pageIndex))
       {
           pageIndex = 1;
       }
      
       PhotoBLL pBLL = new PhotoBLL();
       List<Photos> list = new List<Photos>();
        try
       {
           list = pBLL.GetPagePhotos(pageSize, pageIndex, out pageCount);
       }
       catch (Exception ex)
       {
           //记录错误日志
           Common.logHelper.RecordLog(ex.StackTrace);
           //返回指定页面
           context.Response.Write(ex.Message);
           context.Response.End();
       }
       
       object o = new { list = list, pageIndex = pageIndex, pageCount = pageCount };
       NVelocityHelper nv = new NVelocityHelper("data", o);
       nv.Render("admin/index.html");
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}