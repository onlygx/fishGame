package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.GameMapper;
import com.elangzhi.fish.dao.GradeMapper;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Grade;
import com.elangzhi.fish.services.GameService;
import com.elangzhi.fish.services.GradeService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
@Service("gradeService")
public class GradeServiceImpl implements GradeService {

    @Resource
    GradeMapper gradeMapper;

    @Override
    public Long save(Grade grade) {
        grade.setId(UUIDFactory.getLongId());
        return gradeMapper.insertSelective(grade);
    }

    @Override
    public Integer deleteById(Long id) {
        return gradeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Grade findById(Long id) {
        return gradeMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Grade grade) {
        return gradeMapper.updateByPrimaryKeySelective(grade);
    }

    @Override
    public List<Grade> findByPGID(Long personId, Long gameId) {

        return gradeMapper.findByPGID(personId,gameId);
    }
}
