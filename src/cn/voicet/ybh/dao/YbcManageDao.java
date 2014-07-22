package cn.voicet.ybh.dao;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbcManageForm;

public interface YbcManageDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YbcManageDaoImpl";
	void getSelectedCunList(DotSession ds);
	Map queryCunYbhInfoWithYear(DotSession ds, YbcManageForm ybcManageForm);
	void getYbhYearInfo(DotSession ds);
	void getYbcYearInfo(DotSession ds);
}
