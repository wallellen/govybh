<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/splitpage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/changeColor.js"></script>
</head>
<body style="background:#E0EEFB;">
<h3 class="jiangbu-title">样本户年数据信息&nbsp;[<s:property value="#session.vts.rbn"/>]</h3>
<div id="jiangbu-data1">
<table class="data_list" cellpadding="0" cellspacing="0" width="100%">
   	<thead>
    <tr class="tabtr1">
        <td width="20%">年份</td>
        <td width="20%">标题</td>
        <td width="20%">开始日期</td>
        <td width="20%">结束日期</td>
        <td width="20%">操作</td>
    </tr>
    </thead>
    <tbody id="splitpage">
    <s:iterator value="#session.vts.list" var="ls" status="sc">
    <tr style="display:none">
        <td><s:property value="#ls.rid"/></td>
        <td><s:property value="#ls.title"/></td>
        <td><s:property value="#ls.fdt"/></td>
        <td><s:property value="#ls.tdt"/></td>
        <td>
        	<a href="${pageContext.request.contextPath }/yearDataAction_viewData.action?year=<s:property value='#ls.rid'/>">查看</a>
        </td>
    </tr>
    </s:iterator>
	</tbody>
</table>
</div>
<div class="split-page">
	<input type="hidden" id="pageRows" value="23"/>
	<div id="changePage"></div>
</div>
</body>
</html>