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

import cn.voicet.ybh.dao.YbcManageDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbcManageForm;

@Repository(YbcManageDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YbcManageDaoImpl extends BaseDaoImpl implements YbcManageDao {

	public void getSelectedCunList(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_chun_list(?,?)}");
				cs.setString(1, ds.rbm);
				cs.setInt(2, 1);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				ds.initData();
				ds.list = new ArrayList();	
				Map map;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						ds.putMapDataByColName(map, rs);
		        		ds.list.add(map);
					}
				}
				return null;
			}
		});
	}


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
	
	public Map queryCunYbhInfoWithYear(final DotSession ds, final YbcManageForm ybcManageForm) {
		Map map = (Map)this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_chunyear_query(?,?,?)}");
				cs.setString(1, ybcManageForm.getCunbm());
				cs.setString(2, ybcManageForm.getYear());
				cs.setInt(3, 1);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				Map map = null;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						ResultSetMetaData rsm =rs.getMetaData();
						int colCount = rsm.getColumnCount();
						String colName;
						for(int i=1; i<=colCount; i++)
						{
							//获取数据类型
							int dataType = rsm.getColumnType(i);
							colName=rsm.getColumnName(i);
							if(dataType==3)
							{
								map.put(colName, rs.getFloat(i));
							}
							else
							{
								map.put(colName, rs.getString(i));
							}
						}
					}
				}
				return map;
			}
		});
		return map;
	}
}
