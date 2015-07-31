<%@ WebHandler Language="C#" Class="verificationCode" %>

using System;
using System.Web;
using System.Drawing;

public class verificationCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "image/jpeg";
        string vCode = GetString();

        
        using (Image vCodeImg = GetVCodeImage(vCode))
        {
            vCodeImg.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
    }
 
    private Image GetVCodeImage(string vCode)
    {
        Bitmap bit = new Bitmap(80, 30);
        using (Graphics g=Graphics.FromImage(bit))
        {
            //设置边框
            g.FillRectangle(Brushes.Red, 0, 0, bit.Height, bit.Width);
            //设置背景
            g.FillRectangle(Brushes.White, 2, 2, bit.Width - 4, bit.Height - 4);
            //向图片上写字
            g.DrawString(vCode, new Font("宋体", 20), Brushes.Magenta, 10, 2);
            return bit;
        }
    }
    
    private string GetString()
    {
        string str = "0123456789abcdefghijklmnopqrstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ";
        Random r = new Random();
        string vCode = "";
        for (int i = 0; i < 4; i++)
        {
            vCode += str[r.Next(0, str.Length)];
        }
        return vCode;
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}