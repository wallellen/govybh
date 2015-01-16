<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css?v=1" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<style type="text/css">
		#overlay-member{position:absolute;top:0;left:0;width:100%;height:670px;background:#000;opacity:0.5;filter:alpha(opacity=50);display:none;} 
		#win-member{position:absolute;top:20%;left:45%;width:500px;height:615px;background:#EAECEA;border:4px solid #F7F7F7;margin:-102px 0 0 -202px;display:none;} 
		h2{font-size:12px;height:18px;text-align:right;background:#3F89EC;border-bottom:3px solid #F7F7F7;padding:5px;cursor:move;} 
		h2 span{border:0px solid #f90;padding:0 2px;} 
		.trhead{font-weight:bold;}
		.error-tips{
			position:absolute;
			width:120px; 
			height:18px;
			line-height:18px;
			color:#F00;
		}
	</style>
</head>
<body style="background:#E0EEFB;">
<%@ include file="/WEB-INF/page/ybh/ybh_family_baseInfo.jsp"%>
<s:if test="%{#session.vts.map.hname!=''}">

<div id="member-info-ul">
	<ul>
		<li style="background:url(${pageContext.request.contextPath }/images/tab-bg2.png); color:#FFF;">家庭成员信息</li>
		<li><a href="${pageContext.request.contextPath }/ybhManageAction_familyIncome.action">样本户年指标</a> </li>
	</ul>
</div>

<div id="member-info-data">
	<h3 id="base-title">家庭成员信息</h3>
	<ul id="ul-member">
		<li>家庭人口：<s:property value="#session.vts.map.population"/></li>
	    <li>劳动力：<s:property value="#session.vts.map.labornum"/></li>
	    <li class="add-member-bt">
	    <s:if test="#session.vts.isedit==1">
	    <input type="button" onclick="popSaveMember('0','add','0','0','0','0','0','0','0','0','0','0','0')" value="添加人口" class="button4"/>
	    </s:if>
	   	</li>
	</ul>
	<table class="tab-member" cellpadding="0" cellspacing="0">
		<tr>
	    	<td width="6%">姓名</td>
			<td width="4%">性别</td>
			<td width="4%">出生<br/>年份</td>
			<td width="4%">在校生</td>
			<td width="8%">文化程度</td>
			<td width="8%">身体状况</td>
			<td width="8%">劳动力状况</td>
			<td width="8%">打工状况</td>
			<td width="4%">低保<br/>人口</td>
			<td width="6%">操作</td>
	    </tr>
	    <s:iterator value="#session.vts.list" var="ls" status="sc">
		<tr>
			<td>
				<label id="una<s:property value="#sc.count"/>"><s:property value="#ls.uname"/></label>
			</td>
			<td>
				<label id="sex<s:property value="#sc.count"/>"><s:property value="#ls.sex"/></label>
			</td>
			<td>
				<label id="age<s:property value="#sc.count"/>"><s:property value="#ls.year"/></label>
			</td>
			<td>
				<label id="sch<s:property value="#sc.count"/>"><s:property value="#ls.school"/></label>
			</td>
			<td>
				<label id="edu<s:property value="#sc.count"/>"><s:property value="#ls.education"/></label>
			</td>
			<td>
				<label id="hea<s:property value="#sc.count"/>"><s:property value="#ls.health"/></label>
			</td>
			<td>
				<label id="lab<s:property value="#sc.count"/>"><s:property value="#ls.labors"/></label>
			</td>
			<td>
				<label id="wor<s:property value="#sc.count"/>"><s:property value="#ls.works"/></label>
			</td>
			<td>
				<label id="bla<s:property value="#sc.count"/>"><s:property value="#ls.bla"/></label>
			</td>
			<td>
			<s:if test="#session.vts.isedit==1">
				<a href="javascript:popSaveMember('<s:property value="#ls.mid"/>','edit','<s:property value="#sc.count"/>','<s:property value="#ls.ist1"/>','<s:property value="#ls.ist2"/>','<s:property value="#ls.ist3"/>','<s:property value="#ls.ist4"/>','<s:property value="#ls.ist5"/>','<s:property value="#ls.ish1"/>','<s:property value="#ls.ish2"/>','<s:property value="#ls.ish3"/>','<s:property value="#ls.ish4"/>','<s:property value="#ls.ish5"/>')">修改</a>
				<a href="${pageContext.request.contextPath }/ybhManageAction_deleteMember.action?mid=<s:property value="#ls.mid"/>" onclick="return confirm('您确定要删除吗?')">删除</a>
			</s:if>
			</td>
		</tr>
		</s:iterator>
	</table>
	
</div>
</s:if>

<!-- add member start -->
<div id="overlay-member"></div>
<div id="win-member" style="line-height: 30px">
<h2 style="line-height:20px; text-align:left; margin-top:2px;"><span id="mtitle"><font color="#fff">添加</font></span></h2>
<form name="memberForm" action="" method="post">
<input type="hidden" id="mid" name="mid" value=""/>
<div class="member-list">
	<table width="480px" cellpadding="0" cellspacing="0">
		<tr class="trhead">
			<td width="40%" align="left">家庭成员基本信息</td>
			<td width="35%" align="left"></td>
			<td width="25%">
			</td>
		</tr>
		<tr>
			<td width="40%" align="right">姓名:&nbsp;&nbsp;</td>
			<td width="35%" align="left">
				<input type="text" id="duname" name="uname" class="back-input" maxlength="10" onblur="checkName(this)" placeholder="请输入姓名"/>
			</td>
			<td width="25%">
				<div id="errTip" class="error-tips"></div>
			</td>
		</tr>
		<tr>
			<td align="right">性别:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio id="d-sex" name="sex" list="#application.vta.GetList('sex')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">出生年份:&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="dage" name="age" class="back-input" maxlength="4" onblur="checkAge(this)" />
			</td>
			<td><span id="ageTips" class="ptips"></span></td>
		</tr>
		<tr>
			<td align="right">在校生:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio id="d-school" name="school" list="#application.vta.GetList('yesno')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">文化程度:&nbsp;&nbsp;</td>
			<td align="left">
			<s:select id="d-education" name="education" cssClass="d-semem5" list="#application.vta.GetList('education')" listKey="id" listValue="str" value="%{#ls2.education}"></s:select>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">身体状况:&nbsp;&nbsp;</td>
			<td align="left">
				<s:select id="d-health" name="health" cssClass="d-semem5" list="#application.vta.GetList('health')" listKey="id" listValue="str" value="%{#ls2.health}"></s:select>
			</td>
			<td></td>
		</tr>
		<!--
		<tr>
			<td align="right">残疾证号:&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="ddcno" name="dcno" class="back-input" maxlength="20" placeholder="请输入数字或字母" onblur="checkDcno(this)"/>
			</td>
			<td></td>
		</tr>
		-->
		<tr>
			<td align="right">劳动力状况:&nbsp;&nbsp;</td>
			<td align="left">
				<s:select id="d-labors" name="labors" cssClass="d-semem5" list="#application.vta.GetList('labor')" listKey="id" listValue="str" value="%{#ls2.labors}"></s:select>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">打工状况:&nbsp;&nbsp;</td>
			<td align="left">
				<s:select id="d-works" name="works" cssClass="d-semem5" list="#application.vta.GetList('workexex')" listKey="id" listValue="str" value="%{#ls2.works}"></s:select>
			</td>
			<td></td>
		</tr>
		<!-- 20141229 add begin -->
		<tr>
			<td align="right">低保人口:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="bla" list="#application.vta.GetList('yesno')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr class="trhead">
			<td width="40%" align="left">享受补助情况</td>
			<td width="35%" align="left"></td>
			<td width="25%">
			</td>
		</tr>
		<tr>
			<td align="right">是否享受残疾补助:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ist1" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否参加新型农村合作医疗:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ist2" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否参加城乡居民基本养老保险:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ist3" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否参加大病医疗救助:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ist4" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否有其他补助:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ist5" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr class="trhead">
			<td width="40%" align="left">享受帮扶情况</td>
			<td width="35%" align="left"></td>
			<td width="25%">
			</td>
		</tr>
		<tr>
			<td align="right">是否帮扶就业:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ish1" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否帮扶上学:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ish2" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否帮扶就医:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ish3" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否帮扶参保:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ish4" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">是否有其他帮扶:&nbsp;&nbsp;</td>
			<td align="left">
				<s:radio name="ish5" list="#application.vta.GetList('yesnobf')" listKey="id" listValue="str"/>
			</td>
			<td></td>
		</tr>
		
		<!-- 20140831 add end -->
	</table>
</div>
<div></div>
<div style="margin-top:5px; margin-left:150px;">
	<input type="button" value="确定" class="button4" onclick="subMemberBt()"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="close" type="button" value="取消" class="button4"/>
</div>
</form>
</div>
<!-- add member end -->
</body>
</html>