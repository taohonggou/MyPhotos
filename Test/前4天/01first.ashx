<%@ WebHandler Language="C#" Class="_01first" %>

using System;
using System.Web;
using NVelocity.App;
using NVelocity.Runtime;
using NVelocity;
public class _01first : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/html";
        //1.创建Velocity 引擎（VelocityEngine）并设置属性
        VelocityEngine vltEngine = new VelocityEngine();
        vltEngine.SetProperty(RuntimeConstants.RESOURCE_LOADER, "file");
        vltEngine.SetProperty(RuntimeConstants.FILE_RESOURCE_LOADER_PATH, context.Request.MapPath("~/templates"));
        vltEngine.Init();

        // 2.Velocity 上下文对象设置   准备好给模板的数据
        VelocityContext vltContext = new VelocityContext();

        Person p = new Person();
        p.name = "乔布斯";
        p.age = 68;
        p.hobby = "你猜";
        vltContext.Put("data", p);
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