<%@ WebHandler Language="C#" Class="PhotoEdit" %>

using System;
using System.Web;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Collections.Generic;
using Common;

public class PhotoEdit : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/html";

        string action = context.Request.QueryString["action"];
        string pId = context.Request.QueryString["pId"];
        bool ispostback = !string.IsNullOrEmpty(context.Request.Form["_viewstate"]);
        if (!ispostback)
        {//get
            if (action == "delete")
            {
                Delete(context, pId);
            }
            else if (action == "add")
            {
                //获取相册
                PhotoTypeBLL ptBLL = new PhotoTypeBLL();
                List<PhotoType> list = ptBLL.GetPhotoType();
                var o = new { list = list };
                GetAdd(o);
            }
            else if (action == "update")
            {
                int id;
                if (int.TryParse(pId,out id))
                {
                    PhotoBLL pBLL=new PhotoBLL();
                    Photos p = pBLL.GetPhotoById(id);
                    EditPhoto(p);
                }
                else
                {
                    WebCommon.ReturnMstAndRedirect("不要改动url的值", "index.ashx");
                }
            }
        }
        else
        {//post
            if (action == "add")
            {//获取到photo对象，传到数据库中
                Photos p = new Photos();
                p.PDes = context.Request.Form["PDesc"];
                p.PTitle = context.Request.Form["PTitle"];
                p.PUrl = context.Request.Form["PUrl"];
                p.PTypeId = int.Parse(context.Request.Form["PhotoType"]);
                PhotoBLL pBLL = new PhotoBLL();
                int i = pBLL.AddPhoto(p);
               
                if (i > 0)
                {
                    context.Response.Redirect("index.ashx");
                }
                else
                {
                    //WebCommon.ReturnMstAndRedirect("添加失败", "PhotoEdit.ashx?action=add");
                    context.Response.Write("<script>alert('添加失败')</script>");
                    PhotoTypeBLL ptBLL = new PhotoTypeBLL();
                    List<PhotoType> list = ptBLL.GetPhotoType();
                    var o = new { list = list, p = p };
                    GetAdd(o);
                }
            }
            else if (action=="update")
            {
                //获取到photo对象，传到数据库中
                Photos p = new Photos();
                p.PDes = context.Request.Form["PDesc"];
                p.PTitle = context.Request.Form["PTitle"];
                p.PUrl = context.Request.Form["PUrl"];
                p.PTypeId = int.Parse(context.Request.Form["PhotoType"]);
                p.PId = int.Parse(context.Request.QueryString["pId"]);
                PhotoBLL pBLL = new PhotoBLL();
               int i= pBLL.UpdatePhoto(p);
               if (i>0)
               {
                   context.Response.Redirect("index.ashx");
               }
               else
               {
                   WebCommon.ReturnMstAndRedirect("修改失败", "index.ashx");
               }
            }
        }
    }

    private void EditPhoto(Photos p)
    {
        PhotoTypeBLL ptBLL = new PhotoTypeBLL();
        List<PhotoType> list = ptBLL.GetPhotoType();
        object o=new{list=list,p=p};
        NVelocityHelper nv = new NVelocityHelper("model", o);
        nv.Render("admin/editphoto.html");
    }
    
    private  void GetAdd(object o)
    {

        NVelocityHelper nv = new NVelocityHelper("model", o);
        nv.Render("admin/addPhoto.html");
    }


    private static void Delete(HttpContext context, string pId)
    {
        //判断id是否为数字
        int id;
        if (int.TryParse(pId, out id))
        {//进行删除
            PhotoBLL pBLL = new PhotoBLL();
            int res = pBLL.DeletePhoto(id);
            switch (res)
            {
                case 1:
                    context.Response.Redirect("index.ashx");
                    break;
                case 2:
                    WebCommon.ReturnMstAndRedirect("删除失败", "index.ashx");
                    break;
                case 3:
                    WebCommon.ReturnMstAndRedirect("有评论", "index.ashx");
                    break;
            }
        }
        else
        {
            WebCommon.ReturnMstAndRedirect("不要改动url的值", "index.ashx");
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