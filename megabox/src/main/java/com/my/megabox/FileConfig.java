package com.my.megabox;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;


@Configuration
public class FileConfig {
	/*
	<beans:property name="maxUploadSize" value="52428800"/><!-- 50MB -->
	</beans:bean>
	servelt-context.xml ���� CommonsMultipartResolver ��ü ���� �� ���� ���ε� ������ ������ @Bean ��ü�� �Ʒ��� ���� ���� ����
	�޼ҵ��� �̸��� id, class�� ��ȯ ������, property�� setter
	 <beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
	*/
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver mr = new CommonsMultipartResolver();
		mr.setMaxUploadSize(52428800);//50MB
		mr.setDefaultEncoding("utf-8");
		return mr;
	}
}


