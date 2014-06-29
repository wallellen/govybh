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
	    	<td width="4%">年份</td>
	    	<td width="6%">4、家庭年总纯收入(元)</td>
	        <td width="6%">其中:(1)家庭经营性收入(元)</td>
	        <td width="6%">(2)工资性收入(元)</td>
	        <td width="6%">(3)财产性及转移性收入(元)</td>
	        <td width="6%">5、家庭年人均纯收入(元)</td>
	        <td width="6%">7、享受扶贫项目支持情况</td>
	        <td width="6%">8、得到帮扶资金(元)</td>
	        <td width="6%">其中:(1)省级扶贫资金(元)</td>
	        <td width="6%">(2)市、县级扶贫资金(元)</td>
	        <td width="6%">9、使用小额扶贫贷款数量(元)</td>
	        <td width="6%">操作</td>
	    </tr>
	    </thead>
	    <tbody>
		    <s:iterator id="ls2" value="#session.vts.list2">
		    <tr>
		    	<td><s:property value="#ls2.year"/></td>
		    	<td><s:property value="#ls2.intotal"/></td>
		    	<td><s:property value="#ls2.injy"/></td>
		    	<td><s:property value="#ls2.inwork"/></td>
		    	<td><s:property value="#ls2.incz"/></td>
		    	<td><s:property value="#ls2.inpersonal"/></td>
		    	<td><s:property value="#ls2.fs"/></td>
		    	<td><s:property value="#ls2.v"/></td>
		    	<td><s:property value="#ls2.v1"/></td>
		    	<td><s:property value="#ls2.v2"/></td>
		    	<td><s:property value="#ls2.xe"/></td>
		    	<td>
		    		<a href="${pageContext.request.contextPath }/ybhManageAction_editIncome.action?hname=<s:property value="#session.vts.map.hname"/>&year=<s:property value="#ls2.year"/>&intotal=<s:property value="#ls2.intotal"/>&injy=<s:property value="#ls2.injy"/>&inwork=<s:property value="#ls2.inwork"/>&incz=<s:property value="#ls2.incz"/>&inpersonal=<s:property value="#ls2.inpersonal"/>&fs=<s:property value="#ls2.fs"/>&fs1=<s:property value="#ls2.fs1"/>&fs2=<s:property value="#ls2.fs2"/>&fs3=<s:property value="#ls2.fs3"/>&&fs4=<s:property value="#ls2.fs4"/>&fs5=<s:property value="#ls2.fs5"/>&vv=<s:property value="#ls2.v"/>&vv1=<s:property value="#ls2.v1"/>&vv2=<s:property value="#ls2.v2"/>&xxe=<s:property value="#ls2.xe"/>&bb=<s:property value="#ls2.b"/>&bb1=<s:property value="#ls2.b1"/>&bb2=<s:property value="#ls2.b2"/>&bb3=<s:property value="#ls2.b3"/>&bb4=<s:property value="#ls2.b4"/>">编辑</a>
		    	</td>
		    </tr>
		    </s:iterator>
	    </tbody>
	</table>
</div>
</s:if>
<s:if test="#session.vts.hasStack()">
	<s:property value="#session.vts.popAllList()"/>
</s:if>
</body>
</html>