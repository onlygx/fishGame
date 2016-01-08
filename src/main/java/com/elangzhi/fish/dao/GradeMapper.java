package com.elangzhi.fish.dao;

import com.elangzhi.fish.model.Grade;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GradeMapper {
    int deleteByPrimaryKey(Long id);

    Long insert(Grade record);

    Long insertSelective(Grade record);

    Grade selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Grade record);

    int updateByPrimaryKey(Grade record);

    List<Grade> findByPGID(@Param("personId") Long personId, @Param("gameId")Long gameId);
}