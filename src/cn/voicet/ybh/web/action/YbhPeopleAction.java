package cn.voicet.ybh.web.action;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.web.form.YbhPeopleForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhPeopleAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhPeopleAction extends BaseAction implements ModelDriven<YbhPeopleForm>{
	private static Logger log = Logger.getLogger(YbhPeopleAction.class);
	
	//@Resource(name=YbhFarmerService.SERVICE_NAME)
	//private YbhFarmerService ybhFarmerService;
	private YbhPeopleForm ybhPeopleForm = new YbhPeopleForm();
	
	public YbhPeopleForm getModel() {
		return ybhPeopleForm;
	}
	
	/** 样本户管理首页 */
	public String home(){
		return "show_people";
	}
	
}
