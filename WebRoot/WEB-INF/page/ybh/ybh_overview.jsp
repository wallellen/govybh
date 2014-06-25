<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<span>概览</span>
<table cellpadding="0" cellspacing="0">
	<tr><td width="55%">当前编码</td><td><s:property value="#session.vts.curBM"/></td></tr>
    <tr><td>农户总数</td><td><s:property value="#session.vts.map.htn"/></td></tr>
    <tr><td>人口总数</td><td><s:property value="#session.vts.map.ptn"/></td></tr>
    <tr><td>低收入农户数</td><td><s:property value="#session.vts.map.hn"/></td></tr>
    <tr><td>低收入人口数</td><td><s:property value="#session.vts.map.pn"/></td></tr>
</table>
<ul>
	<li><input type="button" onClick="location.href='${pageContext.request.contextPath }/system/govBrowerAction_returnList.do?viewBM=<s:property value="#session.vts.curBM"/>'" value="返回列表" class="button42"/></li>
    <li><input type="button" onClick="location.href='${pageContext.request.contextPath }/system/govFarmerQueryAction_home.do'" value="查询农户" class="button42"/></li>
    <li><input type="button" onClick="location.href='${pageContext.request.contextPath }/system/govFarmerQueryAction_member.do'" value="查询人口" class="button42"/></li>
    <li>
    	<s:if test="#session.vts.curBM.length()<10">
    	<input type="button" onClick="location.href='${pageContext.request.contextPath }/system/govFarmerStatsAction_home.do'" value="农户分组汇总" class="button42"/>
    	</s:if><s:else>&nbsp;</s:else>
    </li>
    <li>
	    <s:if test="#session.vts.curBM.length()<10">
	    <input type="button" onClick="location.href='${pageContext.request.contextPath }/system/govPeopleStatsAction_home.do'" value="人口分组汇总" class="button42"/>
	    </s:if><s:else>&nbsp;</s:else>
   	</li>
</ul>