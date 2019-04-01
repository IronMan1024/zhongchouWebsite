grant exec on abcd.dbo.u_id to sa  --��¼�û�
USE zhongchouDB

--��ҳ�������
--drop procedure GetProjectPagedOrders
go
create procedure [dbo].[GetProjectPagedOrders]
@startIndex int, 
@endIndex int 
AS
with SProject as(                   --SProject ��һ����ʱ��
select row_number() over(order by [ProjectID]) as row,
[ProjectID],ProjectCover,UserID,UserEmail,ProjectType,ProjectName,ProjectTargetDays,ProjectOverview,
ProjectDetailedPictures,TargetAmountOfMoney,AlreadyRaisedMoney,NumberOfProjectSupport,ProjectAddress,ReleaseStatus,ProjectUpdateTime,ReleaseDate
from ProjectTb)
select [ProjectID],ProjectCover,UserID,UserEmail,ProjectType,ProjectName,ProjectTargetDays,ProjectOverview,
ProjectDetailedPictures,TargetAmountOfMoney,AlreadyRaisedMoney,NumberOfProjectSupport,ProjectAddress,ReleaseStatus,ProjectUpdateTime,ReleaseDate
from SProject
where row between @startIndex and @endIndex
return 0

go exec GetProjectPagedOrders 1,3

--��ҳ������� ��������
go
create procedure [dbo].[GetProjectOrderNumber]
AS
  select count(*) from UserInfoTb
RETURN 0


select top 10 * from ProjectTb
select ProjectID,ProjectCover,UserID,UserEmail,ProjectType,ProjectName,ProjectTargetDays,ProjectOverview,
ProjectDetailedPictures,TargetAmountOfMoney,AlreadyRaisedMoney,NumberOfProjectSupport,ProjectAddress,ReleaseStatus,ProjectUpdateTime,ReleaseDate
from ProjectTb where UserID='1001' or UserID=1002

select ImageID,ImageUrl,Pi.UserID,Pt.UserID,Pi.ProjectID,ProjectName,ProjectOverview,ProjectType,ProjectTargetDays,TargetAmountOfMoney,AlreadyRaisedMoney,NumberOfProjectSupport,ReleaseStatus,ReleaseDate 
from ProjectImageTb Pi,ProjectTb Pt where Pt.ProjectID=Pi.ProjectID and Pt.UserID=Pi.UserID
select * from ProjectTb
union all
select * from ProjectImageTb

insert into ProjectTb values('',1001,'123456789@qq.com','����','��ˮ��֮�ǡ� ��ٳǧ/��  ����53Ԫ',88,'��ѧ����','��ѧ�����ǵ�һ������',10000,5000,102,'�����人','������',getdate(),'2019-03-01 14:44:14')
insert into ProjectTb values('',1002,'2457284169@qq.com','����','��Ĩ�����ľ��˵�ɫ�����/�� ����49Ԫ',22,'��ѧ����','��ѧ�����ǵ�һ������',10000,500,102,'�й�����','������',getdate(),'2019-02-01 11:36:23')
insert into ProjectTb values('',1002,'2457284169@qq.com','����','��֪����˵1-������������̸¼�� -- �й�������NGO�Ĵ�ҵʷ',20,'��ѧ����','��ѧ�����ǵ�һ������',1000,200,102,'�����人','������',getdate(),getdate())
insert into ProjectTb values('',1001,'123456789@qq.com','����','���й��Ĵ���ϣ��������ڵĸ�ҥ��',50,'��ѧ����','��ѧ�����ǵ�һ������',45000,6600,102,'�㶫����','������',getdate(),'2019-02-018 12:33:45.607')

insert into ProjectTb values('',1001,'123456789@qq.com','����','ץס˼ά���㶨�﷨',88,'��ѧ����','��ѧ�����ǵ�һ������',11000,8000,102,'�㽭����','������',getdate(),'2019-03-01 14:44:14')
insert into ProjectTb values('',1002,'2457284169@qq.com','����','[ �ڳ��ƶ����ͬ��] ϣ�� ���� ���ֹ����ۺ����ǣ� �ڶ�����',22,'���ɫ�����˵�������','fvbgdxzgrghfdg',10000,500,1321,'�����人','������',getdate(),'2019-02-01 11:36:23')
insert into ProjectTb values('',1002,'2457284169@qq.com','����','���ڳ��ƶǣ��¤�ϡ��������������ػ��� �͸����˵������Ʒ',20,'����������̫��','��ѹ��',1000,200,422,'�����人','������',getdate(),getdate())
insert into ProjectTb values('',1001,'123456789@qq.com','����','���Ѱ�ӡ�ͨ������ʶ����������ʧ�ĺ������ջؼ�',20,'��������ͭ��','�и���',61000,42000,101,'�����Ƹ�','������',getdate(),'2019-02-018 12:33:45.607')




select ImageID,ImageUrl,Pi.UserID,Pt.UserID,Pi.ProjectID,ProjectName,ProjectOverview,ProjectType,ProjectTargetDays,TargetAmountOfMoney,AlreadyRaisedMoney,NumberOfProjectSupport,ReleaseStatus,ReleaseDate 
from ProjectImageTb Pi,ProjectTb Pt where Pt.ProjectID=Pi.ProjectID