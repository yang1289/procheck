package procheck;

//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


//import procheck.service.TaskService;


@SpringBootApplication
@EnableScheduling
public class Application{
	
//	@Autowired
//	private TaskService taskService;

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);

	}

}
