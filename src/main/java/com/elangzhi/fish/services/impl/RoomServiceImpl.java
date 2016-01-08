package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.RoomMapper;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.PersonService;
import com.elangzhi.fish.services.RoomService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
@Service("roomService")
public class RoomServiceImpl implements RoomService {

    @Resource
    RoomMapper roomMapper;

    @Resource
    PersonService personService;

    @Override
    public Long save(Room room) {

        room.setId(UUIDFactory.getLongId());

        return roomMapper.insertSelective(room);
    }

    @Override
    public Integer deleteById(Long id) {
        return roomMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Room findById(Long id) {
        return roomMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Room room) {
        return roomMapper.updateByPrimaryKey(room);
    }

    @Override
    public List<Room> list(Long gameId) {
        List<Room> list = roomMapper.list(gameId);
        for(Room room : list){
            room.setPersonList(personService.list(room.getId()));
        }
        return list;
    }
}
