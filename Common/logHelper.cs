using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.IO;

namespace Common
{
    public class logHelper
    {
        /// <summary>
        /// 记录错误日志
        /// </summary>
        /// <param name="msg">错误消息</param>
        public static void RecordLog(string msg)
        {
            string path=HttpContext.Current.Server.MapPath("~/Log/log.txt");
            using(FileStream fs=new FileStream(path,FileMode.Append))
            {
                using (StreamWriter sw=new StreamWriter(fs))
                {
                    sw.WriteLine("=======start=========");
                    sw.WriteLine(DateTime.Now);
                    sw.WriteLine(msg);
                    sw.WriteLine("=======end=========");
                }
            }
        }
    }
}
