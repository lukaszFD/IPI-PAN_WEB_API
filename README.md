# Project

It is a project carried out at the postgraduate studies of the Polish Academy of Sciences in the field of: "Programming on the .NET platform". This system will be an interface of web communication with the repository of accounts storing information about : systems, servers and accesses. It will be a bridge between other systems and will only manage this information. 

#Update 08/04/2022

A REST API in Java Spring Boot was also created for this project. You can find it here [luc.SpringBoot](https://github.com/lukaszFD/luc.SpringBoot).

#Update 08/04/2022

I added a new folder "[GlobalRepository_db_bak](https://github.com/lukaszFD/IPI-PAN_WEB_API/GlobalRepository_db_bak)" where the backup db can be found. 

If you like the code or have any questions or suggestions then let me know at [Linkedin](https://www.linkedin.com/in/lukaszfd84/).

My questions about c# and others on [stackoverflow](https://stackoverflow.com/users/7038630/lukaszfd).

## Technical data and used technologies.

During the design and programming works I used the most popular tools provided by Microsoft.

1. Programming language : C# version 7.3
2. [Database model project in VS : Entity Framework Core 2.2](https://github.com/lukaszFD/IPI-PAN_WEB_API/tree/master/GlobalRepository/DB_ModelEFCore)
3. [Web Api project : .Net Core 2.2](https://github.com/lukaszFD/IPI-PAN_WEB_API/tree/master/GlobalRepository/GR_WebApi)
4. [Database design : SQL Server 2017](https://github.com/lukaszFD/IPI-PAN_WEB_API/tree/master/GlobalRepository/DB_GlobalRepository)

## Database project 

### Main tables of the repository

![GR_main](https://user-images.githubusercontent.com/25389541/69998016-b7e71680-1555-11ea-9038-1035076f456c.png)

### Audit tables

![gr_audit](https://user-images.githubusercontent.com/25389541/69998045-c6353280-1555-11ea-8f62-610612c36050.png)

### Reconciliation tables for web-based communication data

![GR_recon](https://user-images.githubusercontent.com/25389541/69998059-cd5c4080-1555-11ea-9cb5-ace9f4e0d98a.png)

