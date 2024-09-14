package com.java1234.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.java1234.entity.WxUserInfo;


/**
 * 微信用户 Mapper 接口
 */
public interface WxUserInfoMapper extends BaseMapper<WxUserInfo> {
    public WxUserInfo findByOpenId(String openId);
}
