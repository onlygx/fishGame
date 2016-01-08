package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.PersonMapper;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.services.GradeService;
import com.elangzhi.fish.services.PersonService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */

@Service("personService")
public class PersonServiceImpl implements PersonService {

    @Resource
    PersonMapper personMapper;

    @Resource
    GradeService gradeService;

    @Override
    public Long save(Person person) {
        person.setId(UUIDFactory.getLongId());
        personMapper.insertSelective(person);
        return person.getId();
    }

    @Override
    public Integer deleteById(Long id) {
        return personMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Person findById(Long id) {
        return personMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Person person) {
        return personMapper.updateByPrimaryKey(person);
    }

    @Override
    public List<Person> list(Long roomId) {

        List<Person> list = personMapper.list(roomId);

        return list;
    }

    @Override
    public List<Person> listByGameId(Long gameId,Long changId) {
        List<Person> list = personMapper.listByGameId(gameId,changId);

        return list;
    }

    @Override
    public List<Person> listByGame(Long gameId) {
        return personMapper.listByGame(gameId);
    }
}
