package com.genietour.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;



/**
 * @author Tae
 *	web.xml 대체용 설정파일
 */
public class WebXml implements WebApplicationInitializer {
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		// root, listener
		XmlWebApplicationContext rootContext = new XmlWebApplicationContext();
		rootContext.setConfigLocation("classpath:META-INF/*-context.xml");		//servletContext.setInitParameter("contextConfigLocation", "classpath:META-INF/*-context.xml");
		ServletContextListener listener = new ContextLoaderListener(rootContext);
		servletContext.addListener(listener);
		
		//servlet, mapping
		XmlWebApplicationContext appServletContext = new XmlWebApplicationContext();
		appServletContext.setConfigLocation("/WEB-INF/spring/appServlet/*-context.xml");
		DispatcherServlet dp =  new DispatcherServlet(appServletContext);
		dp.setThrowExceptionIfNoHandlerFound(true);	// 404 에러코드 연결용
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("appServlet", dp);
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		
		// filter
		FilterRegistration.Dynamic filter = servletContext.addFilter("CHARACTER_ENCODING_FILTER", CharacterEncodingFilter.class);
		filter.setInitParameter("encoding", "UTF-8");
		filter.setInitParameter("forceEncoding", "true");
		filter.addMappingForUrlPatterns(null, false, "/*");
		
		
	}
}
