using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl
{
    public partial class _09ContentType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "image/gif";
            string path = Request.MapPath("~/85.gif");
            Response.WriteFile(path);
            Response.End();
        }
    }
}