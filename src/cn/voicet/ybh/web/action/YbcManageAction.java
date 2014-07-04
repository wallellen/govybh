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

	String splitName[] = { "", "", ":苏北5市", "苏北22个县", "矛山革命老区", "黄桥老区", "苏中" };

	public String home() {
		Map map;
		String html;
		String h_content;
		String h_tab = "";
		String lmid = "";
		String js = "";
		boolean bf1 = false;
		boolean bf2 = false;
		int r1 = 0;
		int r2 = 0;
		int rtpn = 0;// Tab count
		DotSession ds = DotSession.getVTSession(request);
		ybcManageService.getSelectedCunList(ds);
		log.info("has login");
		// html+="";
		h_tab = "<div class='Menubox'>";
		h_tab += "<ul>";
		h_content = "<div class='Contentbox'> ";
		int tid = 0;
		for (int i = 0; i < ds.list.size(); i++) {
			map = (Map) ds.list.get(i);
			if (!map.get("mid").equals(lmid)) {
				tid++;
				rtpn++;
				// hsplit+=;
				if (lmid.length() > 0) {
					h_content += "</table>";
					h_content += "</div>";
				}
				if (tid > 1) {
					h_content += "<div id='con_menu_" + tid
							+ "' style='display:none'>";
				} else {
					h_content += "<div id='con_menu_" + tid + "'>";
				}

				h_content += "<table cellpadding='0' border='1' width='100%'>";
				h_tab += "<li id=\"menu"
						+ tid
						+ "\" onmouseover=\"setTab('menu',"
						+ tid
						+ ",#tabnum#)\">"
						+ splitName[Integer.parseInt(map.get("mid").toString())]
						+ "</li>";
				lmid = map.get("mid").toString();

			}
			// if(map.get("mid").equals("2") || true){
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
				h_content += "<th rowspan='" + map.get("t") + "'>"
						+ map.get("oname") + "</th>";
				bf1 = false;
			} else if (bf2) {
				h_content += "<td rowspan='" + map.get("t") + "'>"
						+ map.get("oname") + "</td>";
				bf2 = false;
			} else {
				h_content += "<td>" + map.get("oname").toString() + "</td>";
				h_content += "</tr>";
			}
			// }
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
		// h_tab.replace("#","\"");
		// String html =
		// "<table cellpadding='0' cellpadding='0' border='1' width='100%'><th rowspan='3'>A</th><td rowspan='2'>AA</td><td>AAA</td></tr><tr><td>AAA</td></tr><tr><td>AA</td><td>AAA</td></tr></table>";
		request.setAttribute("h", html);
		return "show_test";
	}

}
