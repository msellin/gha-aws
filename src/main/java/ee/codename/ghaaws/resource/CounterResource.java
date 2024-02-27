package ee.codename.ghaaws.resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CounterResource {

	private static Long count = 1L;

	@GetMapping("/counter")
	public String count() {
		return "count:" + count++;
	}
}
