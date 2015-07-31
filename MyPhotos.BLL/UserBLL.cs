using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MyPhotos.Model;
using MyPhotos.DAL;

namespace MyPhotos.BLL
{
    public class UserBLL
    {
        UserDAL uD = new UserDAL();

        /// <summary>
        /// 判断用户名密码是否正确
        /// </summary>
        /// <param name="uName">用户名</param>
        /// <param name="pwd">密码</param>
        /// <param name="user">登陆成功后给用户返回的一个User对象</param>
        /// <returns></returns>
        public bool GetUserByUName(string uName,string pwd,out User user)
        {
            bool isSuccess = false;
            user = uD.GetUserByUName(uName);
            if (user!=null)
            {
                if (pwd == user.UPwd)
                {
                    isSuccess = true;
                }
            }
            return isSuccess;
        }
    }
}
