package procheck;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import procheck.common.config.SiteConfig;

@Configuration
@EnableConfigurationProperties(SiteConfig.class)
@ComponentScan
public class MvcConfig extends WebMvcConfigurerAdapter{
	Logger log=Logger.getLogger(MvcConfig.class);
	@Autowired
	private SiteConfig siteConfig;
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("login");
		registry.addViewController("/").setViewName("index");
		
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		String imagePath="file:"+siteConfig.getImagePath();
		log.info("imagePath"+imagePath);
		registry.addResourceHandler("/images/**").addResourceLocations(imagePath);
		super.addResourceHandlers(registry);
	}

//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/images/**").addResourceLocations("file:"+siteConfig.getImagePath());
//		//
//		 super.addResourceHandlers(registry);
//	}

}
