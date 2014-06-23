package cn.voicet.ybh.dao;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.UserForm;

public interface UserDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.elecmenu.dao.impl.UserDaoImpl";
	Map<String, String> userLogin(UserForm userForm);
	Integer updateUserPassword(DotSession ds, UserForm userForm);
}
