<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
</head>
<body onload="loadParam()" style="background:#E0EEFB;">
<div style="float:right; width:868px; height:668px;">
	<div style="width:640px; height:22px; margin-top:10px;" class="title-stats">农户查询&nbsp;[<s:property value="#session.vts.map.name"/>]</div>
	<form name="farmerForm" action="${pageContext.request.contextPath }/system/govFarmerQueryAction_home.do" method="post" onsubmit="return changeCurPage()">
	<input type="hidden" id="qparam" name="qparam" value="<s:property value="qstr"/>"/>
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:60px;">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td width="10%" align="right"><input type="checkbox"/>全部村范围</td>
				<td width="10%" align="right"><input type="button" value="选择村" onclick="popTips()"/></td>
				<td width="10%"></td>
				<td width="10%"></td>
				<td width="10%" align="center"></td>
			</tr>
			<tr>
				<td width="10%" align="right">农户编码:&nbsp;</td>
				<td width="10%"><input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[0]"/>" maxlength="15" onkeyup="value=value.replace(/[^\d]/g,'')" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/></td>
				<td width="10%" align="right">户主姓名:&nbsp;</td>
				<td width="10%"><input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[1]"/>" maxlength="10" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/></td>
				<td width="10%" align="center"><input id="searchImg" type="button" value="立即查询" class="button4"/></td>
			</tr>
		</table>	
	</div>
	</fieldset>
	<div style="height:5px;"></div>
	</form>
	<s:if test="#session.vts.list5!=null && #session.vts.list5.size()>0">
	<div style="height:16px; padding-top:2px; border:0px solid red;">
	<span>符合查询条件农户数：<s:property value="#session.vts.map.farmernt"/>户</span>
		<span style="float:right; width:60px;">
			<input type="button" value="导出" onclick="location.href='${pageContext.request.contextPath }/system/govFarmerQueryAction_exportFarmerInfo.do'" class="button43"/>
		</span>
	</div>
	</s:if>
	<div class="table-c" style="width:868px; height:448px; border:0px solid red; margin-top:4px;">
		<table class="data_list" width="100%" bordercolor="gray" border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr class="tabtr1">
				<td width="20%">农户编码</td>
				<td width="49%">省、市、县、乡、村</td>
				<td width="15%">户主姓名</td>
				<td width="16%" class="tabtd1">操作</td>
			</tr>
			</thead>
			<tbody id="splitpage">
				<tr align="center" style="height:20px;">
					<td align="left">320826100009001</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 张连桂</td>
					<td class="tabtd1">编辑</td>
				</tr>
				<tr align="center" style="height:20px;">
					<td align="left">320826100009002</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 二组肖素梅</td>
					<td class="tabtd1">编辑</td>
				</tr>
				<tr align="center" style="height:20px;">
					<td align="left">320826100009003</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 二组汤志刚</td>
					<td class="tabtd1">编辑</td>
				</tr>
				<tr align="center" style="height:20px;">
					<td align="left">320826100009004</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 二组谷寿文</td>
					<td class="tabtd1">编辑</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- js分页div -->
	<div class="split-page">
		<!-- 每页行数 -->
		<input type="hidden" id="pageRows" value="21"/>
		<div id="changePage"></div>
	</div>
	
</div>
</body>
</html>