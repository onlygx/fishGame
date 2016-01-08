package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Person;

import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
public interface PersonService extends BaseService<Person> {

    List<Person> list(Long roomId);

    /**
     * 获取比赛中所有用户的信息
     * @param gameId 比赛Id
     * @param changId 场次id
     * @return
     */
    List<Person> listByGameId(Long gameId,Long changId);

    /**
     * 获取所有参赛人员
     * @param gameId
     * @return
     */
    List<Person> listByGame(Long gameId);
}
