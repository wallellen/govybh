<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/splitpage.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/changeColor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/voicet-common-1.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/browerview.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			var v1 = parent.document.getElementById("navigate");
			v1.innerHTML=document.getElementById('nav-hide').innerHTML;
		}
	</script>
</head>
<body style="background:#E0EEFB;">
<div style="display:none;" id="nav-hide">
	<s:property value="#session.vts.navPath" escape="false"/>
</div>
<div id="jiangbu-data">
<table class="data_list" cellpadding="0" cellspacing="0" width="100%">
   	<thead>
       	<tr class="tabtr1">
			<s:if test="#session.vts.curBM.length()<=9">
		<td height="20px" width="20%">地区编码</td>
		<td width="20%">地区名称</td>
		<td width="20%">村数</td>
		<td width="20%">户数</td>
		<td width="20%" class="tabtd1">操作</td>
	</s:if>
	<s:else>
		<td height="20px" width="25%">农户编码</td>
		<td width="25%">地区名称</td>
		<td width="25%">勾选</td>
		<td width="25%" class="tabtd1">操作</td>
	</s:else>
             </tr>
         </thead>
         <tbody id="splitpage">
         	<s:iterator value="#session.vts.list" var="ls" status="li">
	<tr style="display:none;">
		<s:if test="#session.vts.curBM.length()<=9">
		<td height="20px" align="left">&nbsp;<s:property value="#ls.bm"/></td>
		<td align="left">&nbsp;<s:property value="#ls.oname"/></td>
		<td align="right"><s:property value="#ls.cn"/>&nbsp;</td>
		<td align="right"><s:property value="#ls.hm"/>&nbsp;</td>
		<td class="tabtd1">
			<a href="${pageContext.request.contextPath }/ybhCheckAction_viewYbh.action?viewBM=<s:property value="#ls.bm"/>">进入</a>
		</td>
		</s:if>
		<s:else>
			<td align="left" height="20px">&nbsp;<s:property value="#ls.hm"/></td>
			<td align="left">&nbsp;<s:property value="#ls.hname"/></td>
			<td align="center">
				<s:if test="#ls.t!=null && #ls.t==1">
				√
				</s:if>
				<s:elseif test="#ls.t!=null && #ls.t==0">
				乂
				</s:elseif>
				<s:else>
				&nbsp;
				</s:else>
			</td>
			<td class="tabtd1">
				<a href="${pageContext.request.contextPath }/system/govBrowerAction_viewReportFamily.do?viewBM=<s:property value="#ls.hm"/>">勾选</a>
			</td>
		</s:else>
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