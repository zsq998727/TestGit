package com.caipu.mapper;

import com.caipu.entity.User;
import com.caipu.entity.UserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int insert(User record);

    User selectByName(String name);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    void updatebyNmae(User user);

    void deleteById(Integer id);

    List<User> selectByLike(String name);

    User selectByPrimaryKey(Integer id);

}