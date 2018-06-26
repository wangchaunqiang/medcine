package com.example.medcine.controller;

import com.example.medcine.model.Medicines;
import com.example.medcine.repository.MedicinesRepository;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class MedicinesController {
    protected Logger logger = Logger.getLogger(getClass());


    @Autowired
    private MedicinesRepository medicinesRepository ;


    @RequestMapping(value = "/info")
    public ModelAndView info(ModelAndView modelAndView){
        modelAndView.setViewName("info");
        return modelAndView;
    }

    @RequestMapping(value = "/info_manager")
    public ModelAndView info_manager(ModelAndView modelAndView){
        modelAndView.setViewName("info_manager");
        return modelAndView;
    }

    @RequestMapping(value = "/temp")
    public ModelAndView temp(ModelAndView modelAndView){
        modelAndView.setViewName("temp");
        return modelAndView;
    }

    @RequestMapping(value = "/temp2")
    public ModelAndView temp2(ModelAndView modelAndView){
        modelAndView.setViewName("temp2");
        return modelAndView;
    }

    // 药品分页
    @ResponseBody
    @RequestMapping(value = "/list_medicines")
    public JSONArray list_medicines(@RequestParam(value = "pageSize", required = false) Integer pageSize,
                            @RequestParam(value = "pageNumber", required = false) Integer pageNumber,
                            @RequestParam(value = "searchText", required = false) String searchText) {
        if (searchText == null) {
            searchText = "";
        }
        searchText = "%" + searchText + "%";
        Map<String, String> text = new HashMap<>();
        text.put("searchText", searchText);
        List<Medicines> rows = medicinesRepository.findAllByMnameIsLike(searchText);
        Collections.reverse(rows);
        Map<String, Object> map = new HashMap<>();
        int total = rows.size();
        map.put("total", total);
        if (rows.size() != 0) {
            if (rows.size() >= pageSize) {
                int temp = pageNumber * pageSize;
                if (temp >=total) {
                    temp = total;
                }
                rows = rows.subList(pageSize*(pageNumber-1), temp);
            }
        }
        logger.info(rows);
        map.put("rows", rows);
        JSONArray jsonArray = JSONArray.fromObject(map);
        logger.info(jsonArray);

        return jsonArray;
    }


    //增加药方
    @ResponseBody
    @RequestMapping(value = "/medicines_add")
    public JSONArray prescript_add(@RequestBody Medicines medicines){
        medicines = medicinesRepository.save(medicines);
        Map<String,String> map = new HashMap<>();
        if (medicines!=null){
            map.put("增加成功","增加成功");
        }
        return JSONArray.fromObject(map);
    }


    //修改药方
    @ResponseBody
    @RequestMapping(value = "/medicines_update")
    public JSONArray medicines_update(@RequestBody Medicines medicines){
        logger.info("medicines----------------"+medicines);
        medicines = medicinesRepository.save(medicines);
        Map<String,String> map = new HashMap<>();
        if (medicines!=null){
            map.put("修改成功","修改成功");
        }
        return JSONArray.fromObject(map);
    }


    //删除药方
    @RequestMapping(value = "/medicines_delete")
    public void prescript_delete(@RequestParam int mid){
        medicinesRepository.delete(mid);
    }

}
