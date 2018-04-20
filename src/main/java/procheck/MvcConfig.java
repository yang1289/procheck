package procheck;


import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import org.springframework.web.servlet.config.annotation.*;

import procheck.common.CommonInterceptor;
import procheck.common.config.SiteConfig;

@Configuration
@EnableConfigurationProperties(SiteConfig.class)
@ComponentScan
public class MvcConfig extends WebSecurityConfigurerAdapter  implements WebMvcConfigurer {
	Logger log= LogManager.getLogger(MvcConfig.class);
	@Autowired
	private SiteConfig siteConfig;
	@Autowired
	private CommonInterceptor commonInterceptor;

	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("login");
		registry.addViewController("/").setViewName("index");
		
	}


	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		String imagePath="file:"+siteConfig.getImagePath();
		log.info("imagePath"+imagePath);
		registry.addResourceHandler("/images/**").addResourceLocations(imagePath);
		registry.addResourceHandler("/upload/**").addResourceLocations("file:"+siteConfig.getUploadPath()+siteConfig.getUploadName());
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		WebMvcConfigurer.super.addInterceptors(registry);
		registry.addInterceptor(commonInterceptor).addPathPatterns("/**").excludePathPatterns("/static/**");
	}
	
	
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/images/**").addResourceLocations("file:"+siteConfig.getImagePath());
//		//
//		 super.addResourceHandlers(registry);
//	}

}
