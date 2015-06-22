# SSDT
## Overview
This is an example of a simple web project that uses SSDT as it's database VCS

### Excercise #2

This excercise will have you solve a model issue with the [dbo].[AWBuildversion] table

#### Description

The [dbo].[AWBuildversion] _SeedData script is causing an error when I try to deploy

To Reproduce:
> - Build AdventureWorks.sqlproj
> - Deploy AdventureWorks.sqlproj to your local database server
> - Observe the following error:
>
> Table 'dbo.AWBuildVersion' does not have the identity property. Cannot perform SET operation.
> (17233,0): SQL72045: Script execution error.

#### Solution

Someone has checked in a change that took off the identity column on the [dbo].[AWBuildversion]. The _SeedData script attempts to set identity insert on, and causes an error when deploying, but, not building.

- Open the dbo/Tables/AWBuildVersion.sql
- Add the identity column back:
```SQL
CREATE TABLE [dbo].[AWBuildVersion] (
    [SystemInformationID] TINYINT       IDENTITY(1, 1) NOT NULL,
    [Database Version]    NVARCHAR (25) NOT NULL,
    [VersionDate]         DATETIME      NOT NULL,
    [ModifiedDate]        DATETIME      CONSTRAINT [DF_AWBuildVersion_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AWBuildVersion_SystemInformationID] PRIMARY KEY CLUSTERED ([SystemInformationID] ASC)
);
```