using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPhotos.Model;
using MyPhotos.DAL;

namespace MyPhotos.BLL
{
    public class PhotoTypeBLL
    {
        PhotoTypeDAL pTDAL = new PhotoTypeDAL();

        /// <summary>
        /// 加载图片类型，相册
        /// </summary>
        /// <returns>list集合</returns>
        public List<PhotoType> GetPhotoType()
        {
            return pTDAL.GetPhotoType();
        }

        /// <summary>
        /// 添加相册
        /// </summary>
        /// <param name="pType"></param>
        /// <returns></returns>
        public bool AddPhotoType(PhotoType pType)
        {
            return pTDAL.AddPhotoType(pType) > 0 ? true : false;
        }

        /// <summary>
        /// 更新相册
        /// </summary>
        /// <param name="pType"></param>
        /// <returns></returns>
        public bool UpdatePhotoType(PhotoType pType)
        {
            return pTDAL.UpdatePhotoType(pType) > 0 ? true : false;
        }

        /// <summary>
        /// 根据id获取相册信息  返回相册对象
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public PhotoType GetPTypeById(int id)
        {
            return pTDAL.GetPTypeById(id);
        }
    }
}
