package cn.voicet.ybh.web.form;

public class YbhFarmerForm {
	private String[] qstr;	//��ѯũ����������
	private String xmlist;	//�����б�
	private String xmname;	//�������б�
	private String axflag="1";
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
}
