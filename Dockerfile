ARG Hostname
ARG Port
ARG Username
ARG Password
ARG SQLFile

FROM mcr.microsoft.com/dotnet/runtime:3.1
RUN apt-get update
RUN apt-get install -y gnupg2
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install  -y mssql-tools unixodbc-dev
RUN echo PATH="$PATH:/opt/mssql-tools/bin" >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN apt -y autoremove --purge
RUN apt -y clean
RUN mkdir -p /sqlcmd/files
WORKDIR /sqlcmd
COPY command.sh /sqlcmd/command.sh
RUN chmod +x /sqlcmd/command.sh
ENTRYPOINT ["/bin/bash","/sqlcmd/command.sh"]
