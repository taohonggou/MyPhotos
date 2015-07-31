<%@ WebHandler Language="C#" Class="_01photoList" %>

using System;
using System.Web;
using System.Text;
using MyPhotos.Model;
using MyPhotos.BLL;
using System.Collections.Generic;

public class _01photoList : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/html";
        //获取模板页面的字符串
        string fullPath = context.Server.MapPath("_01photoList.html");
        string html = System.IO.File.ReadAllText(fullPath);
        //获取数据
        PhotoBLL photoBLL = new PhotoBLL();
        List<Photos> list= photoBLL.GetPhotos();
        //字符串拼接
        StringBuilder builder = new StringBuilder();
        builder.Append("<table id='tb'>");
        builder.Append("<tr><th>序号</th><th>标题</th><th>图片</th><th>点击次数</th><th>赞</th><th>反对</th><th>时间</th><th>操作</th></tr>");
        for (int i = 0; i < list.Count; i++)
        {
            Photos p = list[i] as Photos;
            builder.Append("<tr>");
            builder.Append("<td>" + (i + 1) + "</td>");
            builder.Append("<td>" + p.PTitle + "</td>");
            builder.Append("<td>" + p.PUrl + "</td>");
            builder.Append("<td>" + p.PClicks + "</td>");
            builder.Append("<td>" + p.PUp + "</td>");
            builder.Append("<td>" + p.PDown + "</td>");
            builder.Append("<td>" + p.PTime + "</td>");
            builder.Append("<td>编辑 删除</td>");
            builder.Append("</tr>");
        }
        builder.Append("</table>");
        //字符串替换
        html = html.Replace("@table", builder.ToString());
        //输出
        context.Response.Write(html);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}