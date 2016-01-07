package com.elangzhi.fish.services;

/**
 * Created by GaoXiang on 2015/9/29 0029.
 */
public interface BaseService<T> {

    public Integer save(T t);

    public Integer deleteById(Long id);

    public T findById(Long id);

    public Integer updateById(T t);


}
