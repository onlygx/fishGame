package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Room;

import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
public interface RoomService extends BaseService<Room> {

    List<Room> list(Long gameId);
}
