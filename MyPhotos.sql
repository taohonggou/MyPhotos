create database MyPhotos
go
use MyPhotos
go
create table PhotoType
(
	TypeId int identity(1,1) primary key,
	TypeName nvarchar(50) not null,
	TypeDes nvarchar(500),
	--相册封面
	--字符串  存路径
	TCover varchar(50)
)
go
create table Photos
(
	PId int identity(1,1) primary key,
	PTypeId int not null,
	PTitle nvarchar(100) not null,
	PUrl nvarchar(100) not null,
	PDes nvarchar(1000),		--描述
	PClicks int,			--点击次数
	PTime datetime,			--录入时间
	PUp int,			--支持
	PDown int			--反对
)
go

--评论
create table Comments
(
	CId int identity(1,1) primary key,
	CPhotoId int not null,		--照片的id
	CUserName nvarchar(50),		--
	CText nvarchar(1000),		--评论内容
	CTime datetime,			--评论时间
	CUp int,
	CDown int
)
go
create table [User]
(
	UId int identity(1,1) primary key,
	UName varchar(8),
	UPwd varchar(20)
)
go


go	
alter table Photos
add constraint DF_pClicks default(0) for pClicks
alter table Photos
add constraint DF_PUp default(0) for PUp
alter table Photos
add constraint DF_PDown default(0) for PDown

alter table Photos
add constraint DF_pTime default(getdate()) for pTime

alter table Comments
add constraint DF_cTime default(getdate()) for cTime
alter table Comments
add constraint DF_CUp default(0) for CUp
alter table Comments
add constraint DF_CDown default(0) for CDown

alter table Photos
add constraint FK_PTypeId
foreign key(PTypeId) references PhotoType(TypeId) 

alter table Comments
add constraint FK_CPhotoId
foreign key(CPhotoId) references Photos(PId) 

use MyPhotos
insert into phototype values('人物','人物','nopic.gif')
insert into phototype values('风景','风景','nopic.gif')
insert into phototype values('卡通','卡通','nopic.gif')
insert into phototype values('家庭','家庭','nopic.gif')
insert into phototype values('自拍','自拍','nopic.gif')

insert into [user] values('admin','admin')
insert into [user] values('zs','00000')
insert into [user] values('ls','00000')
insert into [user] values('ww','00000')

insert into photos(PTypeId,ptitle,purl,pdes) values(1,'图片1','01.jpg','图片one')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'图片2','02.jpg','图片two')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'图片3','03.jpg','图片three')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'图片4','04.jpg','图片four')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'图片5','05.jpg','图片five')
insert into photos(PTypeId,ptitle,purl,pdes) values(2,'图片6','06.jpg','图片six')
insert into photos(PTypeId,ptitle,purl,pdes) values(2,'图片7','07.jpg','图片seven')