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
	
	/** ������������ҳ */
	public String home(){
		log.info("������������ҳ...");
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
	
	/** ���������������� */
	public String viewNavYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = ybhManageForm.getViewBM();
		ds.map.put("name",ybhManageForm.getOname());
		return home();
	}
	
	/** ���������������� */
	public String viewYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = ybhManageForm.getViewBM();
		ds.map.put("name",ybhManageForm.getOname());
		return home();
	}
	
	/*********************************************/
	/** �༭ */
	public String detail(){
		DotSession ds = DotSession.getVTSession(request);
		if(null!=ybhManageForm.getViewBM() && ybhManageForm.getViewBM().length()>0)
			ds.curHM= ybhManageForm.getViewBM();
		ds.pushAllList();
		ybhManageService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** ���¼�ͥ������Ϣ */
	public String saveFamily(){
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.saveFamilyInfo(ds, ybhManageForm);
		log.info("save family base info success");
		ybhManageService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** ��ͥ������Ϣҳ�棬���沢����  */
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
	
	/** ���¼�ͥ��Ա��Ϣ */
	public String saveMember(){
		DotSession ds = DotSession.getVTSession(request);
		ybhManageService.saveMemberInfo(ds, ybhManageForm);
		ds.opCode = "saveMember";
		ds.map.put("rtf","home");
		return detail();
	}
	
	/** ɾ����ͥ��Ա��Ϣ */
	public String deleteMember(){
		DotSession ds = DotSession.getVTSession(request);
		//ybhManageService.deleteMemberInfo(ds, ybhManageForm);
		ds.opCode = "deleteMember";
		return detail();
	}
	
	/** ��ͥ���뼰������  */
	public String familyIncome() {
		DotSession ds = DotSession.getVTSession(request);
		ds.pushAllList();
		ybhManageService.getFamilyIncome(ds);
		return "show_family_income";
	}
	
	/** ���¼�ͥ���뼰������ */
	public String saveYear(){
		DotSession ds = DotSession.getVTSession(request);
		//ybhManageService.saveYearInfo(ds, ybhManageForm);
		return familyIncome();
	}
	
	/** ��ͥ��Ա��Ϣ */
	public String itemFamily(){
		DotSession ds = DotSession.getVTSession(request);
		return "show_family_detail";
	}
	
	/** ��ͥ������Ϣ���������ҳ�� */
	public String editIncome(){
		return "show_family_income_update";
	}
	
	/** ��ͥ������Ϣ���������ҳ�� */
	public String saveIncome(){
		log.info("save income data incometxt array size:"+ybhManageForm.getIncometxt().length);
		ybhManageService.saveYbhIncome(ybhManageForm);
		rflag = rflag+1;
		return familyIncome();
	}
	
	
	private String rtf;
	private int rflag=1;
	public String getRtf() {
		return rtf;
	}
	public void setRtf(String rtf) {
		this.rtf = rtf;
	}
	public int getRflag() {
		return rflag;
	}
	public void setRflag(int rflag) {
		this.rflag = rflag;
	}
}
