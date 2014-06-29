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
	
	/*********************************************/
	/** 编辑 */
	public String detail(){
		DotSession ds = DotSession.getVTSession(request);
		if(null!=ybhManageForm.getViewBM() && ybhManageForm.getViewBM().length()>0)
			ds.curHM= ybhManageForm.getViewBM();
		ds.pushAllList();
		ybhManageService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** 更新家庭户主信息 */
	public String saveFamily(){
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.saveFamilyInfo(ds, ybhManageForm);
		log.info("save family base info success");
		ybhManageService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** 家庭基本信息页面，保存并返回  */
	public String saveFamilyEx(){
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.saveFamilyInfo(ds, ybhManageForm);
		ybhManageService.getYbhFamilyDetailInfo(ds);
		ds.opCode = "saveFamily";
		ds.map.put("rtf","home");
		return home();
	}
	
	public String backup() {
		DotSession ds = DotSession.getVTSession(request);
		ds.popAllList();
		return home();
	}
	
	/** 更新家庭成员信息 */
	public String saveMember(){
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.saveMemberInfo(ds, ybhManageForm);
		ds.opCode = "saveMember";
		ds.map.put("rtf","home");
		return detail();
	}
	
	/** 删除家庭成员信息 */
	public String deleteMember(){
		DotSession ds = DotSession.getVTSession(request);
		//ybhManageService.deleteMemberInfo(ds, ybhManageForm);
		ds.opCode = "deleteMember";
		return detail();
	}
	
	/** 家庭收入及帮扶情况  */
	public String familyIncome() {
		DotSession ds = DotSession.getVTSession(request);
		ds.pushAllList();
		ybhManageService.getFamilyIncome(ds);
		return "show_family_income";
	}
	
	/** 更新家庭收入及帮扶情况 */
	public String saveYear(){
		DotSession ds = DotSession.getVTSession(request);
		//ybhManageService.saveYearInfo(ds, ybhManageForm);
		return familyIncome();
	}
	
	/** 家庭成员信息 */
	public String itemFamily(){
		DotSession ds = DotSession.getVTSession(request);
		return "show_family_detail";
	}
	
	/** 家庭基本信息年收入更新页面 */
	public String editIncome(){
		
		return "show_family_income_update";
	}
	
	private String rtf;
	public String getRtf() {
		return rtf;
	}
	public void setRtf(String rtf) {
		this.rtf = rtf;
	}
	
	
}
