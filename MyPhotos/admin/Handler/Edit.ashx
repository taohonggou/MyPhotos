<%@ WebHandler Language="C#" Class="Edit" %>

using System;
using System.Web;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Web.Script.Serialization;
public class Edit : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string action = context.Request.QueryString["action"];
        if (action == "delete")
        {
            Delete(context);
        }
        else if (action == "add"||action=="edit")
        {
            Save(action, context);
        }
    }
    
    /// <summary>
    /// 添加跟修改照片 
    /// </summary>
    /// <param name="action"></param>
    /// <param name="context"></param>
    private void Save(string action,HttpContext context)
    {
        string jsonStr = context.Request.Form["json"];
        JavaScriptSerializer jss = new JavaScriptSerializer();
        Photos p = jss.Deserialize<Photos>(jsonStr);
        PhotoBLL pB = new PhotoBLL();
        if (pB.Save(action, p))
        {
            context.Response.Write(1);
        }
        else
        {
            context.Response.Write(0);
        }
    }
    
    /// <summary>
    /// 添加图片  1成功   0失败
    /// </summary>
    /// <param name="context"></param>
    private void Add(HttpContext context)
    {
        string jsonStr = context.Request.Form["json"];
        JavaScriptSerializer jss = new JavaScriptSerializer();
        Photos p = jss.Deserialize<Photos>(jsonStr);
        PhotoBLL pB = new PhotoBLL();
        if (pB.AddPhoto(p) > 0)
        {
            context.Response.Write(1);
        }
        else
        {
            context.Response.Write(0);
        }
    }

    /// <summary>
    /// 删除照片  1成功  2失败  3有评论
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private void Delete(HttpContext context)
    {
        //获取id
        string sId = context.Request.QueryString["id"];
        int id;
        if (int.TryParse(sId, out id))
        {
            PhotoBLL pB = new PhotoBLL();

            context.Response.Write(pB.DeletePhoto(id));
        }
        else
        {
            context.Response.Write(-1);
        }
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}