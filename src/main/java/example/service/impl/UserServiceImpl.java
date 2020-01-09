package example.service.impl;

import example.dao.UserDao;
import example.pojo.User;
import example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findUser() {
        return userDao.findUser();
    }

    @Override
    public  List<User> getlist(int start,int count){   //获取用户list
        List<User> users = new ArrayList<>();
        users = userDao.getlist(start,count);
        return users;
    }
    @Override
    public Integer getTotal() {
        return userDao.getTotal();
    }  //获取用户总数
}
