package cn.voicet.ybh.web.form;

public class YbhMemberForm {
	private String[] memberstr;	//查询人口条件数组
	private String xmlist;	//县码列表
	private String xmname="[全省]";	//县名称列表
	private String axflag="1";
	private String[] zhibiao;
	private String[] chkglt;
	private String[] zbId;
	public String[] getMemberstr() {
		return memberstr;
	}
	public void setMemberstr(String[] memberstr) {
		this.memberstr = memberstr;
	}
	public String getXmlist() {
		return xmlist;
	}
	public void setXmlist(String xmlist) {
		this.xmlist = xmlist;
	}
	public String getXmname() {
		return xmname;
	}
	public void setXmname(String xmname) {
		this.xmname = xmname;
	}
	public String getAxflag() {
		return axflag;
	}
	public void setAxflag(String axflag) {
		this.axflag = axflag;
	}
	public String[] getZhibiao() {
		return zhibiao;
	}
	public void setZhibiao(String[] zhibiao) {
		this.zhibiao = zhibiao;
	}
	public String[] getChkglt() {
		return chkglt;
	}
	public void setChkglt(String[] chkglt) {
		this.chkglt = chkglt;
	}
	public String[] getZbId() {
		return zbId;
	}
	public void setZbId(String[] zbId) {
		this.zbId = zbId;
	}
}
