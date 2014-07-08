package cn.voicet.ybh.web.action;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhFarmerService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhFarmerForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhFarmerAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhFarmerAction extends BaseAction implements ModelDriven<YbhFarmerForm>{
	private static Logger log = Logger.getLogger(YbhFarmerAction.class);
	
	@Resource(name=YbhFarmerService.SERVICE_NAME)
	private YbhFarmerService ybhFarmerService;
	private YbhFarmerForm ybhFarmerForm = new YbhFarmerForm();
	
	public YbhFarmerForm getModel() {
		return ybhFarmerForm;
	}
	
	/** 样本户农户查询 */
	public String home(){
		Map map;
		DotSession ds = DotSession.getVTSession(request);
		ybhFarmerService.getSelectedXianList(ds);
		
		String h_tab;
		h_tab = "<div class='Menubox'>";
		h_tab += "<ul>";
		for(int i=0; i<ds.list.size(); i++)
		{
			map = (Map)ds.list.get(i);
			if(map.get("st").equals("0"))
			{
				h_tab += "<li>"+map.get("oname")+"</li>";
			}
		}
		h_tab += "</ul>";
		h_tab += "</div>";
		
		request.setAttribute("h", h_tab);
		return "show_farmer";
	}
	
	public String queryFarmer()	
	{
		DotSession ds = DotSession.getVTSession(request);
		ds.map.put("qarr", ybhFarmerForm.getQstr());
		ybhFarmerService.getFarmerInfoList(ds);
		return "show_farmer";
	}
	
}
