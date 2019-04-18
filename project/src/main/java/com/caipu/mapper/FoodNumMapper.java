package com.caipu.mapper;

import com.caipu.entity.FavoriteNum;
import com.caipu.entity.FavoritesExample;
import com.caipu.entity.FoodNum;
import com.caipu.entity.FoodNumExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FoodNumMapper {
    long countByExample(FoodNumExample example);

    int deleteByExample(FoodNumExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(FoodNum record);

    int insertSelective(FoodNum record);

    List<FoodNum> selectByExample(FoodNumExample example);

    List<FoodNum> selectByExampleWithDish(FavoritesExample example);

    FoodNum selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") FoodNum record, @Param("example") FoodNumExample example);

    int updateByExample(@Param("record") FoodNum record, @Param("example") FoodNumExample example);

    int updateByPrimaryKeySelective(FoodNum record);

    int updateByPrimaryKey(FoodNum record);

    int updateNum(Integer id);
}