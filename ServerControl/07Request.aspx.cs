﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl
{
    public partial class _07Request : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Request.UserHostAddress); 
            //Response.Write(Request.UserAgent);
            Response.Write(Request.UrlReferrer);
        }
    }
}