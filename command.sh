VAR_HOSTNAME=${Hostname}
VAR_PORT=${Port}
VAR_USERNAME=${Username}
VAR_PASSWORD=${Password}
VAR_SQLFILE=${Sqlfile}

/opt/mssql-tools/bin/sqlcmd -S $VAR_HOSTNAME -U $VAR_USERNAME -P $VAR_PASSWORD -i /sqlcmd/files/$VAR_SQLFILE
