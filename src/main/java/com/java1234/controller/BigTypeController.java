package com.java1234.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.java1234.entity.BigType;
import com.java1234.entity.Product;
import com.java1234.entity.R;
import com.java1234.entity.SmallType;
import com.java1234.service.IBigTypeService;
import com.java1234.service.IProductService;
import com.java1234.service.ISmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * 商品大类 Controller
 */
@RestController
@RequestMapping("/bigType")
public class BigTypeController {
    @Autowired
    private IBigTypeService bigTypeService;

    @Autowired
    private ISmallTypeService samllTypeService;

    @Autowired
    private IProductService productService;

    /**
     * 查询所有商品大类
     * @return
     */
   @GetMapping("/findAll")
    public R findAll(){
       List<BigType> list = bigTypeService.list();
       HashMap<String, Object> data = new HashMap<>();
       data.put("message",list);
       return R.ok(data);
   }

    /**
     * 获取所有菜单信息（即小程序的分类页面）
     * @return
     */
   @GetMapping("/findCategories")
   public R findCategories(){
       List<BigType> bigTypeList = bigTypeService.list();
       for(BigType bigType:bigTypeList){
           QueryWrapper<SmallType> wrapper = new QueryWrapper<>();
           wrapper.eq("bigTypeId",bigType.getId());
           List<SmallType> smallTypeList = samllTypeService.list(wrapper);
           bigType.setSmallTypeList(smallTypeList);
           for(SmallType smallType:smallTypeList){
               QueryWrapper<Product> wrapper2 = new QueryWrapper<>();
               wrapper2.eq("typeId",smallType.getId());
               List<Product> productList = productService.list(wrapper2);
               smallType.setProductList(productList);
           }
       }

       HashMap<String, Object> data = new HashMap<>();
       data.put("message",bigTypeList);
       return R.ok(data);
   }



}
