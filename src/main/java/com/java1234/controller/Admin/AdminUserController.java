package com.java1234.controller.Admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.java1234.entity.PageBean;
import com.java1234.entity.R;
import com.java1234.entity.WxUserInfo;
import com.java1234.service.IWxUserInfoService;
import com.java1234.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 后台管理-用户Controller控制器
 */
@RestController
@RequestMapping("/admin/user")
public class AdminUserController {

    @Autowired
    private IWxUserInfoService wxUserInfoService;
    /**
     * 根据条件分页查询用户信息
     * @param pageBean
     * @return
     */
    @RequestMapping("/list")
    public R list(@RequestBody PageBean pageBean){
//        System.out.println(pageBean);
//        1.获取到的查询 query参数去掉前后空格
        String query = pageBean.getQuery().trim();
//        2.创建page对象，指明白 当前页 以及 每页显示多少条数据
        Page<WxUserInfo> page = new Page<>(pageBean.getPageNum(),pageBean.getPageSize());
//        3.根据page，以及模糊条件去查询，查询前先判断查询条件是否为空
        Page<WxUserInfo> pageResult = wxUserInfoService.page(page, new QueryWrapper<WxUserInfo>().like(StringUtil.isNotEmpty(query), "nickName", query));
//        4.创建map，返回userList 以及 total
        Map<String,Object> map = new HashMap<>();
        map.put("userList",pageResult.getRecords());
        map.put("total",pageResult.getTotal());
        return R.ok(map);
    }
}
