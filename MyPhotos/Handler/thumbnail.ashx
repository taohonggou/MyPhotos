<%@ WebHandler Language="C#" Class="thumbnail" %>

using System;
using System.Web;
using System.Drawing;
public class thumbnail : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";
        //接受传来的参数
        int width = string.IsNullOrEmpty(context.Request.QueryString["w"]) ? 200 : Convert.ToInt32(context.Request.QueryString["w"]);
        int height = string.IsNullOrEmpty(context.Request.QueryString["h"]) ? 200 : Convert.ToInt32(context.Request.QueryString["h"]);
        int w = width;
        int h = height;
        string pUrl = context.Request.QueryString["u"];
        //获得照片路径
        string path = context.Request.MapPath("~/images/" + pUrl);
        using (Image bigImg=Image.FromFile(path))
        {
            //保持横纵比例   长的边=200 短的不够200
            //if (bigImg.Width>bigImg.Height)
            //{
            //   // width = 200;
            //    height = width * bigImg.Height / bigImg.Width;
            //}
            //else
            //{
            //   // height = 200;
            //    width = height * bigImg.Width / bigImg.Height;
            //}
            
            //短边=200  长边>200  保持横纵比例不变
            if (bigImg.Height>bigImg.Width)
            {
                height = width * bigImg.Height / bigImg.Width;
            }
            else
            {
                width = height * bigImg.Width / bigImg.Height;
            }
            
            using(Bitmap smallImg=new Bitmap(width,height))
            {
                using (Graphics g = Graphics.FromImage(smallImg))
                {
                    g.DrawImage(bigImg, 0, 0, smallImg.Width, smallImg.Height);
                    //现在得到短边=200，长边不确定  写一个方法从小图中截取出200*200来
                    using (Image img = GetImg(smallImg, w, h))
                    {
                        img.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                }
            }
        }
    }

    public Image GetImg(Image img, int width, int height)
    {
        Bitmap bit = new Bitmap(width, height);
        using (Graphics g=Graphics.FromImage(bit))
        {
            g.DrawImage(img, 0, 0, img.Width, img.Height);
            return bit;
        }
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}