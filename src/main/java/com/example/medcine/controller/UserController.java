package com.example.medcine.controller;

import com.example.medcine.model.Prescript;
import com.example.medcine.model.User;
import com.example.medcine.repository.UserRepository;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class UserController {
    protected Logger logger = Logger.getLogger(getClass());
    @Autowired
    private UserRepository userRepository;


    @RequestMapping(value = "/user_manager")
    public ModelAndView user_manager(ModelAndView modelAndView){
        modelAndView.setViewName("user_manager");
        return modelAndView;
    }

    @PostMapping(value = "/userLogin")
    public ModelAndView userLogin(@RequestParam String username, @RequestParam String password, HttpSession session){
       User user =  userRepository.findUserByUsernameAndPassword(username,password);
       ModelAndView mav = new ModelAndView();
       if (user!=null && user.getStatus().equals("1")){
           mav.setViewName("temp");
           session.setAttribute("user",user);
       }else {
           mav.setViewName("login");
       }
        return mav;
    }

    @PostMapping(value = "/muserLogin")
    public ModelAndView muserLogin(@RequestParam String username, @RequestParam String password, HttpSession session){
        User user1 =  userRepository.findUserByUsernameAndPassword(username,password);
        ModelAndView mav = new ModelAndView();
        if (user1!=null && user1.getStatus().equals("0")){
            mav.setViewName("temp2");
            session.setAttribute("user1",user1);
        }else {
            mav.setViewName("login2");
        }
        return mav;
    }

    @GetMapping(value = "/checkUsername")
    public String checkUsername(@RequestParam String username){
        if (userRepository.findUserByUsername(username)!=null){
            return "对不起，名字重复请重新输入！";
        }
        return "";
    }

    @RequestMapping(value = "/user_add")
    public  String user_add(@RequestBody User user){
        userRepository.save(user);
        return "添加用户成功！";
    }

    @RequestMapping(value = "/user_register")
    public  String user_register(@RequestBody User user){
        user.setStatus("1");
        userRepository.save(user);
        return "注册用户成功！";
    }


    //修改药方
    @ResponseBody
    @RequestMapping(value = "/user_update")
    public JSONArray user_update(@RequestBody User user){
        logger.info("user----------------"+user);
        user = userRepository.save(user);
        Map<String,String> map = new HashMap<>();
        if (user!=null){
            map.put("修改成功","修改成功");
        }
        return JSONArray.fromObject(map);
    }

    @GetMapping(value = "/userDelete")
    public ModelAndView userDelete(ModelAndView modelAndView, @RequestParam Integer uid){
          userRepository.delete(uid);
          modelAndView.setViewName("user");
          modelAndView.addObject("delete","删除成功！");
          return modelAndView;
    }

    @RequestMapping(value = "/user")
    public ModelAndView user(ModelAndView modelAndView){
        List<User>  listSysUsers = userRepository.findAll();
        modelAndView.addObject("listSysUsers", listSysUsers);
        modelAndView.setViewName("user");
        return modelAndView;
    }
}
