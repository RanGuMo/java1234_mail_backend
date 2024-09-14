package com.java1234.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.java1234.constant.SystemConstant;
import com.java1234.entity.R;
import com.java1234.entity.WxUserInfo;
import com.java1234.properties.WeixinProperties;
import com.java1234.service.IWxUserInfoService;
import com.java1234.util.HttpClientUtil;
import com.java1234.util.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.HashMap;

/**
 * 微信用户 Controller
 * @author java1234_小锋
 * @site www.java1234.com
 * @company 南通小锋网络科技有限公司
 * @create 2022-03-31 8:44
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private WeixinProperties weixinProperties;

    @Autowired
    private HttpClientUtil httpClientUtil;

    @Autowired
    private IWxUserInfoService wxUserInfoService;

    @RequestMapping("/wxlogin")
    public R wxLogin(@RequestBody WxUserInfo wxUserInfo){
        System.out.println("code="+wxUserInfo.getCode()); //前端传过来的code
//        通过调用微信提供的接口 jscode2session 获取 openId
//       1. 拼接要传递的参数
        String jscode2sessionUrl = weixinProperties.getJscode2sessionUrl()+"?appid="+weixinProperties.getAppid()+"&secret="+weixinProperties.getSecret()+"&js_code="+wxUserInfo.getCode()+"&grant_type=authorization_code";
        System.out.println(jscode2sessionUrl);
//       2.发送get 请求到微信后台 拿到一个对象，其中就有我们需要的openid
        String result = httpClientUtil.sendHttpGet(jscode2sessionUrl);
        System.out.println(result); //{"session_key":"Ljl8Lb5haWOb\/VKLIG7dyA==","openid":"oGJfu5Ja1cS9p17DZkLzE84EdZbg"}
//      3.利用fastjson 这个工具类的方法 将字符串转换为对象，再通过对象取出openid
        JSONObject jsonObject = JSON.parseObject(result);
        String openid = jsonObject.get("openid").toString();
        System.out.println(openid);
//      4.插入用户到数据库中
//      5.判断用户是否存在，不存在，插入，存在就更新
        QueryWrapper<WxUserInfo> wrapper = new QueryWrapper<>();
        wrapper.eq("openid",openid);
        WxUserInfo one = wxUserInfoService.getOne(wrapper);
        if(one==null){ //不存在，插入用户
            System.out.println("不存在，新增用户");
          wxUserInfo.setOpenid(openid); //openid
          wxUserInfo.setRegisterDate(new Date());//注册时间
          wxUserInfo.setLastLoginDate(new Date());//最后登录时间
          wxUserInfoService.save(wxUserInfo); //新增用户
        }else{
            System.out.println("存在，更新用户");
            one.setNickName(wxUserInfo.getNickName());//用户昵称
            one.setAvatarUrl(wxUserInfo.getAvatarUrl());//用户头像
            one.setLastLoginDate(new Date());//最后登录时间
            wxUserInfoService.updateById(one);//更新用户
        }
//       6. 利用jwt生成token 返回给前端
        String jwt = JwtUtils.createJWT(openid, wxUserInfo.getNickName(), SystemConstant.JWT_TTL);
        HashMap<String, Object> map = new HashMap<>();
        map.put("token",jwt);
        return R.ok(map);
    }
}
