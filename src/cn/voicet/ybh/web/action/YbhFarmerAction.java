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
		int tid = 0;
		DotSession ds = DotSession.getVTSession(request);
		ybhFarmerService.getSelectedXianList(ds);
		
		String html;
		String h_tab;
		String h_content;
		boolean bhavecontent=false;
		h_tab = "<div class='Menubox'>";
		h_tab += "<ul>";
		h_content = "<div class='Contentbox'>";
		
		for(int i=0; i<ds.list.size(); i++)
		{
			map = (Map)ds.list.get(i);
			if(map.get("st").equals("0"))
			{
				tid++;
				h_tab += "<li id='menu"+tid+"' onmouseover=\"setTab('menu',"+tid+",#tabnum#)\">"+map.get("oname")+"</li>";
				if(bhavecontent){
					h_content+="</ul>";
					h_content += "</div>";
					bhavecontent = false;
				}
			}
			else if(map.get("st").equals("1"))
			{
				if(!bhavecontent){
					if(tid>1){
						h_content += "<div id='con_menu_"+tid+"' style='display:none'>";
					}else{
						h_content += "<div id='con_menu_"+tid+"'>";
					}
					h_content += "<ul>";
					bhavecontent=true;
				}
				h_content += "<li>"+"<input type='checkbox'/>"+map.get("oname")+"</li>";
			}
		}
		h_tab += "</ul>";
		
		h_tab += "<script type='text/javascript'>";
		h_tab += "document.getElementById('menu1').className='hover'";
		h_tab += "</script>";
		
		h_tab += "</div>";
		h_tab = h_tab.replace("#tabnum#", String.valueOf(tid));
		
		h_content += "</div>";
	
		html = h_tab+h_content;
		request.setAttribute("h", html);
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
