<%@ WebHandler Language="C#" Class="ReadSession" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ReadSession : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        object obj= context.Session["user"];
        if (obj!=null)
        {
            context.Response.Write(obj.ToString()+"============");
            context.Response.Write(context.Session.SessionID);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}