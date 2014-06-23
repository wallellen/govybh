package cn.voicet.ybh.service;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.UserForm;

public interface UserService {
	public final static String SERVICE_NAME = "cn.voicet.elecmenu.service.impl.UserServiceImpl";
	Map<String, String> userLogin(UserForm userForm);
	Integer updateUserPassword(DotSession ds, UserForm userForm);
}
