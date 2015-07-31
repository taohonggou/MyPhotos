using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPhotos.BLL;
using MyPhotos.Model;

namespace ServerControl
{
    public partial class _01ddl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataTextField = "TypeName";
                DropDownList1.DataValueField = "TypeId";

                PhotoTypeBLL ptB = new PhotoTypeBLL();
                List<PhotoType> list = ptB.GetPhotoType();

                DropDownList1.DataSource = list;
                DropDownList1.DataBind();

                ListItem lt = new ListItem();
                lt.Text = "请选择";
                lt.Value = "-1";
                DropDownList1.Items.Insert(0, lt);
            }
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Context.Response.Write(DropDownList1.SelectedValue);
        }
    }
}