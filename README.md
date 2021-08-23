# docker-mssql-sqlcmd
Docker Image SQLCMD command
## Parameters
- Hostname = MSSQL server host name  
- Port = SQL server port number   
- Username = Database username  
- Password = Database password
- SQLFile = SQL Source file

## Example

docker run --network=net_default -v ./sql:/sqlcmd/files -e Hostname=sql-server-db -e Username=sa -e Password=sapassword -e Sqlfile=run.sql
