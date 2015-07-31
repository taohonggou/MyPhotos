using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox txt = Master.FindControl("txtTest") as TextBox;
            if (txt!=null)
            {
                txt.Text = "admin";
            }
        }
    }
}