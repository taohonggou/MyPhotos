<%@ WebHandler Language="C#" Class="thumbnail" %>

using System;
using System.Web;
using System.Drawing;

public class thumbnail : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";

        string path = context.Server.MapPath("/upLoad/20155708085755785001.jpg");
        //大图
        using (Image bigImg = Image.FromFile(path))
        {//小图
            using (Bitmap smallImg=new Bitmap((bigImg.Width)/2,(bigImg.Height)/2))
            {
                using (Graphics g=Graphics.FromImage(smallImg))
                {//开始画
                    g.DrawImage(bigImg, 0, 0, smallImg.Width, smallImg.Height);
                    smallImg.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}