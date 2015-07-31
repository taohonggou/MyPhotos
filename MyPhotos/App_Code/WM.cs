using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
/// <summary>
/// WM 的摘要说明
/// </summary>
public class WM:IHttpHandler
{
	public WM()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    public bool IsReusable
    {
        get { return true; }
    }

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "image/jpeg";
        //获得图片地址   
        string pUrl = context.Request.RawUrl;//这是获得当前请求的原始URL
        string bigPath = context.Server.MapPath(pUrl);
        using (Image bigImg = Image.FromFile(bigPath))
        {
            string logoPath = context.Server.MapPath("~/images/logo.png");
            using (Image logoImg = Image.FromFile(logoPath))
            {
                using (Graphics g = Graphics.FromImage(bigImg))
                {
                    //int x = bigImg.Width - logoImg.Width - 5;
                    //int y = bigImg.Height - logoImg.Height - 5;
                    g.DrawImage(logoImg, 0, 0, logoImg.Width, logoImg.Height);
                    bigImg.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
                }
            }
        }
    }
}