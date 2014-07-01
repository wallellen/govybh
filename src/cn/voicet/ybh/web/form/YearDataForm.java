package cn.voicet.ybh.web.form;

public class YearDataForm {
	private String viewBM;
	private String oname;
	private int year;
	private String cunbm;
	private String curhm;
	private String hname;
	
	/* 村信息数组 */
	private String[] cuntxt;
	
	private String[] incometxt;
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
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
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
		this.curhm = curhm;
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
}
