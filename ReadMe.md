# SSDT
## Overview
This is an example of a simple web project that uses SSDT as it's database VCS

### Excercise #2

This excercise will have you solve a deployment post deploy ordering issue

#### Description

The database cannot be deployed without an error

To Reproduce:
> - Build AdventureWorks.sqlproj
> - Deploy AdventureWorks.sqlproj to your local database server
> - Observe the following error:
>
> The MERGE statement conflicted with the FOREIGN KEY constraint "FK_Person_BusinessEntity_BusinessEntityID". The conflict occurred in database "AdventureWorks", table "Person.BusinessEntity", column 'BusinessEntityID'.

#### Solution

The ordering in PostDeployment.sql has been switched. The BusinessEntities need to be inserted before the Persons.sql because of a foreign key reference

```SQL
:r _SeedData/dbo/AWBuildVersions.sql
:r _SeedData/Person/Persons.sql
:r _SeedData/Person/BusinessEntities.sql
```