package cn.voicet.ybh.dao;

import java.util.Map;

import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YearDataForm;

public interface YearDataDao extends BaseDao{
	public final static String SERVICE_NAME = "cn.voicet.ybh.dao.impl.YearDataDaoImpl";
	void getYbhYearInfo(DotSession ds);
	void getYbhListByCurBM(DotSession ds);
	Map queryCunYbhInfoWithYear(DotSession ds, YearDataForm yearDataForm);
	void saveCunYbhData(YearDataForm yearDataForm);
}
