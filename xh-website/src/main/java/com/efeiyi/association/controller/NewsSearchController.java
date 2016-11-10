package com.efeiyi.association.controller;

import com.ming800.core.base.service.BaseManager;
import com.ming800.core.p.model.Document;
import org.hibernate.envers.Audited;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by Administrator on 2016/9/12.
 */
@Controller
@RequestMapping("/news")
public class NewsSearchController {
    @Autowired
    BaseManager baseManager;

    @RequestMapping("/search.do")
    private String getSearchResult(Model model,HttpServletRequest request){
        String title = request.getParameter("q");
        LinkedHashMap queryMap = new LinkedHashMap();
        String sql = "from Document where title like:title and status!=0 and group in ('orgNews','industryNews','noticeManage')";
        queryMap.put("title", "%"+title+"%");
        List<Document> newsList = baseManager.listObject(sql,queryMap);
        model.addAttribute("newsList",newsList);
        return "/search/searchResult" ;
    }





}
