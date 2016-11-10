package com.efeiyi.association.association.controller;

import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.p.model.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016/10/26.
 */
@Controller
@RequestMapping("/wap")
public class WapNewsController {
    @Autowired
    private BaseManager baseManager;

    @RequestMapping("/newsList")
    public ModelAndView getNewsList(HttpServletRequest request,Model model) throws Exception {
        //非遗要闻
        XQuery queryIndustry = new XQuery("plistNewsIndustry_industry",request);
        List<Object> newList = baseManager.listObject(queryIndustry);
        model.addAttribute("newList",newList);
        ////重要通知==新闻公告
        XQuery xQueryNotes = new XQuery("plistNewsNote_industry",request);
        List<Object> noteList = baseManager.listObject(xQueryNotes);
        model.addAttribute("noteList",noteList);
        //协会新闻
        XQuery xQueryOrganizationNews = new XQuery("plistNewsOrganization_default",request);
        List<Object> organizationNewsList = baseManager.listObject(xQueryOrganizationNews);
        model.addAttribute("organizationNewsList",organizationNewsList);
        return  new ModelAndView("/news/newsList");
    }
    @RequestMapping("/details/{id}")
    public ModelAndView getNewsContent(@PathVariable("id") String id,HttpServletRequest request,Model model){
        Document document = (Document) baseManager.getObject(Document.class.getName(), id);
        model.addAttribute("document",document);
        return new ModelAndView("/news/news");
    }
}
