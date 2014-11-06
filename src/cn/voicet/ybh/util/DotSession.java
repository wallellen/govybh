package cn.voicet.ybh.util;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@SuppressWarnings("unchecked")
public class DotSession {

	public String account;
	public String password;
	public String username;
	public String roleName;
	public String roleID;
	public SubPathTitle subPathTitle;
	public String rbm;
	public String rbn;
	public String curBM;
	public String curHM;
	public String navPath;
	public String opCode;//opera code tlype
	public int isedit;
	public int workyear;	//宸ヤ綔骞?
	public int yearlock;	//骞撮攣瀹?
	public int curGolbalPage;//鍏ㄥ眬褰撳墠椤?
	
	//private List stackList;
	public Map map;
	public List list;
	public List list2;
	public List list3;
	public List list4;
	public List list5;
	public int curYear;	//褰撳墠骞翠唤
	private int stackPos=0;
	private StackInfo[] arrayStackInfo;
	
	public String bmhm;
	
	public int sflag;
	
	public String html;
	public String html2;
	
	public String[] zbIds;
	public String[] chkIpts;
	public String[] zbYuan;
	
	private class StackInfo{
		
		public StackInfo(){}
		List list;
		List list2;
		List list3;
		List list4;
		List list5;
	}
	public void pushAllList() {
		if(stackPos<8){
			arrayStackInfo[stackPos].list=list;
			arrayStackInfo[stackPos].list2=list2;
			arrayStackInfo[stackPos].list3=list3;
			arrayStackInfo[stackPos].list4=list4;
			arrayStackInfo[stackPos++].list5=list5;
		}
		System.out.println("pushAllList cur:"+stackPos);
	}
	public int getStackLevel(){
		return stackPos;
	}
	public boolean hasStack() {
		return stackPos>0;
	}
	
	public void popAllList() {
		if(stackPos>0){
			list=arrayStackInfo[--stackPos].list;
			list2=arrayStackInfo[stackPos].list2;
			list3=arrayStackInfo[stackPos].list3;
			list4=arrayStackInfo[stackPos].list4;
			list5=arrayStackInfo[stackPos].list5;
			arrayStackInfo[stackPos].list=null;
			arrayStackInfo[stackPos].list2=null;
			arrayStackInfo[stackPos].list3=null;
			arrayStackInfo[stackPos].list4=null;
			arrayStackInfo[stackPos].list5=null;
		}
	}
	
	public void clearStack(){
		for(int i=0;i<stackPos;i++){
			arrayStackInfo[i].list=null;
			arrayStackInfo[i].list2=null;
			arrayStackInfo[i].list3=null;
			arrayStackInfo[i].list4=null;
			arrayStackInfo[i].list5=null;
		}
		stackPos=0;
	}
	
	public void popAllList(int iPos){
		for(;iPos<stackPos;){
			popAllList();
		}
	}
	
	public void initData() {
		list = new ArrayList();
		list2 = new ArrayList();
		list3 = new ArrayList();
		list4 = new ArrayList();
		list5 = new ArrayList();
	}
	
	public void emptyData() {
		map=null;
		list=null;;
		list2=null;
		list3=null;
		list4=null;
		list5=null;
	}
	
	public DotSession() {
		account = "none";
		roleName = "none";
		curBM="";
		roleID = "0";
		opCode = "";
		map = new HashMap();
		subPathTitle = new SubPathTitle();
		curYear = Calendar.getInstance().get(Calendar.YEAR);
		list5=null;
		//
		arrayStackInfo = new StackInfo[8];
		for (int i=0; i<8; i++) {
			arrayStackInfo[i] = new StackInfo();
		}
		sflag=0;
	}
	
	public void clear() {
		account = "none";
		roleID = "0";
	} 
	
	public static DotSession getVTSession(HttpSession session) {
		DotSession ds = (DotSession)session.getAttribute("vts");
		return ds;
	}
	
	public static DotSession getVTSession(HttpServletRequest request) {
		DotSession ds = (DotSession)request.getSession().getAttribute("vts");
		return ds;
	}
	
