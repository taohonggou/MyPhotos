using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPhotos.BLL;
using MyPhotos.Model;

public partial class Page : System.Web.UI.Page
{
    protected Photos p = new Photos();
    protected void Page_Load(object sender, EventArgs e)
    {
        string sid = Request.QueryString["id"];
        int id;
        if (int.TryParse(sid, out id))
        {
            PhotoBLL pb = new PhotoBLL();
            p = pb.GetPhotoById(id);
        }
    }
}