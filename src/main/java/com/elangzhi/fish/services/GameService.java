package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Game;

import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
public interface GameService extends BaseService<Game> {

    List<Game> list();

    List<Game> listChild(Long parentId);
}
