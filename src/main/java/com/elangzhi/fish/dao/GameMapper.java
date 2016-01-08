package com.elangzhi.fish.dao;

import com.elangzhi.fish.model.Game;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GameMapper {
    int deleteByPrimaryKey(Long id);

    Long insert(Game record);

    Long insertSelective(Game record);

    Game selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Game record);

    int updateByPrimaryKey(Game record);

    List<Game> list();

    List<Game> listChild(@Param("gameId")Long gameId);
}