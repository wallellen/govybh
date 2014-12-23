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
@SuppressWarnings({"serial","unchecked"})
public class YbhCheckAction extends BaseAction implements ModelDriven<YbhCheckForm>{
	private static Logger log = Logger.getLogger(YbhCheckAction.class);
	
	@Resource(name=YbhCheckService.SERVICE_NAME)
	private YbhCheckService ybhCheckService;
	private YbhCheckForm ybhCheckForm = new YbhCheckForm();
	
	public YbhCheckForm getModel() {
		return ybhCheckForm;
	}
	
	/** ��������ҳ */
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		ybhCheckService.getYbhListByCurBM(ds);
		if(null!=ybhCheckForm.getViewBM()&&ybhCheckForm.getViewBM().length()>0){
			if(ybhCheckForm.getViewBM().length()<=ds.rbm.length()){
				ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
			} else {
				ds.subPathTitle.setInfoByEx(String.valueOf(ds.map.get("name")),ds.curBM, ds.curBM);
			}
		}
		if(!ds.subPathTitle.hasRoot()) {
			ds.subPathTitle.setRoot(String.valueOf(ds.map.get("name")),ds.curBM, ds.rbm);
		}
		ds.subPathTitle.setYbhflag("check");
		ds.navPath=ds.subPathTitle.getHtmlString();
		request.setAttribute("ybhList", ds.list);
		ds.list=null;
		return "show_ybh";
	}
	
	/** ��������ѡ�������� */
	public String viewNavYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = ybhCheckForm.getViewBM();
		ds.map.put("name",ybhCheckForm.getOname());
		return home();
	}
	
	/** ��������ѡ������� */
	public String viewYbh(){
		DotSession ds = DotSession.getVTSession(request);
		ds.curBM = ybhCheckForm.getViewBM();
		ds.map.put("name",ybhCheckForm.getOname());
		return home();
	}
	
	/** ��������ѡ */
	public String selectYbh(){
		log.info("hm:"+ybhCheckForm.getHm()+", opcode:"+ybhCheckForm.getOpcode());
		ybhCheckService.selectYbhWithOpcode(ybhCheckForm);
		log.info("ybh select complete");
		return null;
	}
	

	public String deleteYbh()
	{
		ybhCheckForm.setOpcode(0);
		log.info("hm:"+ybhCheckForm.getHm()+", opcode:"+ybhCheckForm.getOpcode());
		ybhCheckService.selectYbhWithOpcode(ybhCheckForm);
		return null;
	}
}
