package com.elangzhi.fish.controller.game;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.GameService;
import com.elangzhi.fish.services.GradeService;
import com.elangzhi.fish.services.PersonService;
import com.elangzhi.fish.services.RoomService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
@Controller
@RequestMapping("/game")
public class GameController {

    @RequestMapping("/list")
    public ModelAndView showCall(HttpServletRequest request, ModelMap model){

        return new ModelAndView("game/game-list","list",gameService.list());
    }

    @RequestMapping("/{id}")
    public ModelAndView show(@PathVariable Long id,HttpServletRequest request, ModelMap model){

        List<Game> child = gameService.listChild(id);
        model.put("child",child);
        if(child != null && child.size() > 0){

        }

        return new ModelAndView("game/game-show",model);
    }

    @RequestMapping("/setting/{id}")
    public ModelAndView setting(@PathVariable Long id,HttpServletRequest request, ModelMap model){

        return new ModelAndView("game/game-setting",model);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(
            @RequestParam(value="name", required=false) String name,
            @RequestParam(value="intro", required=false) String intro
    ){
        Game game = new Game();
        try {


        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Tip delete(@RequestParam(value="id", required=false) Long id){

        try {
            gameService.deleteById(id);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }



    //-------- Service ---------

    @Resource
    GameService gameService;

    @Resource
    PersonService personService;

    @Resource
    RoomService roomService;

    @Resource
    GradeService gradeService;
}
