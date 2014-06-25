package cn.voicet.ybh.web.action;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YearDataService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YearDataForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("yearDataAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YearDataAction extends BaseAction implements ModelDriven<YearDataForm>{
	private static Logger log = Logger.getLogger(YearDataAction.class);
	
	@Resource(name=YearDataService.SERVICE_NAME)
	private YearDataService yearDataService;
	private YearDataForm yearDataForm = new YearDataForm();
	
	public YearDataForm getModel() {
		return yearDataForm;
	}
	
	/** 年数据录入首页 */
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.getYbhYearInfo(ds);
		log.info("加载年数据录入年列表页面... ");
		return "show_year";
	}
	
	/** 根据年查看样本户数据 */
	public String viewData(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.getYbhListByCurBM(ds);
		if(null!=yearDataForm.getViewBM()&&yearDataForm.getViewBM().length()>0){
			if(yearDataForm.getViewBM().length()<=ds.rbm.length()){
				ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
			} else {
				ds.subPathTitle.setInfoByEx(String.valueOf(ds.map.get("name")),ds.curBM, ds.curBM);
			}
		}
		if(!ds.subPathTitle.hasRoot()) {
			ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
		}
		ds.subPathTitle.setYbhflag("yeardata");
		ds.navPath=ds.subPathTitle.getHtmlString();
		return "show_data";
	}
	
	/** 样本户列表页面进入操作 */
	public String viewYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = yearDataForm.getViewBM();
		ds.map.put("name",yearDataForm.getOname());
		log.info("查看年："+yearDataForm.getYear());
		return viewData();
	}
	
	/** 村级填写页面 */
	public String updateCun(){
		
		return "show_ybh_cunupdate";
	}
	
}
