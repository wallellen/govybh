package cn.voicet.ybh.web.action;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhCheckService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhCheckForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhCheckAction")
@Scope(value="prototype")
@SuppressWarnings("serial")
public class YbhCheckAction extends BaseAction implements ModelDriven<YbhCheckForm>{
	private static Logger log = Logger.getLogger(YbhCheckAction.class);
	
	@Resource(name=YbhCheckService.SERVICE_NAME)
	private YbhCheckService ybhCheckService;
	private YbhCheckForm ybhCheckForm = new YbhCheckForm();
	
	public YbhCheckForm getModel() {
		return ybhCheckForm;
	}
	
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		ybhCheckService.getYbhListByCurBM(ds);
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
		return "show_ybh";
	}
	
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
