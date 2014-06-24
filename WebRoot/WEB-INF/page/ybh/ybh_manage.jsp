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
				<td height="20px" width="12%">农户编码</td>
				<td width="12%">组名</td>
				<td width="12%">户主姓名</td>
				<td width="8%">人口</td>
				<td width="8%">劳力</td>
				<td width="8%">耕地</td>
				<td width="8%">住房(m<sup>2</sup>)</td>
				<td width="10%">农户属性</td>
				<td width="10%">贫困原因</td>
				<td width="12%" class="tabtd1">操作</td>
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
						<a href="${pageContext.request.contextPath }/ybhManageAction_viewYbh.action?viewBM=<s:property value="#ls.bm"/>&oname=<s:property value="#ls.oname"/>">进入</a>
					</td>
				</s:if>
				<s:else>
					<td align="left" height="20px">&nbsp;<s:property value="#ls.hm"/></td>
					<td align="left" title="<s:property value="#ls.zhu"/>">&nbsp;<s:property value="#ls.zhu.length()>6?#ls.zhu.substring(0,5)+'..':#ls.zhu"/></td>
					<td align="left" title="<s:property value="#ls.hname"/>">&nbsp;<s:property value="#ls.hname.length()>7?#ls.hname.substring(0,6)+'..':#ls.hname"/></td>
					<td align="right"><s:property value="#ls.population"/>&nbsp;</td>
					<td align="right"><s:property value="#ls.labornum"/>&nbsp;</td>
					<td align="right"><s:property value="#ls.fields"/>&nbsp;</td>
					<td align="right"><s:property value="#ls.house"/>&nbsp;</td>
					<td align="left">&nbsp;<s:property value="#ls.property"/></td>
					<td align="left">&nbsp;<s:property value="#ls.dcause"/></td>
					<td class="tabtd1">
						<a href="javascript:void(0)">修改</a>
					</td>
				</s:else>
			</tr>
			</s:iterator>
         </tbody>
     </table>
</div>
<div class="split-page">
	<input type="hidden" id="pageRows" value="29"/>
	<div id="changePage"></div>
</div>
</body>
</html>