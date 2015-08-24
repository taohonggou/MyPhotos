<%@ WebHandler Language="C#" Class="EditPhotoType" %>

using System;
using System.Web;
using MyPhotos.Model;
using MyPhotos.BLL;
using System.Web.Script.Serialization;

public class EditPhotoType : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        PhotoTypeBLL pTB = new PhotoTypeBLL();
        //获取操作命令
        string action = context.Request["action"];
        JavaScriptSerializer jss = new JavaScriptSerializer();
        string json = context.Request["json"];
        PhotoType pt = jss.Deserialize<PhotoType>(json);
        if (action == "edit")
        {

            if (pTB.UpdatePhotoType(pt))
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }

        }

        else if (action == "add")
        {
            if (pTB.AddPhotoType(pt))
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
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