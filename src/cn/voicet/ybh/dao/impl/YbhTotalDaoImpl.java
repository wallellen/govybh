package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.YbhTotalDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhTotalForm;

@Repository(YbhTotalDao.SERVICE_NAME)
@SuppressWarnings("unchecked")
public class YbhTotalDaoImpl extends BaseDaoImpl implements YbhTotalDao {

	public void getYbhYearInfo(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call sp_report_list(?,?)}");
				cs.setString(1, "ybh_year_items");
				cs.setInt(2, 0);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list = new ArrayList();	
				if(rs!=null){
					while (rs.next()) {
		        		ds.list.add(rs.getString("rid"));
					}
				}
				return null;
			}
		});
	}

	
	public void getYbhTotalInfo(final DotSession ds, final YbhTotalForm ybhTotalForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = null;
				if(ybhTotalForm.getZhibiao().equals("cun"))
				{
					cs = conn.prepareCall("{call ybh_look_100chun(?,?,?,?)}");
				}
				else if(ybhTotalForm.getZhibiao().equals("hu"))
				{
					cs = conn.prepareCall("{call ybh_look_1000hu(?,?,?,?)}");
				}
				cs.setString(1, ds.rbm);
				cs.setString(2, ybhTotalForm.getYear());
				cs.setInt(3, ybhTotalForm.getMode());
				cs.setInt(4, 1);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				if(null != rs){
					while(rs.next()){
						ResultSetMetaData rsm =rs.getMetaData();
						int colCount = rsm.getColumnCount();
						String colName;
						for(int i=1; i<=colCount; i++)
						{
							//获取数据类型
							int dataType = rsm.getColumnType(i);
							colName=rsm.getColumnName(i).toLowerCase();
							if(dataType==3)
							{
								ds.map.put(colName, rs.getFloat(i));
							}
							else
							{
								ds.map.put(colName, rs.getString(i));
							}
						}
					}
				}
				return null;
			}
		});
	}
}
