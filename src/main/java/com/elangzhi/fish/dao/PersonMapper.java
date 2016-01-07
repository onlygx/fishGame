package com.elangzhi.fish.dao;

import com.elangzhi.fish.model.Person;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PersonMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Person record);

    int insertSelective(Person record);

    Person selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);

    List<Person> list(@Param("roomId") Long roomId);

    List<Person> listByGameId(@Param("gameId")Long gameId);
}