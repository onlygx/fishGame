package com.elangzhi.fish.controller.game;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.PersonService;
import com.elangzhi.fish.services.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by GaoXiang on 2016/1/8 0008.
 */
@Controller
@RequestMapping("/room")
public class RoomController {


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(Room room){
        try {
            roomService.save(room);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Tip delete(@RequestParam(value="id", required=false) Long id){

        try {
            roomService.deleteById(id);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }


    //------------------
    @Resource
    PersonService personService;

    @Resource
    RoomService roomService;
}
