using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl.Server
{
    public partial class _03Execute : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("=============start===================");
            Server.Execute("03Execute_over.aspx?wd=kd");
            Response.Write("=============end======================");
        }
    }
}