<%@ WebHandler Language="C#" Class="_02photolist" %>

using System;
using System.Web;
using NVelocity.App;
using NVelocity.Runtime;
using NVelocity;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Collections.Generic;

public class _02photolist : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/html";
        //1.创建Velocity 引擎（VelocityEngine）并设置属性
        VelocityEngine vltEngine = new VelocityEngine();
        vltEngine.SetProperty(RuntimeConstants.RESOURCE_LOADER, "file");
        vltEngine.SetProperty(RuntimeConstants.FILE_RESOURCE_LOADER_PATH, context.Request.MapPath("~/templates"));
        vltEngine.Init();

        // 2.Velocity 上下文对象设置   准备好给模板的数据
        VelocityContext vltContext = new VelocityContext();
        //获取数据
        PhotoBLL pBLL = new PhotoBLL();
        List<Photos> list = pBLL.GetPhotos();
        
        vltContext.Put("data", list);
        // 3.创建模板
        Template vltTemplate = vltEngine.GetTemplate("index.html");
        //接收最终生成的html标签
        System.IO.StringWriter vltWriter = new System.IO.StringWriter();
        // 4.合并模板和上下文对象，输出
        //把上文对象中的数据给模板，并进行替换操作，把最终生成的html标签，存储在StringWriter中
        vltTemplate.Merge(vltContext, vltWriter);

        context.Response.Write(vltWriter.GetStringBuilder().ToString());
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}