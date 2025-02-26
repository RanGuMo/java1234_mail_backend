package com.java1234.interceptor;

import com.java1234.util.JwtUtils;
import com.java1234.util.StringUtil;
import io.jsonwebtoken.Claims;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author java1234_小锋
 * @site www.java1234.com
 * @company 南通小锋网络科技有限公司
 * @create 2022-04-06 9:14
 */
public class SysInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String path=request.getRequestURI();
        System.out.println("path="+path);
        if(handler instanceof HandlerMethod){
            // 判断token是否为空
            String token=request.getHeader("token");
            System.out.println("token="+token);
            if(StringUtil.isEmpty(token)){
                System.out.println("token为空！");
                throw new RuntimeException("签名验证不存在！");
            }else{
                // 如果token不为空
                Claims claims = JwtUtils.validateJWT(token).getClaims();
                // 管理员 是以 /admin开头路径请求
                if(path.startsWith("/admin")){
                    if(claims==null || !claims.getSubject().equals("admin") || !claims.getId().equals("-1")){
                        throw new RuntimeException("管理员 鉴权失败 ");
                    }else{
                        System.out.println("鉴权成功");
                        return true;
                    }
                }else{
                    if(claims==null){
                        System.out.println("鉴权失败");
                        throw new RuntimeException("鉴权失败！");
                    }else{
                        System.out.println("鉴权成功");
                        return true;
                    }
                }


            }
        }else{
            return true;
        }
    }
}
