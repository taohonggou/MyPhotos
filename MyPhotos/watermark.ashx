<%@ WebHandler Language="C#" Class="watermark" %>

using System;
using System.Web;
using System.Drawing;

public class watermark : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";
        //获得图片地址
        string pUrl = context.Request.QueryString["u"];
        string bigPath = context.Server.MapPath("~/images/" + pUrl);
        using (Image bigImg=Image.FromFile(bigPath))
        {
            string logoPath = context.Server.MapPath("~/images/logo.png");
            using (Image logoImg = Image.FromFile(logoPath))
            {
                using (Graphics g=Graphics.FromImage(bigImg))
                {
                    int x=bigImg.Width-logoImg.Width-5;
                    int y=bigImg.Height-logoImg.Height-5;
                    g.DrawImage(logoImg, x, y, logoImg.Width, logoImg.Height);
                    bigImg.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
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