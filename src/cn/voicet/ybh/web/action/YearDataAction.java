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
	
	/** ������¼����ҳ */
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.getYbhYearInfo(ds);
		log.info("����������¼�����б�ҳ��... ");
		return "show_year";
	}
	
	/** ������鿴���������� */
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
	
	/** �������б�ҳ�������� */
	public String viewYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = yearDataForm.getViewBM();
		ds.map.put("name",yearDataForm.getOname());
		log.info("�鿴�꣺"+yearDataForm.getYear());
		return viewData();
	}
	
	/** �弶��дҳ�� */
	public String updateCun(){
		DotSession ds = DotSession.getVTSession(request);
		cunMap = yearDataService.queryCunYbhInfoWithYear(ds, yearDataForm);
		request.setAttribute("cunMap", cunMap);
		log.info("cunMap data:"+cunMap);
		return "show_ybh_cunupdate";
	}
	
	/** ���� */
	public String saveCunYbh(){
		log.info("save cun ybh data cuntxtArr size:"+yearDataForm.getCuntxt().length);
		yearDataService.saveCunYbhData(yearDataForm);
		rflag = rflag + 1;
		return updateCun();
	}
	
	
	/** �༭ */
	public String detail(){
		DotSession ds = DotSession.getVTSession(request);
		if(null!=yearDataForm.getViewBM() && yearDataForm.getViewBM().length()>0)
			ds.curHM= yearDataForm.getViewBM();
		ds.pushAllList();
		yearDataService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** ���¼�ͥ������Ϣ */
	public String saveFamily(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.saveFamilyInfo(ds, yearDataForm);
		log.info("save family base info success");
		yearDataService.getYbhFamilyDetailInfo(ds);
		return "show_family_detail";
	}
	
	/** ��ͥ������Ϣҳ�棬���沢����  */
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
	
	/** ���¼�ͥ��Ա��Ϣ */
	public String saveMember(){
		DotSession ds = DotSession.getVTSession(request);
		yearDataService.saveMemberInfo(ds, yearDataForm);
		ds.opCode = "saveMember";
		ds.map.put("rtf","home");
		return detail();
	}
	
	/** ɾ����ͥ��Ա��Ϣ */
	public String deleteMember(){
		DotSession ds = DotSession.getVTSession(request);
		//yearDataService.deleteMemberInfo(ds, yearDataForm);
		ds.opCode = "deleteMember";
		return detail();
	}
	
	/** ��ͥ���뼰������  */
	public String familyIncome() {
		DotSession ds = DotSession.getVTSession(request);
		ds.pushAllList();
		yearDataService.getFamilyIncome(ds);
		return "show_family_income";
	}
	
	/** ���¼�ͥ���뼰������ */
	public String saveYear(){
		DotSession ds = DotSession.getVTSession(request);
		//yearDataService.saveYearInfo(ds, yearDataForm);
		return familyIncome();
	}
	
	/** ��ͥ��Ա��Ϣ */
	public String itemFamily(){
		DotSession ds = DotSession.getVTSession(request);
		return "show_family_detail";
	}
	
	private Map cunMap;
	private String rtf;
	private int rflag=1;	//���´�ָ��¼��ҳ�棬���ر��
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
	public int getRflag() {
		return rflag;
	}
	public void setRflag(int rflag) {
		this.rflag = rflag;
	}
	
}
