using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl
{
    public partial class _02objectDataSource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.AppendDataBoundItems = true;
            ListItem lt = new ListItem();
            lt.Value = "-1";
            lt.Text = "请选择";
            DropDownList1.Items.Insert(0, lt);
        }
    }
}