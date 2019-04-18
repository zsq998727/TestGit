package com.caipu.mapper;

import com.caipu.entity.Favorites;
import com.caipu.entity.FavoritesExample;
import java.util.List;

import com.caipu.entity.Vote;
import org.apache.ibatis.annotations.Param;

public interface FavoritesMapper {
    long countByExample(FavoritesExample example);

    int deleteByExample(FavoritesExample example);

    int deleteByPrimaryKey(Favorites favorites);

    int insert(Favorites record);

    int insertSelective(Favorites record);

    List<Favorites> selectByExample(FavoritesExample example);

    Favorites selectByPrimaryKey(Integer fid);

    List<Favorites> selectByExampleWithDish(FavoritesExample example);

    Favorites selectByPrimaryKeyWithDish(Integer fid);

    Favorites selectByDishId(Favorites favorites);

    int updateByExampleSelective(@Param("record") Favorites record, @Param("example") FavoritesExample example);

    int updateByExample(@Param("record") Favorites record, @Param("example") FavoritesExample example);

    int updateByPrimaryKeySelective(Favorites record);

    int updateByPrimaryKey(Favorites record);

}