package com.caipu.mapper;

import com.caipu.entity.FavoriteNum;
import com.caipu.entity.FavoriteNumExample;
import java.util.List;

import com.caipu.entity.Favorites;
import com.caipu.entity.FavoritesExample;
import org.apache.ibatis.annotations.Param;

public interface FavoriteNumMapper {
    long countByExample(FavoriteNumExample example);

    int deleteByExample(FavoriteNumExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(FavoriteNum record);

    int insertSelective(FavoriteNum record);

    List<FavoriteNum> selectByExample(FavoriteNumExample example);

    List<FavoriteNum> selectByExampleWithDish(FavoritesExample example);

    FavoriteNum selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") FavoriteNum record, @Param("example") FavoriteNumExample example);

    int updateByExample(@Param("record") FavoriteNum record, @Param("example") FavoriteNumExample example);

    int updateByPrimaryKeySelective(FavoriteNum record);

    int updateByPrimaryKey(FavoriteNum record);

    int updateNum(Integer id);
}