package com.elangzhi.fish.controller.game;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Grade;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.services.GradeService;
import com.elangzhi.fish.services.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/8 0008
 **/
@Controller
@RequestMapping("/grade")
public class GradeController {





    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(Grade grade){
        Long id = 0l;
        try {
            List<Grade> grades = gradeService.findByPGID(grade.getPersonId(),grade.getGameId());
            if(grades != null && grades.size() > 0){
                Grade g = grades.get(0);
                g.setNumber(grade.getNumber());
                g.setWeight(grade.getWeight());
                gradeService.updateById(g);
                id = g.getId();
            }else{
                id = gradeService.save(grade);
            }

        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip(String.valueOf(id));
    }




    //------------------

    @Resource
    GradeService gradeService;

    @Resource
    PersonService personService;
}
