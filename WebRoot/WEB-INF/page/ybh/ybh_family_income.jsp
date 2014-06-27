<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/familyincome.js"></script>
	<style type="text/css">
		#overlay-year{position:absolute;top:0;left:0;width:100%;height:670px;background:#000;opacity:0.5;filter:alpha(opacity=50);display:none;} 
		#win-year{position:absolute;top:30%;left:45%;width:500px;height:480px;background:#EAECEA;border:4px solid #F7F7F7;margin:-102px 0 0 -202px;display:none;} 
		h2{font-size:12px;height:18px;text-align:right;background:#3F89EC;border-bottom:3px solid #F7F7F7;padding:5px;cursor:move;} 
		h2 span{border:0px solid #f90;padding:0 2px;} 
		
		.fincome-errtip{
			width:260px; 
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
		<li><a href="${pageContext.request.contextPath }/ybhManageAction_itemFamily.action">家庭成员信息</a></li>
		<li style="background:url(${pageContext.request.contextPath }/images/tab-bg2.png); color:#FFF;">家庭收入及帮扶情况</li>
	</ul>
</div>
<div id="member-info-data">
	<h3 id="base-title" style="float:left">家庭收入及帮扶情况</h3>
	<table class="tab-member" cellpadding="0" cellspacing="0">
		<thead>
		<tr>
	    	<td colspan="4">四</td>
	        <td>五</td>
	        <td colspan="6">七</td>
	        <td colspan="3">八</td>
	        <td>九</td>
	        <td colspan="4">十、参加社会保障情况</td>
	    </tr>
	    <tr>
	    	<td width="6%">家庭年总纯收入(元)</td>
	        <td width="6%">其中:(1)家庭经营性收入(元)</td>
	        <td width="6%">(2)工资性收入(元)</td>
	        <td width="6%">(3)财产性及转移性收入(元)</td>
	        <td width="6%">家庭年人均纯收入(元)</td>
	        <td width="4%">享受扶贫项目支持情况</td>
	        <td width="4%">其中:(1)产业发展项目</td>
	        <td width="4%">(2)帮助就业项目</td>
	        <td width="4%">(3)小额扶贫贷款项目</td>
	        <td width="4%">(4)入股收益分红类项目</td>
	        <td width="4%">(5)其它项目</td>
	        <td width="6%">得到帮扶资金(元)</td>
	        <td width="6%">其中:(1)省级扶贫资金(元)</td>
	        <td width="6%">(2)市、县级扶贫资金(元)</td>
	        <td width="6%">使用小额扶贫贷款数量(元)</td>
	        <td width="4%">新农合</td>
	        <td width="4%">新农保</td>
	        <td width="4%">大病医疗救助</td>
	        <td width="4%">未参加或享受任何保障</td>
	    </tr>
	    </thead>
	    <tbody>
	    
	    </tbody>
	</table>
</div>
</s:if>
<s:if test="#session.vts.hasStack()">
	<s:property value="#session.vts.popAllList()"/>
</s:if>
</body>
</html>