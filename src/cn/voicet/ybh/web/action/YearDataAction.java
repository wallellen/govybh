package cn.voicet.ybh.web.action;
import java.util.Map;

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
		DotSession ds = DotSession.getVTSession(request);
		cunMap = yearDataService.queryCunYbhInfoWithYear(ds, yearDataForm);
		request.setAttribute("cunMap", cunMap);
		log.info("cunMap data:"+cunMap);
		return "show_ybh_cunupdate";
	}
	
	/** 保存 */
	public String saveCunYbh(){
		log.info("save cun ybh data cuntxtArr size:"+yearDataForm.getCuntxt().length);
		yearDataService.saveCunYbhData(yearDataForm);
		return updateCun();
	}
	
	
	/** 编辑 */
	public String detail(){
		DotSession ds = DotSession.getVTSession(request);
		if(null!=yearDataForm.getViewBM() && yearDataForm.getViewBM().length()>0)
			ds.curHM= yearDataForm.getViewBM();
		ds.pushAllList();
		yearDataService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** 更新家庭户主信息 */
	public String saveFamily(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.saveFamilyInfo(ds, yearDataForm);
		log.info("save family base info success");
		yearDataService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** 家庭基本信息页面，保存并返回  */
	public String saveFamilyEx(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.saveFamilyInfo(ds, yearDataForm);
		yearDataService.getYbhFamilyDetailInfo(ds);
		ds.opCode = "saveFamily";
		ds.map.put("rtf","home");
		return viewData();
	}
	
	public String backup() {
		DotSession ds = DotSession.getVTSession(request);
		ds.popAllList();
		return viewData();
	}
	
	/** 更新家庭成员信息 */
	public String saveMember(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.saveMemberInfo(ds, yearDataForm);
		ds.opCode = "saveMember";
		ds.map.put("rtf","home");
		return detail();
	}
	
	/** 删除家庭成员信息 */
	public String deleteMember(){
		DotSession ds = DotSession.getVTSession(request);
		//yearDataService.deleteMemberInfo(ds, yearDataForm);
		ds.opCode = "deleteMember";
		return detail();
	}
	
	/** 家庭收入及帮扶情况  */
	public String familyIncome() {
		DotSession ds = DotSession.getVTSession(request);
		ds.pushAllList();
		yearDataService.getFamilyIncome(ds);
		return "show_family_income";
	}
	
	/** 更新家庭收入及帮扶情况 */
	public String saveYear(){
		DotSession ds = DotSession.getVTSession(request);
		//yearDataService.saveYearInfo(ds, yearDataForm);
		return familyIncome();
	}
	
	/** 家庭成员信息 */
	public String itemFamily(){
		DotSession ds = DotSession.getVTSession(request);
		return "show_family_detail";
	}
	
	private Map cunMap;
	private String rtf;
	public Map getCunMap() {
		return cunMap;
	}
	public void setCunMap(Map cunMap) {
		this.cunMap = cunMap;
	}
	public String getRtf() {
		return rtf;
	}
	public void setRtf(String rtf) {
		this.rtf = rtf;
	}
}
