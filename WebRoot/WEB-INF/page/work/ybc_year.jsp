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
<h3 class="ybh_h3_title"><s:property value="oname"/>&nbsp;村指标</h3>
<div class="ybc-return"><input type="button" value="返回" class="button43" onclick="history.go(-1)"/></div>
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
        	<s:if test="#session.vts.rbm.length()==6">
        	<a href="${pageContext.request.contextPath }/yearDataAction_updateCun.action?year=<s:property value='#ls.rid'/>&cunbm=<s:property value='cunbm'/>&oname=<s:property value='oname'/>">编辑</a>
        	</s:if>
        	<s:else>
        	<a href="${pageContext.request.contextPath }/ybcManageAction_viewCunzb.action?year=<s:property value='#ls.rid'/>&cunbm=<s:property value='cunbm'/>&oname=<s:property value='oname'/>">查看</a>
        	</s:else>
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