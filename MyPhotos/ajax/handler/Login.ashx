<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using System.Web.SessionState;
using MyPhotos.BLL;
using MyPhotos.Model;

public class Login : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //获取用户输入的用户名 密码 验证码
        string name = context.Request.Form["name"];
        string pwd = context.Request.Form["pwd"];
        string code = context.Request.Form["code"].ToLower();
        //1成功   0失败  2验证码错误
        if (context.Session["code"]!=null&&context.Session["code"].ToString().ToLower()==code)
        {
            context.Session.Remove("code");//移出验证码
            User u;
            UserBLL uBLL = new UserBLL();
            if (uBLL.GetUserByUName(name,pwd,out u))
            {
                context.Session["user"] = u;//记录登录状态
                context.Response.Write(1);
            }
            else
            {
                context.Response.Write(0);
            }
        }
        else
        {
            context.Response.Write(2);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}