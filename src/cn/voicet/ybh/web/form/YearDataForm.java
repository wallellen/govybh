package cn.voicet.ybh.web.form;

public class YearDataForm {
	private String viewBM;
	private String oname;
	private int year;
	private String cunbm;
	
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
	
	private String[] cuntxt;
	
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
}
