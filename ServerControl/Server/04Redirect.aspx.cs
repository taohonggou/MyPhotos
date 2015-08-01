using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl.Server
{
    public partial class _04Redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("++++++++++++++++++++");
            Response.Redirect("04Redirect_over.aspx");
            Response.Write("=+++++++++++++");
        }
    }
}