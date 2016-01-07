package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.GameMapper;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.services.GameService;
import com.elangzhi.fish.services.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
@Service("gameService")
public class GameServiceImpl implements GameService {

    @Resource
    GameMapper gameMapper;

    @Resource
    RoomService roomService;

    @Override
    public Integer save(Game game) {
        return gameMapper.insertSelective(game);
    }

    @Override
    public Integer deleteById(Long id) {
        return gameMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Game findById(Long id) {
        return gameMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Game game) {
        return gameMapper.updateByPrimaryKey(game);
    }

    @Override
    public List<Game> list() {

        return gameMapper.list();
    }

    @Override
    public List<Game> listChild(Long parentId) {
        List<Game> child = gameMapper.listChild(parentId);

        for(Game game : child){
            game.setRoomList(roomService.list(game.getId()));
        }
        return child;
    }
}
