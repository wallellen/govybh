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

import cn.voicet.ybh.dao.YearDataDao;
import cn.voicet.ybh.util.DotSession;
import cn.voicet.ybh.util.VTJime;
import cn.voicet.ybh.web.form.YearDataForm;

@Repository(YearDataDao.SERVICE_NAME)
@SuppressWarnings({"unchecked","static-access"})
public class YearDataDaoImpl extends BaseDaoImpl implements YearDataDao {

	/** 显示样本户年数据列表 */
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

	public void getYbhListByCurBM(final DotSession ds, final YearDataForm yearDataForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_bm_describle(?,?,?,?)}");
				cs.setString(1, ds.curBM);
				cs.setInt(2, 1);
				cs.setString(3, yearDataForm.getYear());
				cs.setInt(4, 1);
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

	public Map queryCunYbhInfoWithYear(final DotSession ds, final YearDataForm yearDataForm) {
		Map map = (Map)this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_chunyear_query(?,?,?)}");
				cs.setString(1, yearDataForm.getCunbm());
				cs.setString(2, yearDataForm.getYear());
				cs.setInt(3, 1);
				cs.execute();
				ResultSet rs = cs.getResultSet();
				Map map = null;
				if(rs!=null){
					while (rs.next()) {
						map = new HashMap();
						map.put("hnt", rs.getInt("hnt"));
						map.put("rnt", rs.getInt("rnt"));
						map.put("lnt", rs.getInt("lnt"));
						map.put("ft", rs.getInt("ft"));
						map.put("inpersonal", rs.getFloat("inpersonal"));
						map.put("injy", rs.getFloat("injy"));
						map.put("fze", rs.getFloat("fze"));
						map.put("hnl", rs.getInt("hnl"));
						map.put("rnl", rs.getInt("rnl"));
						map.put("lnl", rs.getInt("lnl"));
						map.put("fl", rs.getInt("fl"));
						map.put("fps", rs.getInt("fps"));
						map.put("fps1", rs.getInt("fps1"));
						map.put("fps2", rs.getInt("fps2"));
						map.put("fps3", rs.getInt("fps3"));
						map.put("fpv", rs.getFloat("fpv"));
						map.put("fpv1", rs.getFloat("fpv1"));
						map.put("fpv2", rs.getFloat("fpv2"));
						map.put("hndt", rs.getInt("hndt"));
						map.put("nhdl", rs.getInt("nhdl"));
						map.put("vdt", rs.getFloat("vdt"));
						map.put("vdtl", rs.getFloat("vdtl"));
						map.put("vdpt", rs.getFloat("vdpt"));
						map.put("b1", rs.getInt("b1"));
						map.put("b2", rs.getInt("b2"));
						map.put("b3", rs.getInt("b3"));
						map.put("b4", rs.getInt("b4"));
						map.put("nb", rs.getInt("nb"));
					}
				}
				return map;
			}
		});
		return map;
	}

	public void saveCunYbhData(final YearDataForm yearDataForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_chunyear_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setString(1, yearDataForm.getCunbm());
				cs.setString(2, yearDataForm.getYear());
				cs.setInt(29, 1);
				String ix[][] = 
					{
						{"","o"},
						{"","o"},
						{"0","s"},
						{"2","s"},
						{"4","s"},
						{"6","s"},
						{"8","f"},
						{"9","f"},
						{"10","f"},
						{"1","s"},
						{"3","s"},
						{"5","s"},
						{"7","s"},
						{"11","s"},
						{"13","s"},
						{"15","s"},
						{"12","f"},
						{"14","f"},
						{"16","s"},
						{"18","s"},
						{"20","f"},
						{"22","f"},
						{"24","f"},
						{"17","s"},
						{"19","s"},
						{"21","s"},
						{"23","s"},
						{"25","s"},
						{"","o"}
					};
				VTJime.prepareParamFromInputArray(cs, yearDataForm.getCuntxt(), ix);
				cs.execute();
				return null;
			}
		});
	}

	public void saveYbhIncome(final YearDataForm yearDataForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_year_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
				cs.setInt(18, 1);
				String ix[][] = 
					{
						{"0","s"},
						{"1","i"},
						{"2","f"},
						{"4","f"},
						{"6","f"},
						{"8","i"},
						{"10","i"},
						{"12","i"},
						{"14","i"},
						{"16","i"},
						{"3","f"},
						{"5","f"},
						{"7","f"},
						{"9","i"},
						{"11","i"},
						{"13","i"},
						{"15","i"}
					};
				VTJime.prepareParamFromInputArray(cs, yearDataForm.getIncometxt(), ix);
				cs.execute();
				return null;
			}
		});
	}

	public void getYbhIncome(final DotSession ds, final YearDataForm yearDataForm) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_year_query(?,?,?,?)}");
				cs.setString(1, ds.rbm);
				cs.setString(2, yearDataForm.getCurhm());
				cs.setString(3, yearDataForm.getYear());
				cs.setInt(4, 1);
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
}
