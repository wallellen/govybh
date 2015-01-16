package cn.voicet.ybh.web.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhTotalService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhTotalForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhTotalAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhTotalAction extends BaseAction implements ModelDriven<YbhTotalForm>{
	private static Logger log = Logger.getLogger(YbhTotalAction.class);
	
	@Resource(name=YbhTotalService.SERVICE_NAME)
	private YbhTotalService ybhTotalService;
	private YbhTotalForm ybhTotalForm = new YbhTotalForm();
	
	public YbhTotalForm getModel() {
		return ybhTotalForm;
	}
	
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		ybhTotalService.getYbhYearInfo(ds);
		log.info("year:"+ds.list);
		return "show_total";
	}
	
	public String stats(){
		DotSession ds = DotSession.getVTSession(request);
		ybhTotalService.getYbhTotalInfo(ds, ybhTotalForm);
		log.info("map:"+ds.map);
		return "show_total";
	}
	
}
