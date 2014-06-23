package cn.voicet.ybh.web.action;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhManageService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhManageForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhManageAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhManageAction extends BaseAction implements ModelDriven<YbhManageForm>{
	private static Logger log = Logger.getLogger(YbhManageAction.class);
	
	@Resource(name=YbhManageService.SERVICE_NAME)
	private YbhManageService ybhManageService;
	private YbhManageForm ybhManageForm = new YbhManageForm();
	
	public YbhManageForm getModel() {
		return ybhManageForm;
	}
	
	/** 样本户管理首页 */
	public String home(){
		log.info("加载样本户首页...");
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.getYbhListByCurBM(ds);
		if(null!=ybhManageForm.getViewBM()&&ybhManageForm.getViewBM().length()>0){
			if(ybhManageForm.getViewBM().length()<=ds.rbm.length()){
				ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
			} else {
				ds.subPathTitle.setInfoByEx(String.valueOf(ds.map.get("name")),ds.curBM, ds.curBM);
			}
		}
		if(!ds.subPathTitle.hasRoot()) {
			ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
		}
		ds.subPathTitle.setYbhflag("manage");
		ds.navPath=ds.subPathTitle.getHtmlString();
		return "show_ybh_manage";
	}
	
	/** 样本户管理导航操作 */
	public String viewNavYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = ybhManageForm.getViewBM();
		ds.map.put("name",ybhManageForm.getOname());
		return home();
	}
	
	/** 样本户管理进入操作 */
	public String viewYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = ybhManageForm.getViewBM();
		ds.map.put("name",ybhManageForm.getOname());
		return home();
	}
	
	
}
