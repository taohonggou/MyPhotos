using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Common
{
    public class SQLHelper
    {
        private readonly static string conStr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

        /// <summary>
        /// 执行查询，返回一个DataTable
        /// </summary>
        /// <param name="text">sql语句或存储过程的字符串</param>
        /// <param name="ct">标识字符串是sql语句还是存储过程</param>
        /// <param name="param">sql参数</param>
        /// <returns>DataTable</returns>
        public static DataTable ExecuteDataTable(string text,CommandType ct=CommandType.Text,params SqlParameter[] param)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con=new SqlConnection(conStr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(text, con))
                {
                    sda.SelectCommand.CommandType = ct;
                    sda.SelectCommand.Parameters.AddRange(param);
                    sda.Fill(dt);
                    return dt;
                }
               
            }
        }

        /// <summary>
        /// 执行增删改
        /// </summary>
        /// <param name="text">sql语句或存储过程的字符串</param>
        /// <param name="ct">标识字符串是sql语句还是存储过程</param>
        /// <param name="param">sql参数</param>
        /// <returns>受影响的行数</returns>
        public static int ExecuteNonQuery(string text, CommandType ct = CommandType.Text, params SqlParameter[] param)
        {
            using (SqlConnection con=new SqlConnection(conStr))
            {
                using (SqlCommand cmd=new SqlCommand(text,con))
                {
                    cmd.CommandType = ct;
                    cmd.Parameters.AddRange(param);
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// 执行查询，返回首行首列
        /// </summary>
        /// <param name="text">sql语句或存储过程的字符串</param>
        /// <param name="ct">标识字符串是sql语句还是存储过程</param>
        /// <param name="param">sql参数</param>
        /// <returns>obj对象</returns>
        public static object ExecuteScalar(string text, CommandType ct = CommandType.Text, params SqlParameter[] param)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand(text, con))
                {
                    cmd.CommandType = ct;
                    cmd.Parameters.AddRange(param);
                    con.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }

        /// <summary>
        /// 一行一行的查询
        /// </summary>
        /// <param name="text">sql语句或存储过程的字符串</param>
        /// <param name="ct">标识字符串是sql语句还是存储过程</param>
        /// <param name="param">sql参数</param>
        /// <returns>SqlDataReader对象</returns>
        public static SqlDataReader ExecuteDataReader(string text, CommandType ct = CommandType.Text, params SqlParameter[] param)
        {
            SqlConnection con = new SqlConnection(conStr);
            using (SqlCommand cmd=new SqlCommand(text,con))
            {
                cmd.CommandType = ct;
                cmd.Parameters.AddRange(param);
                try
                {
                    con.Open();
                    return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                }
                catch (Exception ex)
                {
                    con.Close();
                    con.Dispose();
                    throw ex;
                }
            }
        }
    }
}
