package com.efeiyi.association.controller;

import com.efeiyi.association.OrganizationConst;
import com.efeiyi.ec.product.model.Advertisement;
import com.ming800.core.base.service.BaseManager;
import com.ming800.core.base.service.XdoManager;
import com.ming800.core.base.service.XdoSupportManager;
import com.ming800.core.does.model.Do;
import com.ming800.core.does.model.DoQuery;
import com.ming800.core.does.model.PageInfo;
import com.ming800.core.does.model.XSaveOrUpdate;
import com.ming800.core.does.service.DoManager;
import com.ming800.core.p.model.Banner;
import com.ming800.core.p.service.AliOssUploadManager;
import com.ming800.core.p.service.BannerManager;
import com.ming800.core.taglib.PageEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/9/22.
 */
@Controller
@RequestMapping("/myAdvertisement")
public class MyAdvertisementController {

    @Autowired
    private BaseManager baseManager;

    @Autowired
    private BannerManager bannerManager;
    @Autowired
    private XdoManager xdoManager;

    @Autowired
    private XdoSupportManager xdoSupportManager;

    @Autowired
    private DoManager doManager;

    @Autowired
    @Qualifier("aliOssUploadManagerImpl")
    private AliOssUploadManager aliOssUploadManager;
    /**
     * 通过模块ID获取相关模块的轮播图（状态为可用）的所有对象
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("/advertisement.do")
    public List<Advertisement> getBannerByGroupId(ModelMap modelMap, HttpServletRequest request) throws Exception {
        String qm = request.getParameter("qm");
        if (qm.split("_").length < 2) {
            throw new Exception("qm:" + qm + "的具体查询部分没有定义即'_'的后半部分没有定义");
        }
        //先找到配置文件里的entity
        Do tempDo = doManager.getDoByQueryModel(qm.split("_")[0]);
        //再从中找到query的信息
        DoQuery tempDoQuery = tempDo.getDoQueryByName(qm.split("_")[1]);

        PageEntity pageEntity = new PageEntity();
        String pageIndex = request.getParameter("pageEntity.index");
        String pageSize = request.getParameter("pageEntity.size");
        if (pageIndex != null) {
            pageEntity.setIndex(Integer.parseInt(pageIndex));
            pageEntity.setSize(Integer.parseInt(pageSize));
        }

        modelMap.put("tabTitle", tempDoQuery.getLabel());
        PageInfo pageInfo = xdoManager.listPage(tempDo, tempDoQuery, null, pageEntity);
        modelMap.put("pageInfo", pageInfo);
        modelMap.put("pageEntity", pageInfo.getPageEntity());

        if (tempDo.getExecute() != null && !tempDo.getExecute().equals("")) {
            modelMap = xdoSupportManager.execute(tempDo, modelMap, request);
        }
        modelMap.put("qm", qm);
        modelMap.put("group",tempDo.getLabel());
        return pageInfo.getList();
    }
    /**
     * 新建页面
     *
     * @param banner
     * @return
     */
    @RequestMapping("/newAdvertisement.do")
    public ModelAndView direct2Jsp(ModelMap model, HttpServletRequest request, Banner banner) throws Exception {
        String qm = request.getParameter("qm");

        if (qm.split("_").length < 2) {
            throw new Exception("qm:" + qm + "的具体查询部分没有定义即'_'的后半部分没有定义");
        }
        //先找到配置文件里的entity
        Do tempDo = doManager.getDoByQueryModel(qm.split("_")[0]);
        //再从中找到query的信息
//            DoQuery tempDoQuery = tempDo.getDoQueryByName(qm.split("_")[1]);
        //设置保存后的返回页面
        model.addAttribute("qm", request.getParameter("resultPage"));
        if (banner.getId() != null && !"".equals(banner.getId())) {
            banner = (Banner) baseManager.getObject(banner.getClass().getName(), banner.getId());
            model.addAttribute("object", banner);
        }
        return new ModelAndView(/*request.getContextPath() +*/ tempDo.getResult());
    }

    /**
     *
     * @param multipartFile
     * @param advertisement
     * @param model
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/saveAdvertisement.do")
    public ModelAndView saveAdvertisement(@RequestParam(value = "image") MultipartFile multipartFile, Advertisement advertisement,ModelMap model,HttpServletRequest request) throws IOException {
        String path = request.getParameter("qm");
        String name = request.getParameter("name");
        //新建内容
        if (advertisement.getId() == null || "".equals(advertisement.getId())) {
            advertisement.setStatus("1");
            advertisement.setId(null);
            advertisement.setImg(null);
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String identify = sdf.format(new Date());
        String url = "advertisement/" + identify + ".jpg";

        if (!multipartFile.getOriginalFilename().equals("")) {
            aliOssUploadManager.uploadFile(multipartFile, "association", url);
            url = OrganizationConst.imgBasePath + url;
            advertisement.setImg(url);
        }
        baseManager.saveOrUpdate(Advertisement.class.getName(),advertisement);
        return new ModelAndView("redirect:" /*+ request.getContextPath() */+ path);
    }

    /**
     * 假删
     *
     * @param advertisement
     * @return
     */
    @RequestMapping("/removeAdvertisement.do")
    @ResponseBody
    public ModelAndView removeAdvertisement(HttpServletRequest request, Advertisement advertisement) throws Exception {
        String path = /*request.getContextPath() +*/ request.getParameter("resultPage");
        advertisement.setStatus("0");
        baseManager.saveOrUpdate(Advertisement.class.getName(),advertisement);
        return new ModelAndView("redirect:" /*+ request.getContextPath()*/ + path);
    }



}
