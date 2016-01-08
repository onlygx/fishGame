package com.elangzhi.fish.controller.game;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.GradeService;
import com.elangzhi.fish.services.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by GaoXiang on 2016/1/8 0008.
 */

@Controller
@RequestMapping("/person")
public class PersonController {

    @RequestMapping("/{id}")
    public ModelAndView show(@PathVariable Long id, HttpServletRequest request, ModelMap model){

        model.put("obj",personService.findById(id));

        return new ModelAndView("person/person-show",model);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(Person person){
        Long id = 0l;
        try {
             id = personService.save(person);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip(String.valueOf(id));
    }

    @RequestMapping(value = "/updateAll", method = RequestMethod.POST)
    @ResponseBody
    public Tip updateAll(
            @RequestParam(value="persons", required=false) String persons,
            @RequestParam(value="rooms", required=false) String rooms
    ){
        String[] personArr = persons.split(",");
        String[] roomArr = rooms.split(",");
        int mod = 0;
        int res = 0;
        int indexRoomCount=0;
        try {
            mod = personArr.length % roomArr.length;
            res = personArr.length / roomArr.length;
            for(int i = 0 ; i < personArr.length;i++){
                if((i+1)%res==0){
                    indexRoomCount ++;
                    if((indexRoomCount+1 ) > roomArr.length){
                        indexRoomCount = 0;
                    }
                }
                Long pId = Long.parseLong(personArr[i]);
                Long rId = Long.parseLong(roomArr[indexRoomCount]);
                Person person = personService.findById(pId);
                person.setRoomId(rId);
                personService.updateById(person);
            }
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Tip delete(@RequestParam(value="id", required=false) Long id){

        try {
            personService.deleteById(id);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    //--------------------------

    @Resource
    GradeService gradeService;

    @Resource
    PersonService personService;
}
