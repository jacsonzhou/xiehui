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
public class PolicieAndRegulationController {
    @Autowired
    private BaseManager baseManager;
    @RequestMapping("/poliAndReguList")
    public ModelAndView getPoliAndReguList(HttpServletRequest request,Model model) throws Exception {
        //政策法规
        XQuery policyQuery = new XQuery("plistPolicy_default",request);
        List<Object> policyList = baseManager.listObject(policyQuery);
        model.addAttribute("policyList",policyList);
        return new ModelAndView("/policies/policies");
    }
    @RequestMapping("/policiesDetail/{id}")
    public ModelAndView getPoliciesDetail(@PathVariable String id,HttpServletRequest request,Model model){
        Document document = (Document) baseManager.getObject(Document.class.getName(),id);
        model.addAttribute("document",document);
        return new ModelAndView("/policies/policyDetail");
    }

}
