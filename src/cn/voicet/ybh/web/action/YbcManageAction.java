package cn.voicet.ybh.web.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.service.YbcManageService;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbcManageForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("ybcManageAction")
@Scope(value = "prototype")
@SuppressWarnings( { "serial", "unchecked" })
public class YbcManageAction extends BaseAction implements
		ModelDriven<YbcManageForm> {
	private static Logger log = Logger.getLogger(YbcManageAction.class);

	@Resource(name = YbcManageService.SERVICE_NAME)
	private YbcManageService ybcManageService;
	
	private YbcManageForm ybcManageForm = new YbcManageForm();

	public YbcManageForm getModel() {
		return ybcManageForm;
	}

	/** 年数据录入首页 */
	public String viewYear(){
		DotSession ds = DotSession.getVTSession(request);
		ybcManageService.getYbcYearInfo(ds);
		log.info("加载年数据录入年列表页面... ");
		return "show_ybc_year";
	}
	
	
	String splitName[] = { "", "", "苏北5市", "苏北22个县", "矛山革命老区", "黄桥老区", "苏中" };

	public String home() {
		Map map;
		String html = null;
		String h_content;
		String h_tab = "";
		String lmid = "";
		String sXXCName[]=new String[3];
		boolean bf1 = false;
		boolean bf2 = false;
		int r1 = 0;
		int r2 = 0;
		int rtpn = 0;// Tab count
		DotSession ds = DotSession.getVTSession(request);
		ds.map.put("ybhyear", ybcManageForm.getYear());
		ybcManageService.getSelectedCunList(ds);
		//省
		if(ds.rbm.length()==2)
		{
			h_tab = "<div class='Menubox'>";
			h_tab += "<ul>";
			h_content = "<div class='Contentbox'> ";
			int tid = 0;
			for (int i=0; i<ds.list.size(); i++) {
				map = (Map) ds.list.get(i);
				if (!map.get("mid").equals(lmid)) {
					tid++;
					rtpn++;
					if (lmid.length() > 0) {
						h_content += "</table>";
						h_content += "</div>";
						h_content += "<div id='con_menu_" + tid
						+ "' style='display:none'>";
					}
					else{
						h_content += "<div id='con_menu_" + tid + "'>";
					}
					h_content += "<table cellspacing='0' cellpadding='0' width='100%'>";
					h_content += "<tr class='tabtr1'>" +
							"<td width='20%'>市名</td>" +
							"<td width='20%'>县名</td>" +
							"<td width='20%'>样本村名称</td>" +
							"<td width='20%'>样本户数</td>" +
							"<td width='20%'>操作</td>" +
							"</tr>";
					h_tab += "<li id=\"menu"
							+ tid
							+ "\" onmouseover=\"setTab('menu',"
							+ tid
							+ ",#tabnum#)\">"
							+ splitName[Integer.parseInt(map.get("mid").toString())]
							+ "</li>";
					lmid = map.get("mid").toString();

				}
				int ol = Integer.parseInt(map.get("ol").toString());
				if (ol == 2) {
					r1 = Integer.parseInt(map.get("t").toString());
					bf1 = true;
				} else if (ol == 3) {
					bf2 = true;
					r2 = Integer.parseInt(map.get("t").toString());
				} else if (ol == 5) {
					r1--;
					r2--;
				}

				if (bf1) {
					h_content += "<tr>";
					h_content += "<td rowspan='" + map.get("t") + "' title='编码:&nbsp;"+map.get("bm")+"&#13;市名:&nbsp;"+map.get("oname")+"&#13;样本村(村):&nbsp;"+map.get("cn")+"&#13;样本户(户):&nbsp;"+map.get("hn")+"'>"
							+ map.get("oname") + "</td>";
					sXXCName[0]=(String)map.get("oname");
					bf1 = false;
				} else if (bf2) {
					h_content += "<td rowspan='" + map.get("t") + "' title='编码:&nbsp;"+map.get("bm")+"&#13;县名:&nbsp;"+map.get("oname")+"&#13;样本村(村):&nbsp;"+map.get("cn")+"&#13;样本户(户):&nbsp;"+map.get("hn")+"'>"
							+ map.get("oname") + "</td>";
					sXXCName[1]=(String)map.get("oname");
					bf2 = false;
				} else {
					h_content += "<td title='编码:&nbsp;"+map.get("bm")+"&#13;样本村名称:&nbsp;"+map.get("oname")+"&#13;样本户(户):&nbsp;"+map.get("hn")+"'>" 
							+ map.get("oname").toString() + "</td>";
					sXXCName[2]=sXXCName[0]+"/"+sXXCName[1]+"/"+(String)map.get("oname");
					h_content += "<td>" + map.get("hn").toString() + "</td>";
					h_content += "<td>" +
							"<a href='ybhManageAction_viewYbh.action?viewBM="+map.get("bm")+"&oname="+map.get("oname")+"&rtybc=ybc'>查看样本户</a>" +
							"&nbsp;&nbsp;<a href='ybcManageAction_viewYear.action?cunbm="+map.get("bm")+"&oname="+sXXCName[2]+"'>进入村指标</a>" +
							"</td>";
					h_content += "</tr>";
				}
			}
			if (lmid.length() > 0) {
				h_content += "</table>";
				h_content += "</div>";
			}
			h_content += "</div>";
			h_tab += "</ul>";

			h_tab += "<script type='text/javascript'>";
			h_tab += "document.getElementById('menu1').className='hover'";
			h_tab += "</script>";

			h_tab += "</div>";
			h_tab = h_tab.replace("#tabnum#", String.valueOf(rtpn));
			html = "<div id='Tab'>" + h_tab + h_content + "</div>";
		}
		//市
		else if(ds.rbm.length()==4)
		{
			h_content = "<div class='Contentbox_shi'>";
			h_content += "<table cellspacing='0' cellpadding='0' width='100%'>";
			h_content += "<tr class='tabtr1'>" +
			"<td width='25%'>县名</td>" +
			"<td width='25%'>样本村名称</td>" +
			"<td width='25%'>样本户数</td>" +
			"<td width='25%'>操作</td>" +
			"</tr>";
			for (int i=0; i<ds.list.size(); i++) {
				map = (Map) ds.list.get(i);
				int ol = Integer.parseInt(map.get("ol").toString());
				if(ol==3){
					bf2 = true;
					r2 = Integer.parseInt(map.get("t").toString());
				}
				
				if (bf2) {
					h_content += "<tr>";
					h_content += "<td rowspan='" + map.get("t") + "' title='编码:&nbsp;"+map.get("bm")+"&#13;县名:&nbsp;"+map.get("oname")+"&#13;样本村(村):&nbsp;"+map.get("cn")+"&#13;样本户(户):&nbsp;"+map.get("hn")+"'>"
							+ map.get("oname") + "</td>";
					sXXCName[0]=(String)map.get("oname");
					bf2 = false;
				}else {
					h_content += "<td title='编码:&nbsp;"+map.get("bm")+"&#13;样本村名称:&nbsp;"+map.get("oname")+"&#13;样本户(户):&nbsp;"+map.get("hn")+"'>" 
					+ map.get("oname").toString() + "</td>";
					sXXCName[2]=sXXCName[0]+"/"+(String)map.get("oname");
					h_content += "<td>" + map.get("hn").toString() + "</td>";
					h_content += "<td>" +
							"<a href='ybhManageAction_viewYbh.action?viewBM="+map.get("bm")+"&oname="+map.get("oname")+"&rtybc=ybc'>查看样本户</a>" +
							"&nbsp;&nbsp;<a href='ybcManageAction_viewYear.action?cunbm="+map.get("bm")+"&oname="+sXXCName[2]+"'>进入村指标</a>" +
							"</td>";
					h_content += "</tr>";
				}
			}
			h_content += "</div>";
			html = h_content;
		}
		//县
		else if(ds.rbm.length()==6)
		{
			h_content = "<div class='Contentbox_shi'>";
			h_content += "<table cellspacing='0' cellpadding='0' width='100%'>";
			h_content += "<tr class='tabtr1'>" +
			"<td width='30%'>样本村名称</td>" +
			"<td width='30%'>样本户数</td>" +
			"<td width='30%'>操作</td>" +
			"</tr>";
			for (int i=0; i<ds.list.size(); i++) {
				map = (Map) ds.list.get(i);
				h_content += "<tr>";
				h_content += "<td title='编码:&nbsp;"+map.get("bm")+"&#13;样本村名称:&nbsp;"+map.get("oname")+"&#13;样本户(户):&nbsp;"+map.get("hn")+"'>" 
				+ map.get("oname").toString() + "</td>";
		
				h_content += "<td>" + map.get("hn").toString() + "</td>";
				h_content += "<td>" +
						"<a href='ybhManageAction_viewYbcToYbh.action?viewBM="+map.get("bm")+"&oname="+map.get("oname")+"&rtybc=ybc'>查看样本户</a>" +
						"&nbsp;&nbsp;<a href='ybcManageAction_viewYear.action?cunbm="+map.get("bm")+"&oname="+map.get("oname")+"&year="+ds.map.get("ybhyear")+"'>进入村指标</a>" +
						"</td>";
				h_content += "</tr>";
			}
			h_content += "</div>";
			html = h_content;
		}
		
		request.setAttribute("h", html);
		return "show_ybc_manage";
	}
	
	public String viewCunzb(){
		DotSession ds = DotSession.getVTSession(request);
		ybcManageService.getYbhYearInfo(ds);
		log.info("viewCunzb year:"+ybcManageForm.getYear());
		cunMap = ybcManageService.queryCunYbhInfoWithYear(ds, ybcManageForm);
		request.setAttribute("cunMap", cunMap);
		rflag=rflag+1;
		log.info("cunMap data:"+cunMap);
		return "show_ybc_zhibiao";
	}
	
	private Map cunMap;
	private int rflag=1;
	public Map getCunMap() {
		return cunMap;
	}
	public void setCunMap(Map cunMap) {
		this.cunMap = cunMap;
	}
	public int getRflag() {
		return rflag;
	}
	public void setRflag(int rflag) {
		this.rflag = rflag;
	}
	
}
