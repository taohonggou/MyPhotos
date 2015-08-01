using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl.Server
{
    public partial class _01htmlencode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string html = "感觉<font color='red'>学习</font>好<b>累</b>啊";
            Response.Write(html);

            Response.Write("<br/>");

            string encodeHtml = Server.HtmlEncode(html);
            Response.Write(encodeHtml);

            Response.Write("<br/>");
            Response.Write(Server.HtmlDecode(encodeHtml));
        }
    }
}