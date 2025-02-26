package com.java1234.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.java1234.entity.Order;

import java.util.List;
import java.util.Map;


/**
 * 订单 Mapper 接口
 */
public interface OrderMapper extends BaseMapper<Order> {
    List<Order> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);
}
