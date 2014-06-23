package cn.voicet.ybh.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.ybh.util.DotRoleMenu;

@Controller("indexAction")
@Scope(value="prototype")
@SuppressWarnings("serial")
public class IndexAction extends BaseAction{

	public String index(){
		String xmlFilePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/classes/appconfig-ybh.xml");
		DotRoleMenu roleMenu = (DotRoleMenu)ServletActionContext.getServletContext().getAttribute("vta");
		if (roleMenu == null) {
			roleMenu = new DotRoleMenu();
			roleMenu.loadInfoFromXML(xmlFilePath);
			ServletActionContext.getServletContext().setAttribute("vta", roleMenu);
		}
		return "show_login";
	}
	
}
