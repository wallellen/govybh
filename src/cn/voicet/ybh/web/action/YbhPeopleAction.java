package cn.voicet.ybh.web.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhPeopleService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhPeopleForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhPeopleAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhPeopleAction extends BaseAction implements ModelDriven<YbhPeopleForm>{
	private static Logger log = Logger.getLogger(YbhPeopleAction.class);
	
	@Resource(name=YbhPeopleService.SERVICE_NAME)
	private YbhPeopleService ybhPeopleService;
	private YbhPeopleForm ybhPeopleForm = new YbhPeopleForm();
	
	public YbhPeopleForm getModel() {
		return ybhPeopleForm;
	}
	
	/** 样本户人口查询*/
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		ybhPeopleService.getSelectedHuList(ds);
		return "show_people";
	}
	
}
