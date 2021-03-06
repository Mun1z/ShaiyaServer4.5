/* Add server link, and Shaiya username */
IF NOT EXISTS (SELECT [name] FROM master.dbo.syslogins WHERE name = 'Shaiya')
BEGIN
	EXEC sp_addlogin 'Shaiya', 'Shaiya123', 'PS_GameDefs';
END	
EXEC sp_addsrvrolemember 'Shaiya', 'sysadmin';

TRUNCATE TABLE PS_UserData.dbo.Users_Master;
TRUNCATE TABLE PS_UserData.dbo.Users_Detail;
	
if exists(select * 
from master..sysservers 
where isremote=1 and srvname='game') 
begin
exec sp_dropserver 'game','droplogins'
end
exec sp_addlinkedserver 'game','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'game','false',null,'Shaiya','Shaiya123'

if exists(select * 
from master..sysservers 
where isremote=1 and srvname='PS_NCASH') 
begin
exec sp_dropserver 'PS_NCASH','droplogins'
end
exec sp_addlinkedserver 'PS_NCASH','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'PS_NCASH','false',null,'Shaiya','Shaiya123'

if exists(select * 
from master..sysservers 
where isremote=1 and srvname='PS_USERDB') 
begin
exec sp_dropserver 'PS_USERDB','droplogins'
end
exec sp_addlinkedserver 'PS_USERDB','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'PS_USERDB','false',null,'Shaiya','Shaiya123'

if exists(select * 
from master..sysservers 
where isremote=1 and srvname='PS_USERDB01') 
begin
exec sp_dropserver 'PS_USERDB01','droplogins'
end
exec sp_addlinkedserver 'PS_USERDB01','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'PS_USERDB01','false',null,'Shaiya','Shaiya123'

if exists(select * 
from master..sysservers 
where isremote=1 and srvname='PS_DEFINEDB') 
begin
exec sp_dropserver 'PS_DEFINEDB','droplogins'
end
exec sp_addlinkedserver 'PS_DEFINEDB','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'PS_DEFINEDB','false',null,'Shaiya','Shaiya123'

if exists(select * 
from master..sysservers 
where isremote=1 and srvname='PS_GAMEDB01') 
begin
exec sp_dropserver 'PS_GAMEDB01','droplogins'
end
exec sp_addlinkedserver 'PS_GAMEDB01','','SQLOLEDB','127.0.0.1'
exec sp_addlinkedsrvlogin 'PS_GAMEDB01','false',null,'Shaiya','Shaiya123'
	
/* Add to Game User: admin, Password: admin123 and user information*/

IF NOT EXISTS (SELECT UserUID FROM PS_UserData.dbo.Users_Master WHERE UserUID=1)
BEGIN
	INSERT INTO PS_UserData.dbo.Users_Master
	(UserUID, UserID, Pw, JoinDate, Admin, AdminLevel, UseQueue, Status, Leave, LeaveDate, UserType, UserIp, ModiIp, ModiDate, Enpassword, Point)
	VALUES (1,'admin', 'admin123', GETDATE(), 1, 255,'',16,'', DATEADD(year, +10, GETDATE()),'A',NULL,NULL,NULL,NULL,0);
END

IF NOT EXISTS (SELECT UserUID FROM PS_UserData.dbo.Users_Detail WHERE UserUID=1)
BEGIN
	INSERT INTO PS_UserData.dbo.Users_Detail
	(UserID,UserUID,UserName,SocialNo1,SocialNo2,PwQuestion,PwAnswer,Email,PostNo,Addr1,Addr2,Phone1,
	Phone2,Phone3,Mobile1,Mobile2,Mobile3,NewsLetter,Sms,AdultAuth,AdultAuthDate,EmailAuth,EmailAuthKey,
	Job,JobNo,LocalNo,PwQuNo)
	VALUES ('admin',1,'Light',NULL,NULL,'question','answer','email@somewhere',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0',
	'0',NULL,'0',NULL,NULL,NULL,NULL,NULL)
END