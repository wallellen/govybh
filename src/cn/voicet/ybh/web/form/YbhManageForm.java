package cn.voicet.ybh.web.form;

public class YbhManageForm {
	
	private String viewBM;
	private String oname;
	private String hm;
	private int opcode;
	

	/* 家庭基本信息 */
	private String hname;	//户名
	private String zhu;	//组名
	private String htel;	//户主联系电话
	private String fields;	//耕地面积
	private String house;	//住房面积
	private int property;//农户属性
	private int dcause;	//贫困原因
	private String idcno;	//户主身份证号码
	private String frname;	//帮扶人姓名
	private String frwork;	//帮扶人职务
	private String frtel;	//帮扶人电话
	
	/* 成员信息 */
	private int mid;
	private String uname;
	private int sex;
	private int age;
	private int school;
	private int education;
	private int health;
	private String dcno;
	private int labors;
	private int works;
	private int bla;
	private int tbfd;
	
	/* 家庭收入级帮扶情况数组 */
	private String[] incomearr; 
	
	/* 样本户年收入 */
	private int year;
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
	
	//返回样本村管理页面
	private String rtybc;
	
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
	public String getHm() {
		return hm;
	}
	public void setHm(String hm) {
		this.hm = hm;
	}
	public int getOpcode() {
		return opcode;
	}
	public void setOpcode(int opcode) {
		this.opcode = opcode;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getZhu() {
		return zhu;
	}
	public void setZhu(String zhu) {
		this.zhu = zhu;
	}
	public String getHtel() {
		return htel;
	}
	public void setHtel(String htel) {
		this.htel = htel;
	}
	public String getFields() {
		return fields;
	}
	public void setFields(String fields) {
		this.fields = fields;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public int getProperty() {
		return property;
	}
	public void setProperty(int property) {
		this.property = property;
	}
	public int getDcause() {
		return dcause;
	}
	public void setDcause(int dcause) {
		this.dcause = dcause;
	}
	public String getIdcno() {
		return idcno;
	}
	public void setIdcno(String idcno) {
		this.idcno = idcno;
	}
	public String getFrname() {
		return frname;
	}
	public void setFrname(String frname) {
		this.frname = frname;
	}
	public String getFrwork() {
		return frwork;
	}
	public void setFrwork(String frwork) {
		this.frwork = frwork;
	}
	public String getFrtel() {
		return frtel;
	}
	public void setFrtel(String frtel) {
		this.frtel = frtel;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSchool() {
		return school;
	}
	public void setSchool(int school) {
		this.school = school;
	}
	public int getEducation() {
		return education;
	}
	public void setEducation(int education) {
		this.education = education;
	}
	public int getHealth() {
		return health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	public String getDcno() {
		return dcno;
	}
	public void setDcno(String dcno) {
		this.dcno = dcno;
	}
	public int getLabors() {
		return labors;
	}
	public void setLabors(int labors) {
		this.labors = labors;
	}
	public int getWorks() {
		return works;
	}
	public void setWorks(int works) {
		this.works = works;
	}
	public int getBla() {
		return bla;
	}
	public void setBla(int bla) {
		this.bla = bla;
	}
	public int getTbfd() {
		return tbfd;
	}
	public void setTbfd(int tbfd) {
		this.tbfd = tbfd;
	}
	public String[] getIncomearr() {
		return incomearr;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
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
	public String[] getIncometxt() {
		return incometxt;
	}
	public void setIncometxt(String[] incometxt) {
		this.incometxt = incometxt;
	}
	public void setIncomearr(String[] incomearr) {
		this.incomearr = incomearr;
	}
	public String getRtybc() {
		return rtybc;
	}
	public void setRtybc(String rtybc) {
		this.rtybc = rtybc;
	}
}
