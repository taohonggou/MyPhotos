using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl.Server
{
    public partial class _03Execute_over : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string wd = Request.QueryString["wd"];
            Response.Write("<br/>"+wd);
        }
    }
}