package example.dao;

import example.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
     List<User> findUser();
     //获取用户list 用@Param 对mapper文件 进行多个参数的传递
     List<User> getlist(@Param("start") int start, @Param("count") int count);
     Integer getTotal();  //获取用户总数
}
