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
	
}
