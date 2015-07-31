using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPhotos.Model;
using System.Data;
using System.Data.SqlClient;
using Common;

namespace MyPhotos.DAL
{
    public class PhotoDAL
    {//PId, PTypeId, PTitle, PUrl, PDes, PClicks, PTime, PUp, PDown

        /// <summary>
        /// 从数据库中获取photo信息
        /// </summary>
        /// <returns>photo集合</returns>
        public List<Photos> GetPhotos()
        {
            string sql = "select * from Photos order by PTime desc";
            DataTable dt = SQLHelper.ExecuteDataTable(sql, CommandType.Text);
            return DTToList(dt);
        }

        /// <summary>
        /// 将DataTable表转化为List集合
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        private List<Photos> DTToList(DataTable dt)
        {
            List<Photos> list = new List<Photos>();
            foreach (DataRow dr in dt.Rows)
            {
                Photos photo = new Photos();
                photo.PClicks = Convert.ToInt32(dr["PClicks"]);
                photo.PDes = dr["PDes"].ToString();
                photo.PDown = Convert.ToInt32(dr["PDown"]);
                photo.PId = Convert.ToInt32(dr["PId"]);
                photo.PTime = Convert.ToDateTime(dr["PTime"]);
                photo.PTitle = dr["PTitle"].ToString();
                photo.PTypeId =Convert.ToInt32( dr["PTypeId"]);
                photo.PUp = Convert.ToInt32(dr["PUp"]);
                photo.PUrl = dr["PUrl"].ToString();
                list.Add(photo);
            }
            return list;
        }

        /// <summary>
        /// 根据用户传入的数量，放回此数量的Photos集合
        /// </summary>
        /// <param name="count">数量</param>
        /// <returns>Photos集合</returns>
        public List<Photos> GetToPHotPhotos(int count)
        {
            string sql = "select top "+count+" * from Photos order by pUp desc";
            DataTable dt = SQLHelper.ExecuteDataTable(sql,CommandType.Text);
            return DTToList(dt);
        }

        /// <summary>
        /// 根据图片id返回图片信息
        /// </summary>
        /// <param name="id">图片id</param>
        /// <returns>图片信息</returns>
        public Photos GetPhotoById(int id)
        {
            string sql = "select * from Photos where PId="+id;
            DataTable dt = SQLHelper.ExecuteDataTable(sql, CommandType.Text);
            List<Photos> list = DTToList(dt);
            if (list.Count>0)
            {
                return list[0];
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 添加图片
        /// </summary>
        /// <param name="p">图片信息</param>
        /// <returns>受影响的行数</returns>
        public int AddPhoto(Photos p)
        {
            string sql = "insert into Photos (PTypeId, PTitle, PUrl, PDes) values (@PTypeId,@PTitle, @PUrl, @PDes)";
            SqlParameter[] param = { 
                                   new SqlParameter("@PTypeId",SqlDbType.Int){Value=p.PTypeId},
                                   new SqlParameter("@PTitle",SqlDbType.NVarChar){Value=p.PTitle},
                                   new SqlParameter("@PUrl",SqlDbType.NVarChar){Value=p.PUrl},
                                   new SqlParameter("@PDes",SqlDbType.NVarChar){Value=p.PDes}
                                   };
            return SQLHelper.ExecuteNonQuery(sql,CommandType.Text,param);
        }

        /// <summary>
        /// 根据图片id删除图片
        /// </summary>
        /// <param name="pId">图片id</param>
        /// <returns>受影响的行数</returns>
        public int DeletePhoto(int pId)
        {
            string sql = "delete from Photos where Pid="+pId;
            return SQLHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 更新图片
        /// </summary>
        /// <param name="p">图片信息</param>
        /// <returns>受影响的行数</returns>
        public int UpdatePhoto(Photos p)
        {
            string sql = "update photos set PTypeId=@PTypeId, PTitle=@PTitle, PUrl=@PUrl, PDes=@PDes where PId=" + p.PId;
            SqlParameter[] param ={
                                      new SqlParameter("@PTypeId",SqlDbType.Int){Value=p.PTypeId},
                                      new SqlParameter("@PTitle",SqlDbType.NVarChar){Value=p.PTitle},
                                      new SqlParameter("@PUrl",SqlDbType.NVarChar){Value=p.PUrl},
                                      new SqlParameter("@PDes",SqlDbType.NVarChar){Value=p.PDes}
                                 };
            return SQLHelper.ExecuteNonQuery(sql, CommandType.Text, param);
        }

        /// <summary>
        /// 执行分页的存储过程 返回每页的数据
        /// </summary>
        /// <param name="pageSize">每页容量</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageCount">页码总数</param>
        /// <returns></returns>
        public List<Photos> GetPagePhotos(int pageSize,int pageIndex,out int pageCount)
        {
            SqlParameter[] param = {
                                   new SqlParameter("@pageIndex",SqlDbType.Int){Value=pageIndex},
                                   new SqlParameter("@pageSize",SqlDbType.Int){Value=pageSize},
                                   new SqlParameter("@pageCount",SqlDbType.Int){Direction = ParameterDirection.Output}
                                   };
            DataTable dt= SQLHelper.ExecuteDataTable("usp_GetPagePhoto", CommandType.StoredProcedure, param);
            pageCount = Convert.ToInt32(param[2].Value);
            return DTToList(dt);
        }

        //PId, PTypeId, PTitle, PUrl, PDes, PClicks, PTime, PUp, PDown
        /// <summary>
        /// 执行点击up事件 返回1表示点击成功
        /// </summary>
        /// <param name="pId">图片id</param>
        /// <returns></returns>
        public int UpPhotos(int pId)
        {
            //string str ="select pup from photos where pid "+;
            string sql = "update Photos set PUp=PUp + 1 where pId="+pId;
            return SQLHelper.ExecuteNonQuery(sql,CommandType.Text);
        }

        /// <summary>
        /// 执行点击PDown事件 返回1表示点击成功
        /// </summary>
        /// <param name="pId">图片id</param>
        /// <returns></returns>
        public int DownPhotos(int pId)
        {
            string sql = "update Photos set PDown=PDown + 1 where pId=" + pId;
            return SQLHelper.ExecuteNonQuery(sql, CommandType.Text);
        }

        /// <summary>
        /// 查询图片总数  返回int
        /// </summary>
        /// <returns></returns>
        public int GetCount()
        {
            string sql = "select count(*) from Photos";
            return Convert.ToInt32(SQLHelper.ExecuteScalar(sql));
        }

        /// <summary>
        /// 查询第几页数据  
        /// </summary>
        /// <param name="startIndex">当前第一页数据的num-1</param>
        /// <param name="pageSize">每页几条数据</param>
        /// <returns></returns>
        public List<Photos> GetPaged(int startIndex,int pageSize)
        {
            string sql = "select * from ( select num=ROW_NUMBER() over (order by Pid), * from photos) as a where a.num between (@startIndex-1) and (@startIndex+@pageSize)";
            SqlParameter[] param ={
                                      new SqlParameter("@startIndex",DbType.Int32){Value=startIndex},
                                      new SqlParameter("@pageSize",DbType.Int32){Value=pageSize}
                                  };
            DataTable dt= SQLHelper.ExecuteDataTable(sql, CommandType.Text, param);
            return DTToList(dt);
        }
    }
}
