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
	
	/** ������ũ����ѯ */
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		getXianListHtml(ds);
		getZhibiaoHtml(ds);
		
		return "show_farmer";
	}

	private void getZhibiaoHtml(DotSession ds) {
		//��ѯָ���б�
		ybhFarmerService.queryFamilyZBList(ds);
		/******************** ָ��html ************************/
		
		String zbHtml = "";
		boolean isShowCheck;
		boolean isShowInput;
		Map zbMap;
		for(int i=1; i<10; i++)
		{
			isShowCheck = false;
			isShowInput = false;
			zbHtml += "<li>";
			zbHtml += "<span>";
			zbHtml += "<select id='zbSelectId"+i+"' onchange=\"changeZhibiao('"+i+"')\" class='zb_select'>";
			zbHtml += "<option value='0'>��ѡ��ָ��</option>";
			for(int j=0; j<ds.list2.size(); j++)
			{
				zbMap = (Map) ds.list2.get(j);
				zbHtml += "<option id='"+zbMap.get("id")+"'";
				if(null!=ybhFarmerForm.getZbId() && zbMap.get("id").equals(ybhFarmerForm.getZbId()[i-1].trim())){
					isShowCheck=true;
					zbHtml += "selected='selected'";
				}
				zbHtml += " value='"+zbMap.get("t")+"'>"+zbMap.get("name")+"</option>";
			}
			zbHtml += "</select>";
			zbHtml += "</span>";
			
			if(null!=ybhFarmerForm.getChkipt() && ybhFarmerForm.getChkipt()[i-1].equals("1"))
			{
				isShowCheck = true;
				isShowInput = false;
			}
			else if(null!=ybhFarmerForm.getChkipt() && ybhFarmerForm.getChkipt()[i-1].equals("2"))
			{
				isShowCheck = false;
				isShowInput = true;
			}
			else
			{
				isShowCheck = false;
				isShowInput = false;
			}
			
			
			//check
			if(isShowCheck)
			{
				zbHtml += "&nbsp;<span class='spanCheck"+i+"'>";
				zbHtml += "<input type='checkbox' id='chk_box"+i+"' checked='checked' onclick=\"changeCheckBox('"+i+"')\"/>";
			}
			else
			{
				zbHtml += "&nbsp;<span class='spanCheck"+i+" hide'>";
				zbHtml += "<input type='checkbox' id='chk_box"+i+"' onclick=\"changeCheckBox('"+i+"')\"/>";
			}
			zbHtml += "</span>";
			
			//input
			zbHtml += "&nbsp;<span class='spanVal"+i;
			if(!isShowInput)
			{
				zbHtml += " hide'";
			}
			zbHtml += ">";
			zbHtml += "&nbsp;<span class='spanVal"+i+" hide'>";
			zbHtml += "<select id='glSelectId"+i+"' onchange=\"changeGtLt('"+i+"')\">";
			zbHtml += "<option value='1'>&gt;=</option>";
			zbHtml += "<option value='2'>&lt;=</option>";
			zbHtml += "</select>";	
			zbHtml += "&nbsp;<input type='text' class='input_off2' name='yuan' id='yuan"+i+"' onblur=\"changeZhibVal('"+i+"')\"";
			if(null!=ybhFarmerForm.getYuan())
			{
				zbHtml += " value='"+ybhFarmerForm.getYuan()[i-1]+"'";
			}
			zbHtml += "/>";
			zbHtml += "</span>";
			
			//hidden
			zbHtml += "<input type='hidden' id='a"+i+"' name='zbId'";
			if(null!=ybhFarmerForm.getZbId())
			{
				zbHtml += " value='"+ybhFarmerForm.getZbId()[i-1]+"'";
			}
			zbHtml += "/>";
			zbHtml += "<input type='hidden' id='b"+i+"' name='chkglt' value='1'/>";
			zbHtml += "<input type='hidden' id='c"+i+"' name='zhibiao'";
			if(null!=ybhFarmerForm.getZhibiao())
			{
				zbHtml += "value='"+ybhFarmerForm.getZhibiao()[i-1]+"'";
			}	
			zbHtml += "/>";
			//������ʾcheck or input

			zbHtml += "<input type='hidden' id='d"+i+"' name='chkipt'";
			if(null!=ybhFarmerForm.getChkipt())
			{
				zbHtml += " value='"+ybhFarmerForm.getChkipt()[i-1]+"'";
			}
			
			zbHtml += "/>";
			
			zbHtml += "</li>";
		}
		ds.html2 = zbHtml;
	}

	private void getXianListHtml(DotSession ds) {
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
				
				//<input type="checkbox" onclick="selectXian('123','�й�')"/>
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
		ds.html = html;
		
		if(null==ds.map.get("xmNameList"))
		{
			ds.map.put("xmNameList", "[ȫʡ]");
		}
		if(null==ybhFarmerForm.getQstr() && null!=ds.map.get("qarr")){
			ybhFarmerForm.setQstr((String[]) ds.map.get("qarr"));
		}
	}
	
	public String queryFarmer()	{
		DotSession ds = DotSession.getVTSession(request);
		ds.map.put("qarr", ybhFarmerForm.getQstr());
		log.info("qarr length:"+ybhFarmerForm.getQstr().length);
		log.info("xmCodeList:"+ybhFarmerForm.getXmlist()+", xmNameList:"+ybhFarmerForm.getXmname());
		ds.map.put("xmCodeList", ybhFarmerForm.getXmlist());
		ds.map.put("xmNameList", ybhFarmerForm.getXmname());
		log.info("year:"+ybhFarmerForm.getYear());
		getXianListHtml(ds);
		getZhibiaoHtml(ds);
		ds.zbIds = ybhFarmerForm.getZbId();
		ds.chkIpts = ybhFarmerForm.getChkipt();
		ds.zbYuan = ybhFarmerForm.getYuan();
		ds.map.put("zbYear", ybhFarmerForm.getYear());
		ds.map.put("zhibiao", ybhFarmerForm.getZhibiao());
		ybhFarmerService.getFarmerInfoList(ds, ybhFarmerForm);
		return "show_farmer";
	}
	
	/** ����������ũ����Ϣ */
	public String exportFarmerInfo() throws Exception{
		DotSession ds = DotSession.getVTSession(request);
		log.info("xmlist:"+ybhFarmerForm.getXmlist());
		ybhFarmerService.getAllFarmerInfoList(ds, ybhFarmerForm);
		//���ϴβ�ѯ��list��ȡ����ds.list
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
