package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Grade;

import java.util.List;

/**
 * Created by GaoXiang on 2016/1/7 0007.
 */
public interface GradeService extends BaseService<Grade> {

    /**
     * 根据personId和gameId查询数据重复
     * @param personId
     * @param gameId
     * @return
     */
    List<Grade> findByPGID(Long personId,Long gameId);

}
