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
    }
}
