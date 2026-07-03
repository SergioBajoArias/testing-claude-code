---
name: Testing rest enpoints
description: This skill provides information about testing rest endpoints in Spring 4 framework.
---

When implementing Controller layer's tests, use the client RestTestClient. Here is an example of
use and configuration:

```
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@AutoConfigureRestTestClient
class HttpRequestTest {

	@LocalServerPort
	private int port;

	@Autowired
	private RestTestClient restTestClient;

	@Test
	void greetingShouldReturnDefaultMessage() {
		restTestClient.get()
				.uri("http://localhost:%d/".formatted(port))
				.exchange()
				.expectBody(String.class)
				.isEqualTo("Hello, World");
	}
}
```