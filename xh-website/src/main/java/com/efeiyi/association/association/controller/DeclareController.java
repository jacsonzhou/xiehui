package com.efeiyi.association.association.controller;

import com.ming800.core.base.service.BaseManager;
import com.ming800.core.base.service.XdoManager;
import com.ming800.core.does.model.Do;
import com.ming800.core.does.model.DoQuery;
import com.ming800.core.does.model.XQuery;
import com.ming800.core.does.service.DoManager;
import com.ming800.core.p.model.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2016/10/28.
 */
@Controller
@RequestMapping("/wap")
public class DeclareController {
    @Autowired
    private BaseManager baseManager;

    @RequestMapping({"/declare.do"})
    public ModelAndView declare(HttpServletRequest request, ModelMap modelMap) throws Exception {
        String qm = request.getParameter("qm");
        //非遗要闻
        XQuery query = new XQuery(qm,request);
        List<Document> list = baseManager.listObject(query);
        if (list != null && list.size()>1){
            for(Document document : list){
                modelMap.putIfAbsent(document.getKeywords(),document);
            }
        }
        String submitResult = request.getParameter("submitResult");
        modelMap.addAttribute("submitResult",submitResult);
        return new ModelAndView("/declare/declarationInquiry");
    }


}
