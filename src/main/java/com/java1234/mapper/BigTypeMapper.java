package com.java1234.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.java1234.entity.BigType;


/**
 * 商品大类 Mapper 接口
 */
public interface BigTypeMapper extends BaseMapper<BigType> {
    public BigType findById(Integer id);
}
