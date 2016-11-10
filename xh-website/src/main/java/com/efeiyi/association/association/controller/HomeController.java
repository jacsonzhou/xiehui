package com.efeiyi.association.association.controller;

import com.efeiyi.association.core.DatabaseContextHolder;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.base.service.XdoManager;
import com.ming800.core.does.model.Do;
import com.ming800.core.does.model.DoQuery;
import com.ming800.core.does.model.PageInfo;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.does.service.DoManager;
import com.ming800.core.p.service.BannerManager;
import com.ming800.core.p.service.ObjectRecommendedManager;
import com.ming800.core.util.HttpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/9/24.
 * 前台首页 Controller
 */
@Controller
@RequestMapping("/init")
public class HomeController {

    @Autowired
    private DoManager doManager;

    @Autowired
    private XdoManager xdoManager;

    @Autowired
    private BaseManager baseManager;

    @Autowired
    BannerManager bannerManager;

    @Autowired
    private ObjectRecommendedManager objectRecommendedManager;

    @RequestMapping("/home.do")
    public ModelAndView getBannerByGroupId(Model model,HttpServletRequest request) throws Exception {
        //获取轮播图
        XQuery query = new XQuery("listPCBanner_default",request);
        List<Object> bannerList = baseManager.listObject(query);
        model.addAttribute("bannerList",bannerList);
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
        //广告区域banner
        XQuery bannerCenter = new XQuery("listAdvertisement_default", request);
        List<Object> centerList = baseManager.listObject(bannerCenter);
        model.addAttribute("centerList",centerList);
        XQuery bannerRight = new XQuery("listAdvertisement_default2",request);
        List<Object> bannerRightList = baseManager.listObject(bannerRight);
        model.addAttribute("bannerRightList",bannerRightList);
        //非遗大师
        List<Object> masterList = objectRecommendedManager.getRecommendedList("ec.masterRecommended");
        model.addAttribute("masterList",masterList);
        //非遗百科
        List<Object> artistryList = objectRecommendedManager.getRecommendedList("mainArtistryRecommended");
        model.addAttribute("artistryList",artistryList);
        return new ModelAndView("/home/home");
    }


}
