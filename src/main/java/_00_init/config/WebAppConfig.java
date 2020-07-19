package _00_init.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan({"company", "_00_init"})
public class WebAppConfig implements WebMvcConfigurer {
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver ;
	}
	
//	@Bean
//	public CommonsMultipartResolver multipartResolver() {
//		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
//		resolver.setDefaultEncoding("UTF-8");
//		resolver.setMaxUploadSize(81920000);
//		return resolver ; 
//	}
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasenames("MemberMessage", "ValidationMessages");
		return messageSource;
	}
//	@Override      
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {          
////		registry.addResourceHandler("/css/").addResourceLocations("/WEB-INF/views/css/");          
////		registry.addResourceHandler("/js/").addResourceLocations("/WEB-INF/views/js/");         
////		registry.addResourceHandler("/img/").addResourceLocations("/WEB-INF/views/img/");         
//	//	registry.addResourceHandler("/dist/**").addResourceLocations("/WEB-INF/views/dist/");     }
}
