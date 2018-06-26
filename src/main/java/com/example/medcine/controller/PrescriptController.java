package com.example.medcine.controller;

import com.example.medcine.model.Prescript;
import com.example.medcine.repository.PrescriptRepository;
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
public class PrescriptController {
    protected Logger logger = Logger.getLogger(getClass());


    @Autowired
    private PrescriptRepository prescriptRepository ;


    @RequestMapping(value = "/pinfo_manager")
    public ModelAndView pinfo_manager(ModelAndView modelAndView){
        modelAndView.setViewName("pinfo_manager");
        return modelAndView;
    }

    @RequestMapping(value = "/pinfo")
    public ModelAndView pinfo(ModelAndView modelAndView){
        modelAndView.setViewName("pinfo");
        return modelAndView;
    }

    // 药方查询及分页查询
    @ResponseBody
    @RequestMapping(value = "/list_prescript")
    public JSONArray list_medicines(@RequestParam(value = "pageSize", required = false) Integer pageSize,
                            @RequestParam(value = "pageNumber", required = false) Integer pageNumber,
                            @RequestParam(value = "searchText", required = false) String searchText) {
        if (searchText == null) {
            searchText = "";
        }
        searchText = "%" + searchText + "%";
        Map<String, String> text = new HashMap<>();
        text.put("searchText", searchText);
        List<Prescript> rows = prescriptRepository.findAllByPnameIsLike(searchText);
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
    @RequestMapping(value = "/prescript_add")
    public JSONArray prescript_add(@RequestBody Prescript prescript){
     prescript = prescriptRepository.save(prescript);
     Map<String,String> map = new HashMap<>();
      if (prescript!=null){
          map.put("增加成功","增加成功");
      }
        return JSONArray.fromObject(map);
    }

    //修改药方
    @ResponseBody
    @RequestMapping(value = "/prescript_update")
    public JSONArray prescript_update(@RequestBody Prescript prescript){
        logger.info("prescript----------------"+prescript);
        prescript = prescriptRepository.save(prescript);
        Map<String,String> map = new HashMap<>();
        if (prescript!=null){
            map.put("修改成功","修改成功");
        }
        return JSONArray.fromObject(map);
    }

    //删除药方
    @RequestMapping(value = "/prescript_delete")
    public void prescript_delete(@RequestParam int pid){
        prescriptRepository.delete(pid);
    }
}
