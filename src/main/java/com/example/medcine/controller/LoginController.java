package com.example.medcine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public String index(){
        return  "login";
    }

    @RequestMapping(value = "/login" , method = RequestMethod.GET)
    public String login(){
        return  "login2";
    }

    @RequestMapping(value = "/out2" , method = RequestMethod.GET)
    public String out2(){
        return  "login2";
    }

    @RequestMapping(value = "/out" , method = RequestMethod.GET)
    public String out(){
        return  "login";
    }

}


