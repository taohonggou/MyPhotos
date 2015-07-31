using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Common;
using MyPhotos.Model;
namespace MyPhotos.DAL
{
   public  class UserDAL
    {//UId, UName, UPwd

       /// <summary>
       /// 根据用户名查找用户信息   返回一个User对象
       /// </summary>
       /// <param name="uName"></param>
       /// <returns></returns>
       public User GetUserByUName(string uName)
       {
           string sql = "select * from [User] where UName=@UName";
           SqlParameter param = new SqlParameter("@UName", SqlDbType.VarChar) { Value = uName };
           DataTable dt = SQLHelper.ExecuteDataTable(sql, CommandType.Text, param);
          List<User> list= DTToList(dt);
          if (list.Count!=0)
          {
              return list[0];
          }
          else
          {
              return null;
          }
       }

       /// <summary>
       /// 关系转对象
       /// </summary>
       /// <param name="dt"></param>
       /// <returns></returns>
       private List<User> DTToList(DataTable dt)
       {
           List<User> list = new List<User>();
           foreach (DataRow dr in dt.Rows)
           {
               User u = new User();
               u.UId = Convert.ToInt32(dr["UId"]);
               u.UName = dr["UName"].ToString();
               u.UPwd = dr["UPwd"].ToString();
               list.Add(u);
           }
           return list;
       }
    }
}
