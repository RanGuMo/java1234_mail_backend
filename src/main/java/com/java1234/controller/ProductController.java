package com.java1234.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.java1234.entity.Product;
import com.java1234.entity.ProductSwiperImage;
import com.java1234.entity.R;
import com.java1234.service.IProductService;
import com.java1234.service.IProductSwiperImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品 Controller
 */
@RestController
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;

    @Autowired
    private IProductSwiperImageService productSwiperImageService;

    /**
     * 查询轮播商品
     * @return
     */
   @GetMapping("/findSwiper")
    public R findSwiper(){
       QueryWrapper<Product> wrapper = new QueryWrapper<>();
       wrapper.eq("isSwiper",true);
       wrapper.orderByAsc("swiperSort");
       List<Product> swiperProductList = productService.list(wrapper);
       HashMap<String, Object> data = new HashMap<>();
       data.put("message",swiperProductList);
       return R.ok(data);
   }

    /**
     * 查找热门 推荐商品 8个
     * @return
     */
    @GetMapping("/findHot")
    public R findHot(){
        Page<Product> page = new Page<>(0,8);
        QueryWrapper<Product> wrapper = new QueryWrapper<>();
        wrapper.eq("isHot",true)
                .orderByAsc("hotDateTime");
        Page<Product> productPage = productService.page(page, wrapper);
        List<Product> hotProductList = productPage.getRecords();
        HashMap<String, Object> data = new HashMap<>();
        data.put("message",hotProductList);
        return R.ok(data);
    }

    /**
     * 根据id查询商品信息
     * @param id
     * @return
     */
    @GetMapping("/detail")
    public R detail(Integer id){
        Product product = productService.getById(id);
        QueryWrapper<ProductSwiperImage> wrapper = new QueryWrapper<>();
        wrapper.eq("productId",product.getId())
                .orderByAsc("sort");
        List<ProductSwiperImage> productSwiperImageList =
                productSwiperImageService.list(wrapper);
        product.setProductSwiperImageList(productSwiperImageList);
        Map<String,Object> data= new HashMap<>();
        data.put("message",product);
        return R.ok(data);

    }

    /**
     * 商品搜索
     * @param q
     * @return
     */
    @GetMapping("/search")
    public R search(String q){
        List<Product> productList = productService.list(new
                QueryWrapper<Product>().like("name", q));
        Map<String,Object> map=new HashMap<>();
        map.put("productList",productList);
        return R.ok(map);
    }

}
