using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Common
{
    public class WebCommon
    {
        public static void ReturnMstAndRedirect(string msg,string location)
        {
            HttpContext.Current.Response.Write("<script>alert('"+msg+"');location.href='"+location+"'</script>");
        }
    }
}
