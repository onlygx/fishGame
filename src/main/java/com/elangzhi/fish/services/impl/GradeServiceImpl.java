package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.GameMapper;
import com.elangzhi.fish.dao.GradeMapper;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Grade;
import com.elangzhi.fish.services.GameService;
import com.elangzhi.fish.services.GradeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
@Service("gradeService")
public class GradeServiceImpl implements GradeService {

    @Resource
    GradeMapper gradeMapper;

    @Override
    public Long save(Grade grade) {
        return null;
    }

    @Override
    public Integer deleteById(Long id) {
        return null;
    }

    @Override
    public Grade findById(Long id) {
        return null;
    }

    @Override
    public Integer updateById(Grade grade) {
        return null;
    }
}
