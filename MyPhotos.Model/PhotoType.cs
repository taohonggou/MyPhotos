/**  版本信息模板在安装目录下，可自行修改。
* PhotoType.cs
*
* 功 能： N/A
* 类 名： PhotoType
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2014/4/10 11:48:15   N/A    初版
*
* Copyright (c) 2012 Maticsoft Corporation. All rights reserved.
*┌──────────────────────────────────┐
*│　此技术信息为本公司机密信息，未经本公司书面同意禁止向第三方披露．　│
*│　版权所有：动软卓越（北京）科技有限公司　　　　　　　　　　　　　　│
*└──────────────────────────────────┘
*/
using System;
namespace MyPhotos.Model
{
	/// <summary>
	/// PhotoType:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class PhotoType
	{
		public PhotoType()
		{}
		#region Model
		private int _typeid;
		private string _typename;
		private string _typedes;
		private string _tcover;
		/// <summary>
		/// 
		/// </summary>
		public int TypeId
		{
			set{ _typeid=value;}
			get{return _typeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TypeName
		{
			set{ _typename=value;}
			get{return _typename;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TypeDes
		{
			set{ _typedes=value;}
			get{return _typedes;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string TCover
		{
			set{ _tcover=value;}
			get{return _tcover;}
		}
		#endregion Model

	}
}

