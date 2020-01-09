package example.controller;


import example.pojo.User;
import example.service.UserService;
import example.until.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
//@RequestMapping("/home")
public class DemoController {

    @Autowired
    private UserService userService;

    //获取用户list
    @RequestMapping("/getlist")
    public ModelAndView getList(HttpServletRequest request, HttpServletResponse response){
        //new一个ModelAndView对象,通过addObject存储page和用户list 并利用setViewName设定跳转页面
        ModelAndView modelView = new ModelAndView();
        int start = 0;  //初始化开始数据的索引 也就是所在页面的第一行 如第一页第一行是第0条，第二页第一行是第10条 以此类推
        int count = 10; //每页显示的条目数
        try{
            start = Integer.parseInt(request.getParameter("page.start"));  //从前台获取 开始数据的索引
            count = Integer.parseInt(request.getParameter("page.count"));  //从前台获取 每页显示的条目数
        }catch (Exception e){
        }
        Page page = new Page(start,count); //将得到的值存入page对象中
        //从数据库中取值 将 start 和count 传入
        // 后台sql语句如下：
        // SELECT * FROM user LIMIT #{start}, #{和count}
        //第一个参数是开始数据的索引位置
        //第二个参数是要查询多少条数据
        //这里解释一下原理，每次从数据库中取出部分数据，可防止内存溢出
        List<User> userList = userService.getlist(page.getStart(),page.getCount());  //获取用户list

        // 后台sql语句如下
        // SELECT COUNT(*) FROM user
        //获取user表中用户总个数
        int total = userService.getTotal();
        page.setTotal(total);//设置page对象的总数据量

        //通过addObject存储page和用户list
        modelView.addObject("page", page);
        modelView.addObject("userList", userList);
        //利用setViewName设定跳转页面
        modelView.setViewName("pagetext");

        //返回ModelAndView对象 跳转
        return modelView;
    }

   
}
