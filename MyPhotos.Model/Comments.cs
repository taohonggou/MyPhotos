/**  版本信息模板在安装目录下，可自行修改。
* Comments.cs
*
* 功 能： N/A
* 类 名： Comments
*
* Ver    变更日期             负责人  变更内容
* ───────────────────────────────────
* V0.01  2014/4/10 11:48:14   N/A    初版
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
	/// Comments:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Comments
	{
		public Comments()
		{}
		#region Model
		private int _cid;
		private int _cphotoid;
		private string _cusername;
		private string _ctext;
		private DateTime? _ctime= DateTime.Now;
		private int? _cup=0;
		private int? _cdown=0;
		/// <summary>
		/// 
		/// </summary>
		public int CId
		{
			set{ _cid=value;}
			get{return _cid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int CPhotoId
		{
			set{ _cphotoid=value;}
			get{return _cphotoid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CUserName
		{
			set{ _cusername=value;}
			get{return _cusername;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string CText
		{
			set{ _ctext=value;}
			get{return _ctext;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? CTime
		{
			set{ _ctime=value;}
			get{return _ctime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? CUp
		{
			set{ _cup=value;}
			get{return _cup;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? CDown
		{
			set{ _cdown=value;}
			get{return _cdown;}
		}
		#endregion Model

	}
}

