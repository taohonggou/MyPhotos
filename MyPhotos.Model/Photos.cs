/**  版本信息模板在安装目录下，可自行修改。
* Photos.cs
*
* 功 能： N/A
* 类 名： Photos
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
	/// Photos:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class Photos
	{
		public Photos()
		{}
		#region Model
		private int _pid;
		private int _ptypeid;
		private string _ptitle;
		private string _purl;
		private string _pdes;
		private int? _pclicks=0;
		private DateTime? _ptime= DateTime.Now;
		private int? _pup=0;
		private int? _pdown=0;
		/// <summary>
		/// 
		/// </summary>
		public int PId
		{
			set{ _pid=value;}
			get{return _pid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int PTypeId
		{
			set{ _ptypeid=value;}
			get{return _ptypeid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PTitle
		{
			set{ _ptitle=value;}
			get{return _ptitle;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PUrl
		{
			set{ _purl=value;}
			get{return _purl;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string PDes
		{
			set{ _pdes=value;}
			get{return _pdes;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PClicks
		{
			set{ _pclicks=value;}
			get{return _pclicks;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? PTime
		{
			set{ _ptime=value;}
			get{return _ptime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PUp
		{
			set{ _pup=value;}
			get{return _pup;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PDown
		{
			set{ _pdown=value;}
			get{return _pdown;}
		}
		#endregion Model

	}
}

