package cn.voicet.ybh.web.form;

public class YearDataForm {
	private String viewBM;
	private String oname;
	private String year;
	private String cunbm;
	private String curhm;
	private String hname;
	
	/* 村信息数组 */
	private String[] cuntxt;
	
	private String[] incometxt;
	
	//家庭年总纯收入
	private String intotal;
	private String injy;
	private String inwork;
	private String incz;
	//家庭年人均纯收入
	private String inpersonal;
	//享受扶贫项目支持情况
	private String fs;
	private String fs1;
	private String fs2;
	private String fs3;
	private String fs4;
	private String fs5;
	//得到帮扶资金
	private String vv;
	private String vv1;
	private String vv2;
	//使用小额扶贫贷款数量
	private String xxe;
	//参加社会保障情况
	private String bb;
	private String bb1;
	private String bb2;
	private String bb3;
	private String bb4;
	
	public String getViewBM() {
		return viewBM;
	}
	public void setViewBM(String viewBM) {
		this.viewBM = viewBM;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		if(year.length()==0)
		{
			this.year = null;
		}
		else
		{
			this.year = year;
		}
	}
	public String getCunbm() {
		return cunbm;
	}
	public void setCunbm(String cunbm) {
		this.cunbm = cunbm;
	}
	public String[] getCuntxt() {
		return cuntxt;
	}
	public void setCuntxt(String[] cuntxt) {
		this.cuntxt = cuntxt;
	}
	public String getCurhm() {
		return curhm;
	}
	public void setCurhm(String curhm) {
		if(curhm.length()==0)
		{
			this.curhm = null;
		}
		else
		{
			this.curhm = curhm;	
		}
		
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String[] getIncometxt() {
		return incometxt;
	}
	public void setIncometxt(String[] incometxt) {
		this.incometxt = incometxt;
	}
	public String getIntotal() {
		return intotal;
	}
	public void setIntotal(String intotal) {
		this.intotal = intotal;
	}
	public String getInjy() {
		return injy;
	}
	public void setInjy(String injy) {
		this.injy = injy;
	}
	public String getInwork() {
		return inwork;
	}
	public void setInwork(String inwork) {
		this.inwork = inwork;
	}
	public String getIncz() {
		return incz;
	}
	public void setIncz(String incz) {
		this.incz = incz;
	}
	public String getInpersonal() {
		return inpersonal;
	}
	public void setInpersonal(String inpersonal) {
		this.inpersonal = inpersonal;
	}
	public String getFs() {
		return fs;
	}
	public void setFs(String fs) {
		this.fs = fs;
	}
	public String getFs1() {
		return fs1;
	}
	public void setFs1(String fs1) {
		this.fs1 = fs1;
	}
	public String getFs2() {
		return fs2;
	}
	public void setFs2(String fs2) {
		this.fs2 = fs2;
	}
	public String getFs3() {
		return fs3;
	}
	public void setFs3(String fs3) {
		this.fs3 = fs3;
	}
	public String getFs4() {
		return fs4;
	}
	public void setFs4(String fs4) {
		this.fs4 = fs4;
	}
	public String getFs5() {
		return fs5;
	}
	public void setFs5(String fs5) {
		this.fs5 = fs5;
	}
	public String getVv() {
		return vv;
	}
	public void setVv(String vv) {
		this.vv = vv;
	}
	public String getVv1() {
		return vv1;
	}
	public void setVv1(String vv1) {
		this.vv1 = vv1;
	}
	public String getVv2() {
		return vv2;
	}
	public void setVv2(String vv2) {
		this.vv2 = vv2;
	}
	public String getXxe() {
		return xxe;
	}
	public void setXxe(String xxe) {
		this.xxe = xxe;
	}
	public String getBb() {
		return bb;
	}
	public void setBb(String bb) {
		this.bb = bb;
	}
	public String getBb1() {
		return bb1;
	}
	public void setBb1(String bb1) {
		this.bb1 = bb1;
	}
	public String getBb2() {
		return bb2;
	}
	public void setBb2(String bb2) {
		this.bb2 = bb2;
	}
	public String getBb3() {
		return bb3;
	}
	public void setBb3(String bb3) {
		this.bb3 = bb3;
	}
	public String getBb4() {
		return bb4;
	}
	public void setBb4(String bb4) {
		this.bb4 = bb4;
	}
}
