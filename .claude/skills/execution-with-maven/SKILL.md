---
name: Execution of Maven commands
description: This skill will provide information about how to execute commands with Maven
---

# Shell
Don't use Bash shell to execute Maven. Use Powershell instead.

# Setup
Before running any Maven command, configure the environment in PowerShell:
```powershell
$env:JAVA_HOME = 'C:\Users\sergio.bajo\.jdks\openjdk-25
$env:PATH = 'C:\entornos\apache-maven-3.9.9\bin;' + $env:PATH;
```

# Maven wrapper
There is no Maven wrapper in this project. Always use the direct Maven installation, located in 'C:\entornos\apache-maven-3.9.9' directory. For
instance:
```powershell
C:\entornos\apache-maven-3.9.9\bin\mvn test
```
