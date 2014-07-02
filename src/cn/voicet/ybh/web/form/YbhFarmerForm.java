package cn.voicet.ybh.web.form;

public class YbhFarmerForm {
	private String[] qstr;	//查询农户条件数组
	private String[] memberstr;	//查询人口条件数组

	public String[] getQstr() {
		return qstr;
	}
	public void setQstr(String[] qstr) {
		this.qstr = qstr;
	}
	public String[] getMemberstr() {
		return memberstr;
	}
	public void setMemberstr(String[] memberstr) {
		this.memberstr = memberstr;
	}
}
