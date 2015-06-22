# SSDT
## Overview
This is an example of a simple web project that uses SSDT as it's database VCS

### Excercise #1

This excercise will have you solve the issue of missing [Person].[Person] data.

#### Description

The [Person].[Person] table doesn't have any data. Even though the _SeedData script exists

To Reproduce:
> - Deploy the database to your local server
> - Observe that there is no data in the [Person].[Person] table

#### Solution

The PostDeployment.sql script is not referencing the _SeedData/Person/Persons table

Add a reference to the post deployment script:

```SQL
:r _SeedData/dbo/AWBuildVersions.sql
:r _SeedData/Person/BusinessEntities.sql
:r _SeedData/Person/Persons.sql
```