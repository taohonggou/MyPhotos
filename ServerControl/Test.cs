using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ServerControl
{
    public class Test : IHttpModule
    {
        public void Dispose()
        {
            
        }

        public void Init(HttpApplication context)
        {
            context.BeginRequest += Context_BeginRequest;
        }

        private void Context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication app = sender as HttpApplication;
            if (app!=null)
            {
                app.Response.Write("Hello world");
            }
        }
    }
}