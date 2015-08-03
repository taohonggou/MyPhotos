using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyPhotos.BLL;
using MyPhotos.Model;
using System.Text;
using System.Web.Caching;

namespace PhotoDemo
{
    public partial class _10cache : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str = "";
            if (Cache["p"] == null)
            {
                //读取数据
                PhotoBLL pb = new PhotoBLL();
                List<Photos> list = pb.GetPhotos();
                StringBuilder sb = new StringBuilder();
                foreach (Photos item in list)
                {
                    //拼字符串
                    sb.Append(item.PTitle);
                }
                 str = sb.ToString();
                //依赖于文件的文件缓存
                //string path = Request.MapPath("~/cache/HtmlPage1.html");
                //CacheDependency cd = new CacheDependency(path);
                //Cache.Insert("p", str, cd);

                //依赖于数据库的缓存
                SqlCacheDependency scd = new SqlCacheDependency("p", "photos");
                Cache.Insert("p", str, scd);
                Response.Write("读取数据库");
            }
            else
            {
                str = Cache["p"].ToString();
                Response.Write("cache");
            }
            TimeSpan ts = DateTime.Now - Context.Timestamp;
            //查看时间
            Response.Write(ts.ToString());
            //显示
        }
    }
}