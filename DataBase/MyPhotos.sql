create database MyPhotos
go
use MyPhotos
go
create table PhotoType
(
	TypeId int identity(1,1) primary key,
	TypeName nvarchar(50) not null,
	TypeDes nvarchar(500),
	--������
	--�ַ���  ��·��
	TCover varchar(50)
)
go
create table Photos
(
	PId int identity(1,1) primary key,
	PTypeId int not null,
	PTitle nvarchar(100) not null,
	PUrl nvarchar(100) not null,
	PDes nvarchar(1000),		--����
	PClicks int,			--�������
	PTime datetime,			--¼��ʱ��
	PUp int,			--֧��
	PDown int			--����
)
go

--����
create table Comments
(
	CId int identity(1,1) primary key,
	CPhotoId int not null,		--��Ƭ��id
	CUserName nvarchar(50),		--
	CText nvarchar(1000),		--��������
	CTime datetime,			--����ʱ��
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
insert into phototype values('����','����','nopic.gif')
insert into phototype values('�羰','�羰','nopic.gif')
insert into phototype values('��ͨ','��ͨ','nopic.gif')
insert into phototype values('��ͥ','��ͥ','nopic.gif')
insert into phototype values('����','����','nopic.gif')

insert into [user] values('admin','admin')
insert into [user] values('zs','00000')
insert into [user] values('ls','00000')
insert into [user] values('ww','00000')

insert into photos(PTypeId,ptitle,purl,pdes) values(1,'ͼƬ1','01.jpg','ͼƬone')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'ͼƬ2','02.jpg','ͼƬtwo')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'ͼƬ3','03.jpg','ͼƬthree')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'ͼƬ4','04.jpg','ͼƬfour')
insert into photos(PTypeId,ptitle,purl,pdes) values(1,'ͼƬ5','05.jpg','ͼƬfive')
insert into photos(PTypeId,ptitle,purl,pdes) values(2,'ͼƬ6','06.jpg','ͼƬsix')
insert into photos(PTypeId,ptitle,purl,pdes) values(2,'ͼƬ7','07.jpg','ͼƬseven')