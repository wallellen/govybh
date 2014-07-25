package cn.voicet.ybh.web.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.InitPassService;
import cn.voicet.ybh.util.DotSession;

@Controller("initPassAction")
@Scope("prototype")
@SuppressWarnings({"serial","unchecked"})
public class InitPassAction extends BaseAction{
	
	private static Logger log = Logger.getLogger(InitPassAction.class);
	@Resource(name=InitPassService.SERVICE_NAME)
	private InitPassService initPassService;

	public String home() {
		return "show_init_pass";
	}
	
	public String initPassword(){
		DotSession ds = DotSession.getVTSession(request);
		log.info("dqbm:"+dqbm);
		initPassService.initPasswordByDqbm(ds,dqbm);
		return null;
	}
	
	private String dqbm;
	public String getDqbm() {
		return dqbm;
	}
	public void setDqbm(String dqbm) {
		this.dqbm = dqbm;
	}
}
