package com.caipu.serviceImpl;

import com.caipu.entity.Favorites;
import com.caipu.entity.FavoritesExample;
import com.caipu.entity.User;
import com.caipu.entity.UserExample;
import com.caipu.mapper.FavoritesMapper;
import com.caipu.mapper.UserMapper;
import com.caipu.service.UserService;
import com.sun.org.apache.xpath.internal.functions.FuncExtFunctionAvailable;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    public User login(String name, String password) {
        User user = userMapper.selectByName(name);
        if (user != null && user.getPaw().equals(password)) {
            return user;
        }
        return null;
    }

    public void savePeople(User user) {
        userMapper.insert(user);
    }

    public boolean verification(String var) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(var);
        long count = userMapper.countByExample(example);
        return count == 0;
    }

    public void update(User user) {
        userMapper.updatebyNmae(user);
    }

    public List<User> selectAllUser() {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo("user");
        return userMapper.selectByExample(example);
    }

    public void deletePeople(Integer id) {
        userMapper.deleteById(id);
    }

    public List<User> selectLikeUser(String name) {
        return userMapper.selectByLike(name);
    }

    public User userPeople(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    public void updatePeople(User user) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(user.getName());
        userMapper.updateByExampleSelective(user, example);
    }


}
