using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NVelocity.App;
using NVelocity.Runtime;
using NVelocity;
using System.Web;
using System.IO;

namespace Common
{
    public class NVelocityHelper
    {
        private VelocityEngine velocityEngine = null;
        private VelocityContext vc = null;
        public NVelocityHelper(string templatePath, string key, object value)
        {
            //1.创建Velocity 引擎（VelocityEngine）并设置属性
            velocityEngine = new VelocityEngine();
            velocityEngine.AddProperty(RuntimeConstants.RESOURCE_LOADER, "file");           // Velocity加载类型
            velocityEngine.AddProperty(RuntimeConstants.FILE_RESOURCE_LOADER_PATH,          // Velocity加载文件路径
               HttpContext.Current.Request.MapPath("~/" + templatePath + "/"));
            velocityEngine.AddProperty(RuntimeConstants.INPUT_ENCODING, "utf-8");          // 输入编码格式设置
            velocityEngine.AddProperty(RuntimeConstants.OUTPUT_ENCODING, "utf-8");         // 输出编码格式设置
            velocityEngine.Init();
            //2.Velocity 上下文对象设置
            vc = new VelocityContext();
            vc.Put(key, value);
        }

        public NVelocityHelper(string key, object value)
        {
            //1.创建Velocity 引擎（VelocityEngine）并设置属性
            velocityEngine = new VelocityEngine();
            velocityEngine.AddProperty(RuntimeConstants.RESOURCE_LOADER, "file");           // Velocity加载类型
            velocityEngine.AddProperty(RuntimeConstants.FILE_RESOURCE_LOADER_PATH,          // Velocity加载文件路径
               HttpContext.Current.Server.MapPath("~/Templates/"));
            velocityEngine.AddProperty(RuntimeConstants.INPUT_ENCODING, "utf-8");          // 输入编码格式设置
            velocityEngine.AddProperty(RuntimeConstants.OUTPUT_ENCODING, "utf-8");         // 输出编码格式设置
            velocityEngine.Init();
            //2.Velocity 上下文对象设置
            vc = new VelocityContext();
            vc.Put(key, value);
        }

        public void Render(string templatFileName)
        {
            //3.创建模板
            Template template = velocityEngine.GetTemplate(templatFileName);

            //4.合并模板和上下文对象、输出
            StringWriter writer = new StringWriter();
            template.Merge(vc, writer);
            HttpContext.Current.Response.Write(writer.ToString());
            HttpContext.Current.Response.End();
        }

    }
}
