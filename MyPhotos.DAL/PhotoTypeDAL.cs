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
   public  class PhotoTypeDAL
    {//TypeId, TypeName, TypeDes, TCover

        /// <summary>
        /// 查询所有的照片类型
        /// </summary>
        /// <returns>list集合</returns>
        public List<PhotoType> GetPhotoType()
        {
            string sql = "select * from PhotoType";
            DataTable dt = SQLHelper.ExecuteDataTable(sql);
            return DTToList(dt);
        }

        /// <summary>
        /// 将DataTable表转换为list集合
        /// </summary>
        /// <param name="dt">DataTable表</param>
        /// <returns>list集合</returns>
        private List<PhotoType> DTToList(DataTable dt)
        {
            List<PhotoType> list = new List<PhotoType>();
            foreach (DataRow dr in dt.Rows)
            {
                PhotoType pT = new PhotoType();
                pT.TypeId=Convert.ToInt32( dr["TypeId"]);
                pT.TypeName=dr["TypeName"].ToString();
                pT.TypeDes=dr["TypeDes"].ToString();
                pT.TCover = dr["TCover"].ToString();
                list.Add(pT);
            }
            return list;
        }

        /// <summary>
        /// 添加相册
        /// </summary>
        /// <param name="pType"></param>
        /// <returns></returns>
        public int AddPhotoType(PhotoType pType)
        {
            string sql = "insert into PhotoType (TypeName,TypeDes) values (@TypeName,@TypeDes)";
            SqlParameter[] param = {
                new SqlParameter("@TypeName",SqlDbType.NVarChar) {Value=pType.TypeName },
                new SqlParameter("@TypeDes",SqlDbType.NVarChar) {Value=pType.TypeDes }
            };
           return  SQLHelper.ExecuteNonQuery(sql, CommandType.Text, param);
        }

        /// <summary>
        /// 更新相册
        /// </summary>
        /// <param name="pType"></param>
        /// <returns></returns>
        public int UpdatePhotoType(PhotoType pType)
        {
            string sql = "update PhotoType set TypeName='"+ pType.TypeName + "', TypeDes='"+ pType.TypeDes + "' where TypeId="+pType.TypeId;
            //SqlParameter[] param = {
            //    new SqlParameter("@TypeName",SqlDbType.NVarChar){Value=pType.TypeName },
            //    new SqlParameter("@TypeDes",SqlDbType.NVarChar){Value=pType.TypeDes }
            //};
            return SQLHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 根据id获取相册信息  返回相册对象
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public PhotoType GetPTypeById(int id)
        {
            string sql = "select * from PhotoType where TypeId="+id;
            DataTable dt = SQLHelper.ExecuteDataTable(sql);
            List<PhotoType> list = DTToList(dt);
            return list[0];
        }
    }
}
