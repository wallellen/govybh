package cn.voicet.ybh.web.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbhMemberService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.util.ExcelTemplateGenerator;
import cn.voicet.ybh.web.form.YbhMemberForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybhMemberAction")
@Scope(value="prototype")
@SuppressWarnings({"serial","unchecked"})
public class YbhMemberAction extends BaseAction implements ModelDriven<YbhMemberForm>{
	private static Logger log = Logger.getLogger(YbhMemberAction.class);
	
	@Resource(name=YbhMemberService.SERVICE_NAME)
	private YbhMemberService ybhMemberService;
	private YbhMemberForm ybhMemberForm = new YbhMemberForm();
	
	public YbhMemberForm getModel() {
		return ybhMemberForm;
	}
	
	/** 样本户人口查询*/
	public String home(){
		DotSession ds = DotSession.getVTSession(request);
		getXianListHtml(ds);
		getZhibiaoHtml(ds);
		return "show_member";
	}

	private void getZhibiaoHtml(DotSession ds) {
		ybhMemberService.queryMemberZBList(ds);
		String zbHtml = "";
		boolean isShowCheck;
		Map zbMap;
		boolean isZbEffect;//zb is Effect
		String sItemSelect="";
		
		for(int i=1; i<=6; i++)
		{
			isShowCheck = false;
			isZbEffect=false;
			sItemSelect = "<li>";
			sItemSelect += "<span>";
			sItemSelect += "<select name='zbSelectId"+i+"' id='zbSelectId"+i+"' onchange=\"changeZhibiao('"+i+"')\" class='borwer-sel'>";
			sItemSelect += "<option value='0'>请选择指标</option>";
			for(int j=0; j<ds.list2.size(); j++)
			{
				zbMap = (Map) ds.list2.get(j);
				sItemSelect += "<option id='"+zbMap.get("id")+"'";
				if(null!=ybhMemberForm.getZbId() && zbMap.get("id").equals(ybhMemberForm.getZbId()[i-1])){
					isZbEffect=true;
					isShowCheck=true;
					sItemSelect += "selected='selected'";
				}
				sItemSelect += " value='"+zbMap.get("t")+"'>"+zbMap.get("name")+"</option>";
			//
			}
			sItemSelect += "</select>";
			sItemSelect += "</span>";
			//
			//yes or no radio
			sItemSelect+="&nbsp;<span class='spanCheck"+i+" #AA#'>";
			sItemSelect += "<input type='radio' name='radio_box"+i+"' #1# onclick=\"changeRadioBox('"+i+"')\"/>是";
			sItemSelect += "&nbsp;&nbsp;<input type='radio' name='radio_box"+i+"' #0# onclick=\"changeRadioBox('"+i+"')\"/>否";
			sItemSelect += "</span>";
				
				
			//check
			sItemSelect += "<input type='hidden' id='a"+i+"' name='zbId'";
			//
			if(null!=ybhMemberForm.getZbId())
			{
				sItemSelect += " value='"+ybhMemberForm.getZbId()[i-1]+"'";
			}
			sItemSelect += "/>";
			sItemSelect += "<input type='hidden' id='b"+i+"' name='chkglt'";
			
			if(null!=ybhMemberForm.getChkglt())
			{
				sItemSelect += " value='"+ybhMemberForm.getChkglt()[i-1]+"'";
			}	
			else
			{
				sItemSelect += " value='1'";
			}
			sItemSelect += "/>";
			sItemSelect += "<input type='hidden' id='c"+i+"' name='zhibiao'";
			if(null!=ybhMemberForm.getZhibiao())
			{
				sItemSelect += "value='"+ybhMemberForm.getZhibiao()[i-1]+"'";
			}	
			sItemSelect += "/>";
			sItemSelect += "</li>";
			
			if(null!=ybhMemberForm.getChkglt()&&ybhMemberForm.getChkglt()[i-1].equals("1"))
			{
				sItemSelect=sItemSelect.replace("#1#", "checked='checked'");
				sItemSelect=sItemSelect.replace("#0#", "");
			}
			else if(null!=ybhMemberForm.getChkglt()&&ybhMemberForm.getChkglt()[i-1].equals("0"))
			{
				sItemSelect=sItemSelect.replace("#1#", "");
				sItemSelect=sItemSelect.replace("#0#", "checked='checked'");
			}
			else
			{
				sItemSelect=sItemSelect.replace("#1#", "checked='checked'");
				sItemSelect=sItemSelect.replace("#0#", "");
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
			
			zbHtml+=sItemSelect;
		}
		ds.html2 = zbHtml;
	}

	private void getXianListHtml(DotSession ds) {
		ybhMemberService.getSelectedXianList(ds);
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
	}
	
	public String queryMember(){
		DotSession ds = DotSession.getVTSession(request);
		ds.map.put("marr", ybhMemberForm.getMemberstr());
		log.info("xmCodeList:"+ybhMemberForm.getXmlist()+", xmNameList:"+ybhMemberForm.getXmname());
		ds.map.put("xmCodeList", ybhMemberForm.getXmlist());
		ds.map.put("xmNameList", ybhMemberForm.getXmname());
		
		getXianListHtml(ds);
		getZhibiaoHtml(ds);
		ds.zbIds = ybhMemberForm.getZbId();
		ds.map.put("zhibiao", ybhMemberForm.getZhibiao());
		
		ybhMemberService.getMemberInfoList(ds, ybhMemberForm);
		return "show_member";
	}
	
	public String exportMemberInfo() throws Exception{
		DotSession ds = DotSession.getVTSession(request);
		log.info("xmlist:"+ybhMemberForm.getXmlist());
		ybhMemberService.getAllMemberInfoList(ds, ybhMemberForm);
		log.info("list3 size:"+ds.list3.size());
		//从上次查询的list中取数据ds.list
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = "rkcx"+format.format(new Date())+".xls";
	    String filePath = request.getSession().getServletContext().getRealPath("excelTemplate")+"/"+"member.xls";
	    ExcelTemplateGenerator generator = new ExcelTemplateGenerator(filePath, fileName, 1, ds.list3);
	    generator.setColList("hm,govname,uname,sex,age,school,education,hearth,dcno,labors,works,bla,tbfd");
	    generator.setDrawBoard();
	    generator.setEffectColNum(13);
	    generator.exportExcelWithTemplate(response);
		return null;
	}
	
}
