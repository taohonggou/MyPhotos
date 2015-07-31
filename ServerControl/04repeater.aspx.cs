using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPhotos.BLL;
using MyPhotos.Model;

namespace ServerControl
{
    public partial class _04repeater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPhotos();
            }
        }

        private void LoadPhotos()
        {
            PhotoBLL pb = new PhotoBLL();
            List<Photos> list = pb.GetPhotos();
            rpt.DataSource = list;
            rpt.DataBind();
        }

        /// <summary>
        /// 项绑定数据后触发
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType== ListItemType.Item|| e.Item.ItemType==ListItemType.AlternatingItem)
            {
                Label lab = e.Item.FindControl("lblClicks") as Label;
                int num = int.Parse(lab.Text);
                if (num>0)
                {
                    lab.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        //点击repeater中的按钮出发的事件
        protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //获取图片id
            int pId = Convert.ToInt32(e.CommandArgument);
            
            PhotoBLL pb = new PhotoBLL();

            switch (e.CommandName)
            {
                case "up":
                    pb.UpPhotos(pId);
                    break;
                case "down":
                    pb.DownPhotos(pId);
                    break;
                case "delete":
                    pb.DeletePhoto(pId);

                    break;

                default:
                    break;
            }
            LoadPhotos();//操作完成后需要重新绑定数据
        }
    }
}