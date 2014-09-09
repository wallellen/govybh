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
		getXianListHtml(ds);
		getZhibiaoHtml(ds);
		
		return "show_farmer";
	}

	private void getZhibiaoHtml(DotSession ds) {
		//查询指标列表
		ybhFarmerService.queryFamilyZBList(ds);
		/******************** 指标html ************************/
		
		String zbHtml = "";
		boolean isShowCheck;
		boolean isShowInput;
		boolean isShowGtlt1;
		boolean isShowGtlt2;
		boolean isZbEffect;//zb is Effect
		String sItemSelect="";
		Map zbMap;
		for(int i=1; i<=9; i++)
		{
			isShowCheck = false;
			isShowInput = false;
			isShowGtlt1 = false;
			isShowGtlt2 = false;
			isZbEffect=false;
			sItemSelect = "<li>";
			//zhiBiao Select
			sItemSelect+="<span>";
			sItemSelect += "<select id='zbSelectId"+i+"' onchange=\"changeZhibiao('"+i+"')\" class='zb_select'>";
			sItemSelect += "<option value='0'>请选择指标</option>";
			for(int j=0; j<ds.list2.size(); j++)
			{
				zbMap = (Map) ds.list2.get(j);
				sItemSelect += "<option id='"+zbMap.get("id")+"'";
				if(null!=ybhFarmerForm.getZbId() && zbMap.get("id").equals(ybhFarmerForm.getZbId()[i-1])){
					isZbEffect=true;
					sItemSelect += "selected='selected'";
				}
				sItemSelect += " value='"+zbMap.get("t")+"'>"+zbMap.get("name")+"</option>";
			}
			sItemSelect += "</select>";
			sItemSelect += "</span>";
			//
			isShowCheck = false;
			isShowInput = false;
			if(null!=ybhFarmerForm.getChkipt() )
			{
				if(ybhFarmerForm.getChkipt()[i-1].equals("1") || ybhFarmerForm.getChkipt()[i-1].equals("0"))
				{
					isShowCheck = true;
				}
				else if( ybhFarmerForm.getChkipt()[i-1].equals("2"))
				{
					isShowInput = true;
				}
			}
			//yes or no radio
			sItemSelect+="&nbsp;<span class='spanCheck"+i+" #AA#'>";
			sItemSelect += "<input type='radio' name='radio_box"+i+"' #1# onclick=\"changeRadioBox('"+i+"')\"/>是";
			sItemSelect += "&nbsp;&nbsp;<input type='radio' name='radio_box"+i+"' #0# onclick=\"changeRadioBox('"+i+"')\"/>否";
			sItemSelect += "</span>";
			//gt or lt select
			sItemSelect += "&nbsp;<span class='spanVal"+i+" #AB#'";
			sItemSelect += ">";
			sItemSelect += "<select id='glSelectId"+i+"' onchange=\"changeGtLt('"+i+"')\">";
			sItemSelect += "<option value='1' #S1#";
			sItemSelect += ">&gt;=</option>";
			sItemSelect += "<option value='2' #S2#";
			sItemSelect += ">&lt;=</option>";
			sItemSelect += "</select>";	
			//zhiBiao value input
			sItemSelect += "&nbsp;<input type='text' class='input_off2' name='yuan' id='yuan"+i+"' onblur=\"changeZhibVal('"+i+"')\" #v#";
			sItemSelect += " onkeyup=\"value=value.replace(/[^\\d]/g,'')\"";
			sItemSelect += "/>";
			sItemSelect += "</span>";
			//
			sItemSelect += "<input type='hidden' id='a"+i+"' name='zbId'";
			//
			if(null!=ybhFarmerForm.getZbId())
			{
				sItemSelect += " value='"+ybhFarmerForm.getZbId()[i-1]+"'";
			}
			sItemSelect += "/>";
			sItemSelect += "<input type='hidden' id='b"+i+"' name='chkglt'";
			
			if(null!=ybhFarmerForm.getChkglt())
			{
				sItemSelect += " value='"+ybhFarmerForm.getChkglt()[i-1]+"'";
			}	
			else
			{
				sItemSelect += " value='1'";
			}
			sItemSelect += "/>";
			sItemSelect += "<input type='hidden' id='c"+i+"' name='zhibiao'";
			if(null!=ybhFarmerForm.getZhibiao())
			{
				sItemSelect += "value='"+ybhFarmerForm.getZhibiao()[i-1]+"'";
			}	
			sItemSelect += "/>";
			//控制显示check or input
			sItemSelect += "<input type='hidden' id='d"+i+"' name='chkipt'";
			if(null!=ybhFarmerForm.getChkipt())
			{
				sItemSelect += " value='"+ybhFarmerForm.getChkipt()[i-1]+"'";
			}
			sItemSelect += "/>";
			sItemSelect += "</li>";
			//Replace dynamic for check box
			if(null!=ybhFarmerForm.getChkglt()&&ybhFarmerForm.getChkglt()[i-1].equals("1"))
			{
				sItemSelect=sItemSelect.replace("#1#", "checked='checked'");
				sItemSelect=sItemSelect.replace("#0#", "");
			}
			else if(null!=ybhFarmerForm.getChkglt()&&ybhFarmerForm.getChkglt()[i-1].equals("0"))
			{
				sItemSelect=sItemSelect.replace("#1#", "");
				sItemSelect=sItemSelect.replace("#0#", "checked='checked'");
			}
			else
			{
				sItemSelect=sItemSelect.replace("#1#", "checked='checked'");
				sItemSelect=sItemSelect.replace("#0#", "");
			}
			//Replace Lg eg
			if(null!=ybhFarmerForm.getChkglt()&&ybhFarmerForm.getChkglt()[i-1].equals("2"))
			{
				isShowGtlt2 = true;
			}
			if(isShowGtlt2)
			{
				sItemSelect=sItemSelect.replace("#S1#","");
				sItemSelect=sItemSelect.replace("#S2#"," selected='selected'");
			}
			else
			{
				sItemSelect=sItemSelect.replace("#S1#"," selected='selected'");
				sItemSelect=sItemSelect.replace("#S2#","");
				
			}
			//
			if(isZbEffect=true&&isShowCheck)
			{
				sItemSelect=sItemSelect.replace("#AA#","");
			}
			else
			{
				sItemSelect=sItemSelect.replace("#AA#","hide");
			}
			if(isZbEffect=true&&isShowInput)
			{
				sItemSelect=sItemSelect.replace("#AB#","");
			}
			else
			{
				sItemSelect=sItemSelect.replace("#AB#","hide");
			}
			//
			if(null!=ybhFarmerForm.getYuan())
			{
				sItemSelect=sItemSelect.replace("#v#"," value='"+ybhFarmerForm.getYuan()[i-1]+"'");
			}
			else
			{
				sItemSelect=sItemSelect.replace("#v#","");
			}
			zbHtml+=sItemSelect;
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
		ds.html = html;
		
		if(null==ds.map.get("xmNameList"))
		{
			ds.map.put("xmNameList", "[全省]");
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
	
	/** 导出样本户农户信息 */
	public String exportFarmerInfo() throws Exception{
		DotSession ds = DotSession.getVTSession(request);
		log.info("xmlist:"+ybhFarmerForm.getXmlist());
		ybhFarmerService.getAllFarmerInfoList(ds, ybhFarmerForm);
		//从上次查询的list中取数据ds.list
		log.info("list3 size:"+ds.list3.size());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "nhcx"+format.format(new Date())+".xls";
	    String filePath = request.getSession().getServletContext().getRealPath("excelTemplate")+"/"+"farmer.xls";
	    ExcelTemplateGenerator generator = new ExcelTemplateGenerator(filePath, fileName, 1, ds.list3);
	    generator.setColList("hm,govname,hname");
	    generator.setDrawBoard();
	    generator.setEffectColNum(3);
	    generator.exportExcelWithTemplate(response);
		return null;
	}
	
}
