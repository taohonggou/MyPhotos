using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using MyPhotos.Model;
using Common;
namespace MyPhotos.DAL
{
    public  class CommentsDAL
    {//CId, CPhotoId, CUserName, CText, CTime, CUp, CDown

        /// <summary>
        /// 查看此照片下是否有评论
        /// </summary>
        /// <param name="CPhotoId">照片id</param>
        /// <returns>评论数量</returns>
        public int IsHasComment(int CPhotoId)
        {
            string sql = "select count(*) from Comments where CPhotoId=" + CPhotoId;
            object o = SQLHelper.ExecuteScalar(sql);
            if (o!=null)
            {
                return Convert.ToInt32(o);
            }
            else
            {
                return 0;
            }
        }

        /// <summary>
        /// 根据照片id获取照片的评论  返回评论集合
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public List<Comments> GetCommentsByPId(int pId)
        {
            string sql = "select * from Comments where CPhotoId=@CPhotoId order by CTime";
            DataTable dt = SQLHelper.ExecuteDataTable(sql, CommandType.Text, new SqlParameter("@CPhotoId", pId));
            return DTToList(dt);
        }

        private List<Comments> DTToList(DataTable dt)
        {
            List<Comments> list = new List<Comments>();
            foreach (DataRow  item in dt.Rows)
            {
                Comments comment = new Comments();
                comment.CDown = Convert.ToInt32(item["CDown"]);
                comment.CId = Convert.ToInt32(item["CId"]);
                comment.CPhotoId =Convert.ToInt32(item["CPhotoId"]);
                comment.CUp = Convert.ToInt32(item["CUp"]);
               
                comment.CText = item["CText"].ToString();
                comment.CUserName = item["CUserName"].ToString();
                comment.CTime = Convert.ToDateTime(item["CTime"]);
                list.Add(comment);
            }
            return list;
        }

        /// <summary>
        /// 给照片添加评论  
        /// </summary>
        /// <param name="comment"></param>
        /// <returns></returns>
        public int AddComment(Comments comment)
        {
            string sql = "insert into Comments (CPhotoId,CUserName,  CText, CTime, CUp, CDown) values (@CPhotoId, @CUserName, @CText, @CTime, @CUp, @CDown)";
            SqlParameter[] param = {
                new SqlParameter("@CPhotoId",SqlDbType.Int) { Value=comment.CPhotoId },
                new SqlParameter("@CUserName",SqlDbType.NVarChar) { Value=comment.CUserName },
                new SqlParameter ("@CText",SqlDbType.NVarChar) {Value=comment.CText },
                new SqlParameter("@CTime",DateTime.Now),
                new SqlParameter("@CUp",SqlDbType.Int) { Value=0 },
                new SqlParameter("@CDown",SqlDbType.Int) { Value=0 }
            };
            return SQLHelper.ExecuteNonQuery(sql, CommandType.Text, param);
        }
    }
}
