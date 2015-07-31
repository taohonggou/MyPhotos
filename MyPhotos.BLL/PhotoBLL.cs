using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPhotos.Model;
using MyPhotos.DAL;

namespace MyPhotos.BLL
{
    public class PhotoBLL
    {
        PhotoDAL photoDAl = new PhotoDAL();

        /// <summary>
        /// 从数据库中获取photo信息
        /// </summary>
        /// <returns>photo集合</returns>
        public List<Photos> GetPhotos()
        {
            return photoDAl.GetPhotos();
        }

        /// <summary>
        /// 根据用户传入的数量，放回此数量的Photos集合
        /// </summary>
        /// <param name="count">数量</param>
        /// <returns>Photos集合</returns>
        public List<Photos> GetToPHotPhotos(int count)
        {
            return photoDAl.GetToPHotPhotos(count);
        }

        /// <summary>
        /// 根据图片id返回图片信息
        /// </summary>
        /// <param name="id">图片id</param>
        /// <returns>图片信息</returns>
        public Photos GetPhotoById(int id)
        {
            return photoDAl.GetPhotoById(id);
        }

        /// <summary>
        /// 添加图片
        /// </summary>
        /// <param name="p">图片信息</param>
        /// <returns>受影响的行数</returns>
        public int AddPhoto(Photos p)
        {
            return photoDAl.AddPhoto(p);
        }

        public int DeletePhoto(Photos p)
        {
            return DeletePhoto(p.PId);
        }

        /// <summary>
        /// 根据图片id删除图片  1删除成功  2失败   3有评论
        /// </summary>
        /// <param name="pId">图片id</param>
        /// <returns></returns>
        public int DeletePhoto(int pId)
        {//查看又没哟评论
            CommentsBLL comB = new CommentsBLL();
            int count = comB.IsHasComment(pId);
            if (count>0)
            {//有评论
                return 3;
            }
            else
            {//没有评论
                if (photoDAl.DeletePhoto(pId)==1)
                {
                    return 1;
                }
                else
                {
                    return 2;
                }
            }
        }

        /// <summary>
        /// 更新图片
        /// </summary>
        /// <param name="p">图片信息</param>
        /// <returns>受影响的行数</returns>
        public int UpdatePhoto(Photos p)
        {
            return photoDAl.UpdatePhoto(p);
        }

        /// <summary>
        /// 执行分页的存储过程 返回每页的数据
        /// </summary>
        /// <param name="pageSize">每页容量</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageCount">页码总数</param>
        /// <returns></returns>
        public List<Photos> GetPagePhotos(int pageSize, int pageIndex, out int pageCount)
        {
            return photoDAl.GetPagePhotos(pageSize, pageIndex, out pageCount);
        }

        /// <summary>
        /// 添加跟修改照片 
        /// </summary>
        /// <param name="action">add添加   edit修改</param>
        /// <param name="p">照片对象</param>
        /// <returns></returns>
        public bool Save(string action,Photos p)
        {
            bool r = false;
            if (action=="add")
            {
                r = AddPhoto(p) > 0 ? true : false;
            }
            else if (action=="edit")
            {
                r = UpdatePhoto(p) > 0 ? true : false;
            }
            return r;
        }

        /// <summary>
        /// 执行点击up事件 返回1表示点击成功 0失败
        /// </summary>
        /// <param name="pId">图片id</param>
        /// <returns></returns>
        public int UpPhotos(int pId)
        {
            return  photoDAl.UpPhotos(pId);
        }

        /// <summary>
        /// 执行点击PDown事件 返回1表示点击成功
        /// </summary>
        /// <param name="pId">图片id</param>
        /// <returns></returns>
        public int DownPhotos(int pId)
        {
            return photoDAl.DownPhotos(pId);
        }

        /// <summary>
        /// 查询图片总数  返回int
        /// </summary>
        /// <returns></returns>
        public int GetCount()
        {
            return photoDAl.GetCount();
        }

         /// <summary>
        /// 查询第几页数据  
        /// </summary>
        /// <param name="startIndex">当前第一页数据的num-1</param>
        /// <param name="pageSize">每页几条数据</param>
        /// <returns></returns>
        public List<Photos> GetPaged(int startIndex,int pageSize)
        {
            return photoDAl.GetPaged(startIndex, pageSize);
        }
    }
}
