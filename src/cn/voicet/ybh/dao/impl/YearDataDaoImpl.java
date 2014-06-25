package cn.voicet.ybh.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.stereotype.Repository;

import cn.voicet.ybh.dao.YearDataDao;
import cn.voicet.ybh.util.DotSession;
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

	public void getYbhListByCurBM(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_bm_describle(?,?,?,?)}");
				cs.setString(1, ds.curBM);
				cs.setInt(2, 1);
				cs.setInt(3, 2014);
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
				cs.setInt(2, yearDataForm.getYear());
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
				cs.setInt(2, yearDataForm.getYear());
				//村基本情况
				cs.setString(3, yearDataForm.getCuntxt()[0]);
				cs.setString(4,  yearDataForm.getCuntxt()[2]);
				cs.setString(5,  yearDataForm.getCuntxt()[4]);
				cs.setString(6, yearDataForm.getCuntxt()[6]);
				cs.setFloat(7, Float.parseFloat(yearDataForm.getCuntxt()[8]));
				cs.setFloat(8, Float.parseFloat(yearDataForm.getCuntxt()[9]));
				cs.setFloat(9, Float.parseFloat(yearDataForm.getCuntxt()[10]));
				//建档立卡低收入农户基本情况
				cs.setString(10, yearDataForm.getCuntxt()[1]);
				cs.setString(11, yearDataForm.getCuntxt()[3]);
				cs.setString(12, yearDataForm.getCuntxt()[5]);
				cs.setString(13, yearDataForm.getCuntxt()[7]);
				//扶贫项目落实情况
				//cs.setInt(14, yearDataForm.getFps());
				cs.setString(14, yearDataForm.getCuntxt()[11]);
				cs.setString(15, yearDataForm.getCuntxt()[13]);
				cs.setString(16, yearDataForm.getCuntxt()[15]);
				//扶贫资金落实情况
				//cs.setString(18, yearDataForm.getFpv());
				cs.setFloat(17, Float.parseFloat(yearDataForm.getCuntxt()[12]));
				cs.setFloat(18, Float.parseFloat(yearDataForm.getCuntxt()[14]));
				//扶贫小额贷款使用情况
				cs.setString(19, yearDataForm.getCuntxt()[16]);
				cs.setString(20, yearDataForm.getCuntxt()[18]);
				cs.setFloat(21, Float.parseFloat(yearDataForm.getCuntxt()[20]));
				cs.setFloat(22, Float.parseFloat(yearDataForm.getCuntxt()[22]));
				cs.setFloat(23, Float.parseFloat(yearDataForm.getCuntxt()[24]));
				//建档立卡低收入农户参加主要社会保障情况
				cs.setString(24, yearDataForm.getCuntxt()[17]);
				cs.setString(25, yearDataForm.getCuntxt()[19]);
				cs.setString(26, yearDataForm.getCuntxt()[21]);
				cs.setString(27, yearDataForm.getCuntxt()[23]);
				cs.setString(28, yearDataForm.getCuntxt()[25]);
				cs.setInt(29, 1);
				cs.execute();
				return null;
			}
		});
	}

	public void getYbhFamilyDetailInfo(final DotSession ds) {
		this.getJdbcTemplate().execute(new ConnectionCallback() {
			public Object doInConnection(Connection conn) throws SQLException,
					DataAccessException {
				CallableStatement cs = conn.prepareCall("{call ybh_family_detail(?)}");
				cs.setString(1, ds.curHM);
				cs.execute();
				ResultSet rs = null;
				int rid=0;
				int updateCount = -1;
				Map map;
				do{
					updateCount = cs.getUpdateCount();
					if(updateCount != -1){	
						cs.getMoreResults();
						continue;
					}
					rs = cs.getResultSet();
					if(null != rs){
						while(rs.next()){
							if(rid ==0){
								int i=1;
								ds.map.put("hm", rs.getString(i++));
								ds.map.put("hname", rs.getString(i++));
								ds.map.put("zhu", rs.getString(i++));
								ds.map.put("population", rs.getString(i++));
								ds.map.put("labornum", rs.getString(i++));
								ds.map.put("fields", rs.getString(i++));
								ds.map.put("house", rs.getString(i++));
								ds.map.put("property", rs.getString(i++));
								ds.map.put("telnum", rs.getString(i++));
								ds.map.put("dcause", rs.getString(i++));
								ds.map.put("idcno", rs.getString(i++));
								ds.map.put("frname", rs.getString(i++));
								ds.map.put("frtel", rs.getString(i++));
								ds.map.put("frwork", rs.getString(i++));
							}else if (rid == 1 ){
								int i=1;
								map = new HashMap();
								map.put("mid", rs.getString(i++));
								map.put("uname", rs.getString(i++));
								map.put("sex", rs.getString(i++));
								map.put("age", rs.getString(i++));
								map.put("school", rs.getString(i++));
								map.put("education", rs.getString(i++));
								map.put("health", rs.getString(i++));
								map.put("dcno", rs.getString(i++));
								map.put("labors", rs.getString(i++));
								map.put("works", rs.getString(i++));
								map.put("bla", rs.getString(i++));
								map.put("tbfd", rs.getString(i++));
								ds.list.add(map);
							}else if(rid == 2){
								int i=1;
								map = new HashMap();
								map.put("year", rs.getString(i++));
								map.put("inTotal", rs.getString(i++));
								map.put("injy", rs.getString(i++));
								map.put("inWork", rs.getString(i++));
								map.put("incz", rs.getString(i++));
								map.put("inPersonal", rs.getString(i++));
								ds.list2.add(map);
							}
						}
					}
					if(rs != null){
						cs.getMoreResults();
						rid++;
						continue;
					}
				}while(!(updateCount == -1 && rs == null));
				return null;
			}
		});
		
	}

}
