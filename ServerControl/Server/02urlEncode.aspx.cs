using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl.Server
{
    public partial class _02urlEncode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //url编码
            string urlEcode = Server.UrlEncode("jiayou&happy");
            Response.Write("<a href='02urlEncode.aspx?wd="+urlEcode+"'>myself<a/>");
            //在QueryString内部进行url解码
            string wd = Request.QueryString["wd"];
            Response.Write("<br/>"+wd);

        }
    }
}