<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Web.SessionState;
using Common;
using MyPhotos.BLL;
using MyPhotos.Model;

public class login : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/html";
        bool ispostback = !string.IsNullOrEmpty(context.Request.Form["_viewstate"]);
        if (ispostback)
        {
            //获取用户输入的用户名米啊
            string name = context.Request.Form["userName"];
            string pwd = context.Request.Form["pwd"];
            string cVCode=context.Request.Form["vCode"].ToLower();
            //这里需要判断session不能为空
            string sVCode = context.Session["vCode"].ToString().ToLower();
            if (cVCode==sVCode)
            {
                User u;
                UserBLL uB = new UserBLL();

                if (uB.GetUserByUName(name, pwd, out u))
                {
                    //将session中的验证码移除掉
                    context.Session.Remove("vCode");
                    //将用户信息存入session中
                    context.Session["userName"] = u;

                    //将用户名存入到cookie中 
                    HttpCookie hc = new HttpCookie("userName");
                    hc.Value = name;
                    hc.Expires = DateTime.Now.AddDays(1);
                    context.Response.Cookies.Add(hc);

                    context.Response.Redirect("index.ashx");
                }
                else
                {
                    var o = new { name = name, msg = "登陆失败" };

                    NVelocityHelper nv = new NVelocityHelper("data", o);
                    nv.Render("admin/login.html");
                }
            }
            else
            {
                var o = new { name = name, msg = "验证码错误" };
                NVelocityHelper nv = new NVelocityHelper("data", o);
                nv.Render("admin/login.html");
            }
        }
        else
        {//第一次加载
            //判断cookie userName是否有值
            HttpCookie hc = context.Request.Cookies["userName"];
            object o = null;
            if (hc!=null)
            {
                 o = new {name=hc.Value };
            }
            NVelocityHelper nv = new NVelocityHelper("data", o);
            nv.Render("admin/login.html");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}