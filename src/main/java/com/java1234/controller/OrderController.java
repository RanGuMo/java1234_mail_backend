package com.java1234.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.java1234.entity.Order;
import com.java1234.entity.OrderDetail;
import com.java1234.entity.Product;
import com.java1234.entity.R;
import com.java1234.properties.WeixinpayProperties;
import com.java1234.service.IOrderDetailService;
import com.java1234.service.IOrderService;
import com.java1234.service.IProductService;
import com.java1234.util.*;
import io.jsonwebtoken.Claims;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.MessageDigest;
import java.util.*;

/**
 * 订单 Controller
 */
@RestController
@RequestMapping("/my/order")
public class OrderController {

    @Autowired
    private IOrderDetailService orderDetailService;

    @Autowired
    private IOrderService orderService;

    @Autowired
    private WeixinpayProperties weixinpayProperties;



    /**
     * 创建订单，并返回订单号
     * @return
     */
    @RequestMapping("/create")
    public R create(@RequestBody Order order, @RequestHeader(value="token")String token){
        System.out.println("token="+token);
        System.out.println("order="+order);
        //  1.通过前端传来的token，验证token是否过期，并获取openid
        Claims claims = JwtUtils.validateJWT(token).getClaims();
        if(claims!=null){
            System.out.println("openid="+claims.getId());
            order.setUserId(claims.getId()); //设置order中的用户id
        }
        order.setOrderNo("java"+ DateUtil.getCurrentDateStr());
        order.setCreateDate(new Date());
//        2.获取order 中商品
        OrderDetail[] goods = order.getGoods();
        orderService.save(order); //添加order到数据库
//        3.添加订单详情到数据库
        for (int i = 0; i < goods.length ; i++) {
             OrderDetail orderDetail =  goods[i];
             orderDetail.setMId(order.getId()); //必须先执行orderService.save(order);才有getId()
             orderDetailService.save(orderDetail);
        }
        HashMap<String, Object> map = new HashMap<>();
        map.put("orderNo",order.getOrderNo());
        return R.ok(map);
    }

    /**
     * 调用统一下单，预支付
     * @param orderNo
     * @return
     * @throws Exception
     */
    @RequestMapping("/preparePay")
    public R preparePay(@RequestBody String orderNo)throws Exception{
        System.out.println("orderNo="+orderNo);
        Order order = orderService.getOne(new QueryWrapper<Order>().eq("orderNo", orderNo));


        System.out.println("appid="+weixinpayProperties.getAppid());
        System.out.println("mch_id="+weixinpayProperties.getMch_id());
        System.out.println("nonce_str="+ StringUtil.getRandomString(32));

        System.out.println("body="+"java1234mall商品购买测试");
        System.out.println("out_trade_no="+orderNo);
        System.out.println("total_fee="+order.getTotalPrice().movePointRight(2));
        System.out.println("spbill_create_ip="+"127.0.0.1");
        System.out.println("notify_url="+weixinpayProperties.getNotify_url());
        System.out.println("trade_type="+"JSAPI");
        System.out.println("openid="+order.getUserId());
        System.out.println("sign=");

        Map<String,Object> map=new HashMap<>();
        map.put("appid",weixinpayProperties.getAppid());
        map.put("mch_id",weixinpayProperties.getMch_id());
        map.put("nonce_str",StringUtil.getRandomString(32));
        map.put("body","java1234mall商品购买测试");
        map.put("out_trade_no",orderNo);
//        map.put("total_fee",order.getTotalPrice().movePointRight(2));
        map.put("total_fee",1); // 支付为1分钱
        map.put("spbill_create_ip","127.0.0.1");
        map.put("notify_url",weixinpayProperties.getNotify_url());
        map.put("trade_type","JSAPI");
        map.put("openid",order.getUserId());
        map.put("sign",getSign(map));

        // 参数转成xml
        String xml = XmlUtil.genXml(map);
        System.out.println("xml="+xml);

        HttpResponse httpResponse = HttpClientUtil.sendXMLDataByPost(weixinpayProperties.getUrl().toString(), xml);
        String httpEntityContent = HttpClientUtil.getHttpEntityContent(httpResponse);
        System.out.println(httpEntityContent);

        Map resultMap = XmlUtil.doXMLParse(httpEntityContent);
        System.out.println("resultMap="+resultMap);


        if(resultMap.get("result_code").equals("SUCCESS")){
            Map<String,Object> payMap=new HashMap<>();
            payMap.put("appId",resultMap.get("appid"));
            payMap.put("timeStamp",System.currentTimeMillis()/1000+"");
            payMap.put("nonceStr",StringUtil.getRandomString(32));
            payMap.put("package","prepay_id="+resultMap.get("prepay_id"));
            payMap.put("signType","MD5");
            payMap.put("paySign",getSign(payMap));
            payMap.put("orderNo",orderNo);

            return R.ok(payMap);

        }else{
            return R.error(500,"系统报错，请联系管理员");
        }


    }

