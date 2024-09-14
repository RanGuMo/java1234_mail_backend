package com.java1234.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.java1234.entity.SmallType;

import java.util.List;
import java.util.Map;


/**
 * 商品小类 Mapper 接口
 */
public interface SmallTypeMapper extends BaseMapper<SmallType> {

    List<SmallType> list(Map<String,Object> map);

    Long getTotal(Map<String,Object> map);

    SmallType findById(Integer id);

}
