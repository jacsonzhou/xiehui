package com.efeiyi.association.controller;

import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016/10/11.
 */
@Controller
@RequestMapping("web")
public class OthersController {


    @Autowired
    private BaseManager baseManager;
    @RequestMapping("websiteStatement.do")
    public ModelAndView getWebsiteStatement(HttpServletRequest request,Model model) throws Exception {
        String qm = request.getParameter("qm");
        XQuery query = new XQuery(qm,request);
        List<Object> documentList = baseManager.listObject(query);
        model.addAttribute("documentList",documentList);
        if(qm.equals("plistAssociationStatement_default")){
            return new ModelAndView("/home/statement");
        }else{
            return new ModelAndView("/home/feedback");
        }

    }

}
