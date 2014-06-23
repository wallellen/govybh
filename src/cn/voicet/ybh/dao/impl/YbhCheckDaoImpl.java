package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.YbhCheckDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.web.form.YbhCheckForm;

@Repository(YbhCheckDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YbhCheckDaoImpl extends BaseDaoImpl implements YbhCheckDao {

	/** 显示样本户列表 */
	public void getYbhListByCurBM(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_bm_describle(?,?,?)}");
				cs.setString(1, ds.curBM);
				cs.setInt(2, 0);
				cs.setInt(3, 1);
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

	public void selectYbhWithOpcode(final YbhCheckForm ybhCheckForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_hu_select(?,?,?)}");
				cs.setString(1, ybhCheckForm.getHm());
				cs.setInt(2, ybhCheckForm.getOpcode());
				cs.setInt(3, 1);
				cs.execute();
				return null;
			}
		});
	}

}
