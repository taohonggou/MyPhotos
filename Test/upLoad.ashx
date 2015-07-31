<%@ WebHandler Language="C#" Class="upLoad" %>

using System;
using System.Web;

public class upLoad : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string fileName = context.Request.Form["fileName"];
        //string path=context.Request.Form
        if (context.Request.Files.Count>0)
        {
            HttpPostedFile file= context.Request.Files["file"];
            if (file.ContentLength>0)
            {
                if (file.ContentType == "image/jpeg" || file.ContentType == "image/png"||file.ContentType == "image/gif"||file.ContentType == "image/bmp")
                {
                    //获取文件名（主要是扩展名）
                    string nameExe = System.IO.Path.GetExtension(file.FileName);
                    Random r = new Random();
                    string name = DateTime.Now.ToString("yyyymmddhhmmss") + r.Next(100000, 1000000) + nameExe;
                    string path = context.Server.MapPath("~/upLoad/" + name);
                    file.SaveAs(path);
                    context.Response.Write("成功");
                }
                else
                {
                    context.Response.Write("禁止上传");
                }
            }
            else
            {
                context.Response.Write("请上传文件");
            }
        }
        else
        {
            context.Response.Write("请上传文件");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}