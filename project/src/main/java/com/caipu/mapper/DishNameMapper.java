package com.caipu.mapper;

import com.caipu.entity.DishName;
import com.caipu.entity.DishNameExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DishNameMapper {
    long countByExample(DishNameExample example);

    int deleteByExample(DishNameExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(DishName record);

    int insertSelective(DishName record);

    List<DishName> selectByExample(DishNameExample example);

    List<DishName> selectByType(String type);

    List<DishName> selectByLike(String name);

    List<DishName> selectByUser(String name);

    DishName selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") DishName record, @Param("example") DishNameExample example);

    int updateByExample(@Param("record") DishName record, @Param("example") DishNameExample example);

    int updateByPrimaryKeySelective(DishName record);

    int updateByPrimaryKey(DishName record);
}