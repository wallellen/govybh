package cn.voicet.ybh.web.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhMemberService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhMemberForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhMemberAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhMemberAction extends BaseAction implements ModelDriven<YbhMemberForm>{
	private static Logger log = Logger.getLogger(YbhMemberAction.class);
	
	@Resource(name=YbhMemberService.SERVICE_NAME)
	private YbhMemberService ybhMemberService;
	private YbhMemberForm ybhMemberForm = new YbhMemberForm();
	
	public YbhMemberForm getModel() {
		return ybhMemberForm;
	}
	
	/** �������˿ڲ�ѯ*/
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		ybhMemberService.getSelectedXianList(ds);
		return "show_member";
	}
	
	public String queryMember(){
		DotSession ds = DotSession.getVTSession(request);
		ds.map.put("marr", ybhMemberForm.getMemberstr());
		ybhMemberService.getMemberInfoList(ds);
		return "show_member";
	}
	
}
