package com.java1234.controller.Admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.java1234.constant.SystemConstant;
import com.java1234.entity.Admin;
import com.java1234.entity.R;
import com.java1234.service.IAdminService;
import com.java1234.util.JwtUtils;
import com.java1234.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 管理员 Controller
 */
@RestController
public class AdminController {

    @Autowired
    private IAdminService adminService;
    /*
       管理员登录
     */
    @PostMapping("/adminLogin")
    public R adminLogin(@RequestBody Admin admin){
        if(admin ==null){ return R.error();}
        if(StringUtil.isEmpty(admin.getUserName())){
            return R.error("用户名不能为空！");
        }
        if(StringUtil.isEmpty(admin.getPassword())){
            return R.error("密码不能为空！");
        }
//        先根据用户名去查询，比较安全一些
        QueryWrapper<Admin> wrapper = new QueryWrapper<Admin>().eq("userName", admin.getUserName());
        Admin resultAdmin = adminService.getOne(wrapper);
        if(resultAdmin == null){
            return R.error("用户名不存在");
        }
//        如果查到结果，再去和密码进行比较，如果不相等，给出提示错误
        if(!resultAdmin.getPassword().trim().equals(admin.getPassword())){
            return R.error("用户名或者密码错误！");
        }
//        都没有问题则生成token,返回token
        String token = JwtUtils.createJWT("-1", "admin", SystemConstant.JWT_TTL);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("token",token);
        return R.ok(resultMap);

    }


    /**
     * 修改密码
     * @param admin
     * @return
     */
    @PostMapping("/admin/modifyPassword")
    public R modifyPassword(@RequestBody Admin admin){
        if(StringUtil.isEmpty(admin.getUserName())){
            return R.error("用户名不能为空");
        }
        if(StringUtil.isEmpty(admin.getNewPassword())){
            return R.error("新密码不能为空");
        }
        UpdateWrapper<Admin> wrapper = new UpdateWrapper<Admin>().set("password", admin.getNewPassword()).eq("userName", admin.getUserName());
        adminService.update(wrapper);
        return R.ok();
    }



}
