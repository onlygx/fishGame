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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        model.put("obj",gameService.findById(id));
        model.put("rooms",roomService.list(id));
        model.put("persons",personService.listByGame(id));
        model.put("child",gameService.listChild(id));
        return new ModelAndView("game/game-show",model);
    }

    @RequestMapping("/grade/{id}")
    public ModelAndView showGrade(@PathVariable Long id,HttpServletRequest request, ModelMap model){
        model.put("obj",gameService.findById(id));
        model.put("persons",personService.listByGame(id));
        model.put("child",gameService.listChild(id));
        return new ModelAndView("game/game-grade",model);
    }

    @RequestMapping("/down")
    @ResponseBody
    public Map<String,Object> showJson(@RequestParam("id") Long id){
        Map<String,Object> back = new HashMap<>();
        back.put("obj",gameService.findById(id));
        back.put("persons",personService.listByGame(id));
        back.put("child",gameService.listChild(id));
        return back;
    }



    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(Game game,@RequestParam("time") String time){
        try {
            System.out.println(time);
            gameService.save(game);
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
