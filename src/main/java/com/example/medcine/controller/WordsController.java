package com.example.medcine.controller;

import com.example.medcine.model.Words;
import com.example.medcine.repository.WordsRepository;
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
public class WordsController {

    protected Logger logger = Logger.getLogger(getClass());

    @Autowired
    private WordsRepository wordsRepository;


    @RequestMapping(value = "/words_look")
    public ModelAndView words_look(ModelAndView modelAndView){
        modelAndView.setViewName("words_look");
        return modelAndView;
    }

    @RequestMapping(value = "/words")
    public ModelAndView words(ModelAndView modelAndView){
        modelAndView.setViewName("words");
        return modelAndView;
    }

    @RequestMapping(value = "/words1")
    public ModelAndView words1(ModelAndView modelAndView){
        modelAndView.setViewName("words1");
        return modelAndView;
    }

    //修改药方
    @ResponseBody
    @RequestMapping(value = "/words_update")
    public JSONArray words_update(@RequestBody Words words){
        logger.info("words----------------"+words);
        words = wordsRepository.save(words);
        Map<String,String> map = new HashMap<>();
        if (words!=null){
            map.put("修改成功","修改成功");
        }
        return JSONArray.fromObject(map);
    }

    @RequestMapping(value = "/words_manager")
    public ModelAndView words_manager(ModelAndView modelAndView){
        modelAndView.setViewName("words_manager");
        return modelAndView;
    }

    @RequestMapping(value = "/words_delete")
    public void words_delete(@RequestParam int wid){
     wordsRepository.delete(wid);
    }
    //增加留言
    @ResponseBody
    @RequestMapping(value = "/words_add")
    public JSONArray words_add(@RequestBody Words words){

        words = wordsRepository.save(words);
        Map<String,String> map = new HashMap<>();
        if (words!=null){
            map.put("增加成功","增加成功");
        }
        return JSONArray.fromObject(map);
    }

    //查看留言
    @RequestMapping(value = "/words_list")
    public JSONArray words_list(@RequestParam(value = "pageSize", required = false) Integer pageSize,
                                @RequestParam(value = "pageNumber", required = false) Integer pageNumber,
                                @RequestParam(value = "searchText", required = false) String searchText){
        if (searchText == null) {
            searchText = "";
        }
        searchText = "%" + searchText + "%";
        Map<String, String> text = new HashMap<>();
        text.put("searchText", searchText);
        List<Words> rows = wordsRepository.findAllByWnameIsLike(searchText);
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

}
