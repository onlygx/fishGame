package com.elangzhi.fish.dao;

import com.elangzhi.fish.model.Person;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PersonMapper {
    int deleteByPrimaryKey(Long id);

    Long insert(Person record);

    Long insertSelective(Person record);

    Person selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);

    List<Person> list(@Param("roomId") Long roomId);

    /**
     * 获取比赛中所有用户的信息
     * @param gameId 比赛Id
     * @param changId 场次id
     * @return
     */
    List<Person> listByGameId(@Param("gameId")Long gameId,@Param("changId")Long changId);

    List<Person> listByGame(@Param("gameId")Long gameId);
}