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
@SuppressWarnings("serial")
public class YbhManageAction extends BaseAction implements ModelDriven<YbhManageForm>{
	private static Logger log = Logger.getLogger(YbhManageAction.class);
	
	@Resource(name=YbhManageService.SERVICE_NAME)
	private YbhManageService ybhManageService;
	private YbhManageForm ybhManageForm = new YbhManageForm();
	
	public YbhManageForm getModel() {
		return ybhManageForm;
	}
	
	/** 样本户首页 */
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.getYbhListByCurBM(ds);
		if(null!=viewBM&&viewBM.length()>0){
			if(viewBM.length()<=ds.rbm.length()){
				ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
			} else {
				ds.subPathTitle.setInfoByEx(String.valueOf(ds.map.get("name")),ds.curBM, ds.curBM);
			}
		}
		if(!ds.subPathTitle.hasRoot()) {
			ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
		}
		ds.navPath=ds.subPathTitle.getHtmlString();
		return "show_ybh_manage";
	}
	
	/** 进入操作 */
	public String viewYbh(){
		System.out.println("viewBM:"+viewBM);
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = viewBM;
		return home();
	}
	
	private String viewBM;
	public String getViewBM() {
		return viewBM;
	}
	public void setViewBM(String viewBM) {
		this.viewBM = viewBM;
	}
	
}
