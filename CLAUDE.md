# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Project overview

`testing-claude-code` — minimal Spring Boot REST service (com.xeridia).

- **Framework:** Spring Boot 4.1.0 (parent POM), `spring-boot-starter-web`
- **Java:** 25
- **Build:** Maven (installation in `C:\entornos\apache-maven-3.9.9\bin\mvn` directory)
- **Not yet under git version control.**

## Build & run

In order to use Maven with Java 25, set the JAVA_HOME environment variable in the same command. Also add the required parameters 
to capture the output. For example:

```powershell
# Run the app (starts embedded Tomcat, default port 8080)
$env:JAVA_HOME = 'C:\Users\sergio.bajo\.jdks\openjdk-25; C:\entornos\apache-maven-3.9.9\bin\mvn.cmd spring-boot:run 2>&1 | Out-String

# Run tests
$env:JAVA_HOME = 'C:\Users\sergio.bajo\.jdks\openjdk-25; C:\entornos\apache-maven-3.9.9\bin\mvn.cmd test 2>&1 | Out-String
```

## Layout

```
src/main/java/com/xeridia/testingclacode/
├── Application.java                          # @SpringBootApplication entry point
└── controller/HolaMundoController.java       # GET /hola → "Hola mundo"
```

- Java base package: `com.xeridia.testingclacode`
- Source/resources directories follow Maven defaults; `src/main/resources` does not currently exist (no `application.properties`/`yml` yet — defaults are in effect).

## Conventions

- Controllers use `@RestController` with `@GetMapping` etc., returning plain strings/objects directly (no view layer).
- Keep the base package `com.xeridia.testingclacode`. New layers go in subpackages: `controller`, `service`, `repository`, `model`/`dto`, etc.
- Tests live under `src/test/java` mirroring the main package; `spring-boot-starter-test` (JUnit 5, MockMvc, etc.) is available.
- Uses Java 25 language features — do not introduce backports or older syntax unless required.