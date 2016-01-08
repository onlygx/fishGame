package com.elangzhi.fish.model;

import java.util.Date;
import java.util.List;

public class Game {
    private Long id;

    private Long parentId;

    private Date time;

    private String name;

    private String intro;

    private String zhuban;

    private String chengban;


    //---------
    private String childCount;
    private String roomName;
    private List<Room> roomList;
    private List<Person> personList;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public List<Person> getPersonList() {
        return personList;
    }

    public void setPersonList(List<Person> personList) {
        this.personList = personList;
    }

    public List<Room> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<Room> roomList) {
        this.roomList = roomList;
    }

    public String getChildCount() {
        return childCount;
    }

    public void setChildCount(String childCount) {
        this.childCount = childCount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }

    public String getZhuban() {
        return zhuban;
    }

    public void setZhuban(String zhuban) {
        this.zhuban = zhuban == null ? null : zhuban.trim();
    }

    public String getChengban() {
        return chengban;
    }

    public void setChengban(String chengban) {
        this.chengban = chengban == null ? null : chengban.trim();
    }
}