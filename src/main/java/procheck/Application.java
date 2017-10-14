package procheck;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import procheck.common.CommonInterceptor;

//import procheck.service.TaskService;


@SpringBootApplication
@EnableScheduling
public class Application extends WebMvcConfigurerAdapter{
	
//	@Autowired
//	private TaskService taskService;
	
	@Autowired
	private CommonInterceptor commonInterceptor;
	
	@Override
		public void addInterceptors(InterceptorRegistry registry) {
			// TODO Auto-generated method stub
			super.addInterceptors(registry);
			registry.addInterceptor(commonInterceptor).addPathPatterns("/**");
		}
	
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);

	}

}
