package cn.voicet.ybh.web.form;

import java.util.Date;

public class YbhFarmerForm {
	private String[] qstr;	//��ѯũ����������
	private String xmlist;	//�����б�
	private String xmname="[ȫʡ]";	//�������б�
	private String axflag="1";
	private String year = String.format("%tY", new Date());
	private String[] zhibiao;	//ָ��
	private String[] zbId;		//ָ��ID
	private String[] chkglt;	//������ֵ̨
	private String[] yuan;		//�����ֵ
	private String[] chkipt;	//1:check, 2:input
	
	public String[] getQstr() {
		return qstr;
	}
	public void setQstr(String[] qstr) {
		this.qstr = qstr;
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
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String[] getZbId() {
		return zbId;
	}
	public void setZbId(String[] zbId) {
		this.zbId = zbId;
	}
	public String[] getChkglt() {
		return chkglt;
	}
	public void setChkglt(String[] chkglt) {
		this.chkglt = chkglt;
	}
	public String[] getYuan() {
		return yuan;
	}
	public void setYuan(String[] yuan) {
		this.yuan = yuan;
	}
	public String[] getChkipt() {
		return chkipt;
	}
	public void setChkipt(String[] chkipt) {
		this.chkipt = chkipt;
	}
}
