using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPhotos.Model;
using MyPhotos.DAL;

namespace MyPhotos.BLL
{
    public class CommentsBLL
    {
        CommentsDAL comDAL = new CommentsDAL();

        /// <summary>
        /// 查看此照片下是否有评论
        /// </summary>
        /// <param name="CPhotoId">照片id</param>
        /// <returns>评论数量</returns>
        public int IsHasComment(int CPhotoId)
        {
            return comDAL.IsHasComment(CPhotoId);
        }

        /// <summary>
        /// 根据照片id获取照片的评论  返回评论集合
        /// </summary>
        /// <param name="pId"></param>
        /// <returns></returns>
        public List<Comments> GetCommentsByPId(int pId)
        {
            return comDAL.GetCommentsByPId(pId);
        }

        /// <summary>
        /// 给照片添加评论  
        /// </summary>
        /// <param name="comment"></param>
        /// <returns></returns>
        public int AddComment(Comments comment)
        {
            return comDAL.AddComment(comment);
        }
    }
}
