using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ServerControl
{
    public partial class _08Response : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //关闭输出缓冲
            //Response.Buffer = false;

            for (int i = 0; i < 8; i++)
            {

                Context.Response.Write(i + "<br/>");
                if (i==4)
                {
                    //Response.Flush();//输出缓冲中的内容
                    Response.Clear();
                    Response.End();
                }
                System.Threading.Thread.Sleep(1000);
            }


        }
    }
}