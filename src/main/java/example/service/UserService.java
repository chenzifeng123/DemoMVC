package example.service;

import example.pojo.User;

import java.util.List;

public interface UserService {
    List<User> findUser();
    List<User> getlist(int start,int count); //获取用户list
    Integer getTotal(); //获取用户总数
}
