package com.java1234.config;

import com.java1234.interceptor.SysInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * web项目配置类
 */
@Configuration
public class WebAppConfigurer implements WebMvcConfigurer {
//    跨域问题解决
@Override
public void addCorsMappings(CorsRegistry registry) {
    registry.addMapping("/**")
            .allowedOrigins("*")
            .allowCredentials(true)
            .allowedMethods("GET", "HEAD", "POST", "PUT",
                    "DELETE","OPTIONS")
            .maxAge(3600);
}



    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //例如：当访问localhost:8080/image/swiper/1.jpg
        // 就会转发到我本地的E:\01-黑马前端\04_java1234\微信小程序电商实战课程SpringBoot2+Vue3+Element plus\swiperImgs 的路径去寻找
        registry.addResourceHandler("/image/swiper/**")
                .addResourceLocations("file:E:\\01-黑马前端\\04_java1234\\01_微信小程序电商实战课程SpringBoot2+Vue3+Element plus\\swiperImgs\\");
        registry.addResourceHandler("/image/bigType/**")
                .addResourceLocations("file:E:\\01-黑马前端\\04_java1234\\01_微信小程序电商实战课程SpringBoot2+Vue3+Element plus\\bigTypeImgs\\");
        registry.addResourceHandler("/image/product/**")
                .addResourceLocations("file:E:\\01-黑马前端\\04_java1234\\01_微信小程序电商实战课程SpringBoot2+Vue3+Element plus\\productImgs\\");
        registry.addResourceHandler("/image/productSwiperImgs/**")
                .addResourceLocations("file:E:\\01-黑马前端\\04_java1234\\01_微信小程序电商实战课程SpringBoot2+Vue3+Element plus\\productSwiperImgs\\");

        registry.addResourceHandler("/image/productIntroImgs/**")
                .addResourceLocations("file:E:\\01-黑马前端\\04_java1234\\01_微信小程序电商实战课程SpringBoot2+Vue3+Element plus\\productIntroImgs\\");

        registry.addResourceHandler("/image/productParaImgs/**")
                .addResourceLocations("file:E:\\01-黑马前端\\04_java1234\\01_微信小程序电商实战课程SpringBoot2+Vue3+Element plus\\productParaImgs\\");

    }

    @Bean
    public SysInterceptor sysInterceptor(){
        return new SysInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] patterns=new String[]{"/adminLogin","/product/**","/bigType/**","/user/wxlogin","/weixinpay/**"};
        registry.addInterceptor(sysInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(patterns);
    }
}
