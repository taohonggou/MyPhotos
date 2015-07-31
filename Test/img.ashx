<%@ WebHandler Language="C#" Class="img" %>

using System;
using System.Web;
using System.Data;//ADO.NET
using System.Drawing;//gdi+
public class img : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";
        using (Bitmap bit=new Bitmap(130,50))
        {
            using (Graphics g=Graphics.FromImage(bit))
            {
                //设置边框
                g.FillRectangle(Brushes.Red, 0, 0, bit.Height, bit.Width);
                //设置背景
                g.FillRectangle(Brushes.Violet, 2, 2, bit.Width - 4, bit.Height - 4);
                //向图片上写字
                g.DrawString("hello world", new Font("微软雅黑", 15), Brushes.Black, 5, 5);
                bit.Save(context.Response.OutputStream,System.Drawing.Imaging.ImageFormat.Jpeg);
            }
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}