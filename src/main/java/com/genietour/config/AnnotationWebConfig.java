package com.genietour.config;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

public class AnnotationWebConfig {

	public void onStartup(ServletContext servletContext) throws ServletException {
			
		//	<listener> 루트 컨텍스트 등록
		//	    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
		//	</listener>

		AnnotationConfigWebApplicationContext ac = new AnnotationConfigWebApplicationContext();
		ac.scan("classpath:META-INF/mybatis-context.xml",
				"classpath:META-INF/servlet-context.xml",
				"classpath:META-INF/tiles-context.xml",
				"classpath:META-INF/view-context.xml");
		
		ServletContextListener listener = new ContextLoaderListener(ac);
		servletContext.addListener(listener);

		//	  <context-param> 루트 컨텍스트 종류 변경 
		//	    <param-name>contextClass</param-name>
		//	    <param-value>org.springframework.web.context.support.AnnotationConfigWebApplicationContext</param-value>
		//	  </context-param>
		//	  <context-param> 다른 설정 파일도 추가
		//	    <param-name>contextConfigLocation</param-name>
		//	    <param-value>classpath:META-INF/*-context.xml</param-value>
		//	  </context-param>

		servletContext.setInitParameter("contextClass", "org.springframework.web.context.support.AnnotationConfigWebApplicationContext");
		servletContext.setInitParameter("contextConfigLocation", "classpath:META-INF/*-context.xml");

		//	위 코드와 아래 코드가 같음		
		//	AnnotationConfigWebApplicationContext ac = new AnnotationConfigWebApplicationContext();
		//	ac.scan("classpath:META-INF/*-context.xml");



		//	<servlet>
		//    <servlet-name>spring</servlet-name>
		//    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		//        <load-on-startup>1</load-on-startup>
		//    </servlet>

		//    <servlet-mapping>
		//        <servlet-name>spring</servlet-name>
		//        <url-pattern>/app/*</url-pattern>
		//    </servlet-mapping>

		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("spring", new DispatcherServlet());
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/app/*");

		// 다른 서블릿 컨텍스트를 쓰고 싶을 때
		//	AnnotationConfigWebApplicationContext sac = new AnnotationConfigWebApplicationContext();
		//	sac.register(WebConfig.class);
		//	ServletRegistration.Dynamic dispatcher = servletContext.addServlet("spring", new DispatcherServlet(sac));
		//	dispatcher.setLoadOnStartup(1);
		//	dispatcher.addMapping("/app/*");


		FilterRegistration.Dynamic filter = servletContext.addFilter("CHARACTER_ENCODING_FILTER", CharacterEncodingFilter.class);
		filter.setInitParameter("encoding", "UTF-8");
		filter.setInitParameter("forceEncoding", "true");
		filter.addMappingForUrlPatterns(null, false, "/*");

		
	}
}
