package com.caipu.serviceImpl;

import com.caipu.entity.DishName;
import com.caipu.entity.DishNameExample;
import com.caipu.mapper.DishNameMapper;
import com.caipu.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodServiceImpl implements FoodService {

    @Autowired
    private DishNameMapper dishNameMapper;

    public List<DishName> selectAll() {
        return dishNameMapper.selectByExample(null);
    }

    public DishName disPlay(Integer pn) {
        return dishNameMapper.selectByPrimaryKey(pn);
    }

    public List<DishName> type(String type) {
        return dishNameMapper.selectByType(type);

    }

    @Override
    public List<DishName> searchList(String name) {
        return dishNameMapper.selectByLike(name);
    }

    @Override
    public List<DishName> myinfo(String name) {
        return dishNameMapper.selectByUser(name);
    }

    @Override
    public void insertDishName(DishName dishName) {
        dishNameMapper.insert(dishName);
    }

    @Override
    public void deleteFood(Integer id) {
        dishNameMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<DishName> selectLikeFood(String name) {
        return dishNameMapper.selectByLike(name);
    }

    @Override
    public DishName selectByFood(Integer id) {
        return dishNameMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(DishName dishName) {
        DishNameExample example = new DishNameExample();
        DishNameExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(dishName.getId());
        dishNameMapper.updateByExampleSelective(dishName, example);
    }

    @Override
    public List<DishName> selectAllFood() {
        return dishNameMapper.selectByExample(null);
    }
}