    /**
     * 微信支付签名算法sign
     */
    private String getSign(Map<String,Object> map) {
        StringBuffer sb = new StringBuffer();
        String[] keyArr = (String[]) map.keySet().toArray(new String[map.keySet().size()]);//获取map中的key转为array
        Arrays.sort(keyArr);//对array排序
        for (int i = 0, size = keyArr.length; i < size; ++i) {
            if ("sign".equals(keyArr[i])) {
                continue;
            }
            sb.append(keyArr[i] + "=" + map.get(keyArr[i]) + "&");
        }
        sb.append("key=" + weixinpayProperties.getKey());
        String sign = string2MD5(sb.toString());
        System.out.println("sign="+sign);
        return sign;
    }

    /***
     * MD5加码 生成32位md5码
     */
    private String string2MD5(String str){
        if (str == null || str.length() == 0) {
            return null;
        }
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f' };

        try {
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(str.getBytes("UTF-8"));

            byte[] md = mdTemp.digest();
            int j = md.length;
            char buf[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(buf).toUpperCase();
        } catch (Exception e) {
            return null;
        }
    }




    /**
     * 订单查询 type值 0 全部订单  1 待付款  2 待收货 3 退款/退货
     * @param type
     * @return
     */
//    @RequestMapping("/list")
//    public R list(Integer type){
//        System.out.println("type="+type);
//
//        List<Order> orderList=null;
//        Map<String,Object> resultMap=new HashMap<>();
//
//        if(type==0){ // 全部订单查询
//            orderList=orderService.list(new QueryWrapper<Order>().orderByDesc("id"));
//        }else{
//            orderList=orderService.list(new QueryWrapper<Order>().eq("status",type).orderByDesc("id"));
//        }
//
//        resultMap.put("orderList",orderList);
//        return R.ok(resultMap);
//    }

    /**
     * 订单查询 type值 0 全部订单 1待付款 2 待收货 3 退款/退货
     * @param type
     * @return
     */
    @RequestMapping("/list")
    public R list(Integer type,Integer page,Integer pageSize){
        System.out.println("type="+type);
        List<Order> orderList=null;
        Map<String,Object> resultMap=new HashMap<String,Object>();
        Page<Order> pageOrder=new Page<>(page,pageSize);
        if(type==0){ // 全部订单查询
// orderList=orderService.list(new QueryWrapper<Order>().orderByDesc("id"));
            Page<Order> orderResult = orderService.page(pageOrder, new
                    QueryWrapper<Order>().orderByDesc("id"));
//            System.out.println("总记录数："+orderResult.getTotal());
            System.out.println("总页数："+orderResult.getPages());
            System.out.println("当前页数据："+orderResult.getRecords());
            orderList=orderResult.getRecords();
            resultMap.put("total",orderResult.getTotal());
            resultMap.put("totalPage",orderResult.getPages());
        }else{
// orderList = orderService.list(new QueryWrapper<Order>().eq("status", type).orderByDesc("id"));
            Page<Order> orderResult = orderService.page(pageOrder, new
                    QueryWrapper<Order>().eq("status", type).orderByDesc("id"));
            System.out.println("总记录数："+orderResult.getTotal());
            System.out.println("总页数："+orderResult.getPages());
            System.out.println("当前页数据："+orderResult.getRecords());
            orderList=orderResult.getRecords();
            resultMap.put("total",orderResult.getTotal());
            resultMap.put("totalPage",orderResult.getPages());
        }
        resultMap.put("orderList",orderList);
        return R.ok(resultMap);
    }






}
