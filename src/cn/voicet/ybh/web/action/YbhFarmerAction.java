package cn.voicet.ybh.web.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhFarmerService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.util.ExcelTemplateGenerator;
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
		DotSession ds = DotSession.getVTSession(request);
		ybhFarmerService.getSelectedXianList(ds);
		Map map;
		int tid = 0;
		String html;
		String h_tab;
		String h_content;
		boolean bhavecontent=false;
		h_tab = "<div class='Menubox'>";
		h_tab += "<ul>";
		h_content = "<div class='Contentbox'>";
		//
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
				
				//<input type="checkbox" onclick="selectXian('123','中国')"/>
				h_content += "<li>"
					+"<input type='checkbox' id='"+map.get("bm")+"' name='chkbox' value='"+map.get("oname")+"' " +
							"onclick='selectXian()'/>"
					+"<label for='"+map.get("bm")+"' style='cursor:pointer'>"
					+map.get("oname")
					+"</label>"
					+"</li>";
			}
		}
		h_tab += "</ul>";
		//
		h_tab += "<script type='text/javascript'>";
		h_tab += "document.getElementById('menu1').className='hover'";
		h_tab += "</script>";
		//	
		h_tab += "</div>";
		h_tab = h_tab.replace("#tabnum#", String.valueOf(tid));
		
		h_content += "</div>";
		html = h_tab + h_content;
		//request.setAttribute("h", html);
		ds.html = html;
		
		if(null==ds.map.get("xmNameList"))
		{
			ds.map.put("xmNameList", "[全省]");
		}
		return "show_farmer";
	}
	
	public String queryFarmer()	{
		DotSession ds = DotSession.getVTSession(request);
		ds.map.put("qarr", ybhFarmerForm.getQstr());
		log.info("xmCodeList:"+ybhFarmerForm.getXmlist()+", xmNameList:"+ybhFarmerForm.getXmname());
		ds.map.put("xmCodeList", ybhFarmerForm.getXmlist());
		ds.map.put("xmNameList", ybhFarmerForm.getXmname());
		ybhFarmerService.getFarmerInfoList(ds, ybhFarmerForm);
		return "show_farmer";
	}
	
	/** 导出样本户农户信息 */
	public String exportFarmerInfo() throws Exception{
		DotSession ds = DotSession.getVTSession(request);
		log.info("xmlist:"+ybhFarmerForm.getXmlist());
		ybhFarmerService.getAllFarmerInfoList(ds, ybhFarmerForm);
		//从上次查询的list中取数据ds.list
		log.info("list2 size:"+ds.list2.size());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "nhcx"+format.format(new Date())+".xls";
	    String filePath = request.getSession().getServletContext().getRealPath("excelTemplate")+"/"+"farmer.xls";
	    ExcelTemplateGenerator generator = new ExcelTemplateGenerator(filePath, fileName, 1, ds.list2);
	    generator.setColList("hm,govname,hname");
	    generator.setDrawBoard();
	    generator.setEffectColNum(3);
	    generator.exportExcelWithTemplate(response);
		return null;
	}
	
}
