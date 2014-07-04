package cn.voicet.ybh.web.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhQueryService;
import cn.voicet.ybh.util.DotSession;

@Controller("ybhQueryAction")
@Scope(value="prototype")
@SuppressWarnings("serial")
public class YbhQueryAction extends BaseAction{
	private static Logger log = Logger.getLogger(YbhQueryAction.class);
	
	@Resource(name=YbhQueryService.SERVICE_NAME)
	private YbhQueryService ybhQueryService;
	
}