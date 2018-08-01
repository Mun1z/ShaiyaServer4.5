@ECHO OFF
ECHO.> temp.sql

ECHO RESTORE DATABASE PS_Billing FROM DISK = '%~dpf1\PS_Billing' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_Billing_Data' TO '%~dp0\..\..\DATABASE\PS_Billing.mdf',>> temp.sql
ECHO MOVE 'PS_Billing_Log' TO '%~dp0\..\..\DATABASE\PS_Billing.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_ChatLog FROM DISK = '%~dpf1\PS_ChatLog' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_ChatLog_Data' TO '%~dp0\..\..\DATABASE\PS_ChatLog.mdf',>> temp.sql
ECHO MOVE 'PS_ChatLog_Log' TO '%~dp0\..\..\DATABASE\PS_ChatLog.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GameData FROM DISK = '%~dpf1\PS_GameData' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GameData_Data' TO '%~dp0\..\..\DATABASE\PS_GameData.mdf',>> temp.sql
ECHO MOVE 'PS_GameData_Log' TO '%~dp0\..\..\DATABASE\PS_GameData.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GameDefs FROM DISK = '%~dpf1\PS_GameDefs' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GameDefs_Dat' TO '%~dp0\..\..\DATABASE\PS_GameDefs.mdf',>> temp.sql
ECHO MOVE 'PS_GameDefs_Log' TO '%~dp0\..\..\DATABASE\PS_GameDefs.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GameLog FROM DISK = '%~dpf1\PS_GameLog' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GameLog_Data' TO '%~dp0\..\..\DATABASE\PS_GameLog.mdf',>> temp.sql
ECHO MOVE 'PS_GameLog_Log' TO '%~dp0\..\..\DATABASE\PS_GameLog.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_GMTool FROM DISK = '%~dpf1\PS_GMTool' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_GMTool_Data' TO '%~dp0\..\..\DATABASE\PS_GMTool.mdf',>> temp.sql
ECHO MOVE 'PS_GMTool_Log' TO '%~dp0\..\..\DATABASE\PS_GMTool.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_StatData FROM DISK = '%~dpf1\PS_StatData' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_StatData_Data' TO '%~dp0\..\..\DATABASE\PS_StatData.mdf',>> temp.sql
ECHO MOVE 'PS_StatData_Log' TO '%~dp0\..\..\DATABASE\PS_StatData.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_STATICS FROM DISK = '%~dpf1\PS_STATICS' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_STATICS_Data' TO '%~dp0\..\..\DATABASE\PS_STATICS.mdf',>> temp.sql
ECHO MOVE 'PS_STATICS_Log' TO '%~dp0\..\..\DATABASE\PS_STATICS.ldf';>> temp.sql

ECHO RESTORE DATABASE PS_UserData FROM DISK = '%~dpf1\PS_UserData' WITH REPLACE,>> temp.sql
ECHO MOVE 'PS_UserData_Data' TO '%~dp0\..\..\DATABASE\PS_UserData.mdf',>> temp.sql
ECHO MOVE 'PS_UserData_Log' TO '%~dp0\..\..\DATABASE\PS_UserData.ldf';>> temp.sql

CLS
osql -E -i temp.sql
DEL temp.sql
PAUSE
@exit