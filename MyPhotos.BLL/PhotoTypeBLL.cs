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
    }
}
