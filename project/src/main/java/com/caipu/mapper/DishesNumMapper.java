package com.caipu.mapper;

import com.caipu.entity.DishesNum;
import com.caipu.entity.DishesNumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DishesNumMapper {
    long countByExample(DishesNumExample example);

    int deleteByExample(DishesNumExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DishesNum record);

    int insertSelective(DishesNum record);

    List<DishesNum> selectByExample(DishesNumExample example);

    DishesNum selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DishesNum record, @Param("example") DishesNumExample example);

    int updateByExample(@Param("record") DishesNum record, @Param("example") DishesNumExample example);

    int updateByPrimaryKeySelective(DishesNum record);

    int updateByPrimaryKey(DishesNum record);

    int updateNum(String type);
}