	/** 灏嗙粨鏋滈泦鏁版嵁鏀捐繘Map */
	public static void putMapData(Map map,ResultSet rs) {
		try {
			//ResultSetMetaData rsm =rs.getMetaData();
			//鑾峰彇鍒楁暟
			int col = rs.getMetaData().getColumnCount();
			for(int i=0; i<col; i++) {
				if(null!=rs.getString(i+1) && !rs.getString(i+1).equals("")){
					map.put("c"+i, rs.getString(i+1));
				}else{
					map.put("c"+i, "");
				}
			}
		} catch (Exception e) {
			System.out.println("");
		}
	}
	/** 灏嗙粨鏋滈泦鏁版嵁鏀捐繘Map */
	public static void putMapDataByColName(Map map,ResultSet rs) {
		String sColName;
		try {
			//鑾峰彇鍒楁暟
			ResultSetMetaData rsm =rs.getMetaData();
			int col = rsm.getColumnCount();
			for(int i=1; i<=col; i++) {
				sColName=rsm.getColumnName(i);
				if(null!=rs.getString(i) && !rs.getString(i).equals("")){
					//获取数据类型
					int dataType = rsm.getColumnType(i);
					if(dataType==3)
					{
						map.put(sColName, rs.getFloat(i));
					}
					else
					{
						map.put(sColName, rs.getString(i));
					}
					
				}else{
					map.put(sColName, "");
				}
			}
		} catch (Exception e) {
			System.out.println("");
		}
	}
	
	/** 灏嗙粨鏋滈泦鏁版嵁鏀捐繘Map */
	public static void putMapDataByColNameLower(Map map,ResultSet rs) {
		String sColName;
		try {
			//鑾峰彇鍒楁暟
			ResultSetMetaData rsm =rs.getMetaData();
			int col = rsm.getColumnCount();
			for(int i=1; i<=col; i++) {
				sColName=rsm.getColumnName(i).toLowerCase();
				if(null!=rs.getString(i) && !rs.getString(i).equals("")){
					//获取数据类型
					int dataType = rsm.getColumnType(i);
					if(dataType==3)
					{
						map.put(sColName, rs.getFloat(i));
					}
					else
					{
						map.put(sColName, rs.getString(i));
					}
					
				}else{
					map.put(sColName, "");
				}
			}
		} catch (Exception e) {
			System.out.println("");
		}
	}

	
	/**
	 * m money
	 * i int
	 * f float
	 * String ix[][]={{"-1","o"},{"2","m"},{"3","i"},{"4","f"}}; 
	 * @param cs
	 * @param sr String	页面参数数组 
	 * @param ix index	以存储过程入参顺序为下标,从0开始定义,参数类型数组	
	 * @throws NumberFormatException
	 * @throws SQLException
	 */
	public static void prepareParamFromInputArray(CallableStatement cs, String sr[],String ix[][]) throws NumberFormatException, SQLException
	{
		for(int i=0;i<ix.length;i++)
		{
			if(ix[i][1].equalsIgnoreCase("s"))
			{
				cs.setString(i+1,sr[Integer.parseInt(ix[i][0])]);
			}
			else if(ix[i][1].equalsIgnoreCase("m") || ix[i][1].equalsIgnoreCase("f"))
			{
				cs.setFloat(i+1,Float.parseFloat(sr[Integer.parseInt(ix[i][0])]));
			}
			else if(ix[i][1].equalsIgnoreCase("i"))
			{
				cs.setInt(i+1,Integer.parseInt(sr[Integer.parseInt(ix[i][0])]));
			}
			else if(ix[i][1].equalsIgnoreCase("o"))
			{
				//--discard 
			}
		}
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	public String getRbm() {
		return rbm;
	}
	public void setRbm(String rbm) {
		this.rbm = rbm;
	}
	public String getRbn() {
		return rbn;
	}
	public void setRbn(String rbn) {
		this.rbn = rbn;
	}
	public String getCurBM() {
		return curBM;
	}
	public void setCurBM(String curBM) {
		this.curBM = curBM;
	}
	public String getCurHM() {
		return curHM;
	}
	public void setCurHM(String curHM) {
		this.curHM = curHM;
	}
	public int getIsedit() {
		return isedit;
	}
	public void setIsedit(int isedit) {
		this.isedit = isedit;
	}
	public int getWorkyear() {
		return workyear;
	}
	public void setWorkyear(int workyear) {
		this.workyear = workyear;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public List getList2() {
		return list2;
	}
	public void setList2(List list2) {
		this.list2 = list2;
	}
	public List getList3() {
		return list3;
	}
	public void setList3(List list3) {
		this.list3 = list3;
	}
	public List getList4() {
		return list4;
	}
	public void setList4(List list4) {
		this.list4 = list4;
	}
	public List getList5() {
		return list5;
	}
	public void setList5(List list5) {
		this.list5 = list5;
	}
	public int getCurYear() {
		return curYear;
	}
	public void setCurYear(int curYear) {
		this.curYear = curYear;
	}
	public String getBmhm() {
		return bmhm;
	}
	public void setBmhm(String bmhm) {
		this.bmhm = bmhm;
	}
	public String getHtml() {
		return html;
	}
	public void setHtml(String html) {
		this.html = html;
	}
	public String getHtml2() {
		return html2;
	}
	public void setHtml2(String html2) {
		this.html2 = html2;
	}
}
