package com.efeiyi.association.association.controller;

import com.ming800.core.base.service.BaseManager;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.p.model.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016/10/28.
 */
@Controller
@RequestMapping("/wap")
public class StatementController {

    private final String  associationIntroduction = "plistAssociationIntroduction_default";
    private final String  orgnization ="plistOrganization_default";
    private final String  contact = "plistContact_default";


    @Autowired
    BaseManager baseManager;
    @RequestMapping("/statement")
    public ModelAndView getStatementContent(HttpServletRequest request,Model model) throws Exception {
        String qm = request.getParameter("qm");
        XQuery query = new XQuery(qm,request);
        List<Document> list = baseManager.listObject(query);
        Document document = null;
        if(list!=null&&list.size()>0){
            document =  list.get(0);
        }
        model.addAttribute("document",document);
        if(associationIntroduction.equals(qm)){
            return new ModelAndView("/statement/statement");
        }else if(orgnization.equals(qm)){
            return new ModelAndView("/statement/orgnization");
        }else{
            return new ModelAndView("/statement/contact");
        }
    }

}
