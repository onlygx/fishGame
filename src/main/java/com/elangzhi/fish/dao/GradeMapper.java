package com.elangzhi.fish.dao;

import com.elangzhi.fish.model.Grade;

public interface GradeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Grade record);

    int insertSelective(Grade record);

    Grade selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);
}