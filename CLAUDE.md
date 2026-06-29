# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Project overview

`testing-claude-code` — minimal Spring Boot REST service (com.xeridia).

- **Framework:** Spring Boot 4.1.0 (parent POM), `spring-boot-starter-web`
- **Java:** 25
- **Build:** Maven (wrapper present in `.mvn/`)
- **Not yet under git version control.**

## Build & run

```bash
# Run the app (starts embedded Tomcat, default port 8080)
./mvnw spring-boot:run

# Package
./mvnw clean package

# Run tests
./mvnw test
```

On Windows PowerShell, use `.\mvnw.cmd` instead of `./mvnw` if the shell script isn't picked up.

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