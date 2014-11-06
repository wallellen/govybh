<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<table class="" cellpadding="0" cellspacing="0" width="100%">
   	<thead>
       	<tr class="tabtr1">
			<s:if test="#session.vts.curBM.length()<=9">
				<td height="20px" width="20%">地区编码</td>
				<td width="20%">地区名称</td>
				<td width="20%">样本村数</td>
				<td width="20%">样本户数</td>
				<td width="20%" class="tabtd1">操作</td>
			</s:if>
			<s:else>
				<td height="20px" width="12%">农户编码</td>
				<td width="12%">组名</td>
				<td width="12%">户主姓名</td>
				<td width="8%">人口</td>
				<td width="8%">劳力</td>
				<td width="8%">耕地</td>
				<td width="8%">住房(m2)</td>
				<td width="10%">农户属性</td>
				<td width="10%">贫困原因</td>
				<td width="12%">
					<s:if test="rtybc!=null && rtybc=='ybc'">
					<input type="button" value="返回" onclick="javascript:history.go(-1)" class="button43"/>
					</s:if>
					<s:else>
					操作
					</s:else>
				</td>
			</s:else>
             </tr>
         </thead>
         <tbody id="splitpage">
         	<c:forEach items="${ybhList }" var="ls" varStatus="status">
				<c:choose>
					<c:when test="${fn:length(sessionScope.vts.curBM) <= 9 }">
						<c:choose>
							<c:when test="${ls.t eq 0}">
								<tr style="display:none; font-weight:bold; background-color:#c0c0c0;">
									<td height="20px" align="left">&nbsp;${ls.bm }</td>
									<td align="left">&nbsp;${ls.oname }</td>
									<td align="right">${ls.cn }&nbsp;</td>
									<td align="right">${ls.hm }&nbsp;</td>
									<td class="tabtd1"></td>
							</c:when>
							<c:otherwise>
								<tr style="display:none;">
									<td height="20px" align="left">&nbsp;${ls.bm }</td>
									<td align="left">&nbsp;${ls.oname }</td>
									<td align="right">${ls.cn }&nbsp;</td>
									<td align="right">${ls.hm }&nbsp;</td>
									<td class="tabtd1">
										<a href="${pageContext.request.contextPath }/ybhManageAction_viewYbh.action?viewBM=${ls.bm }&oname=${ls.oname }">进入</a>
									</td>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<tr style="display:none;">
							<td align="left" height="20px">&nbsp;${ls.hm }</td>
							<td align="left" title="${ls.zhu }">
								<c:choose>
									<c:when test="${fn:length(ls.zhu) gt 6}">${fn:substring(ls.zhu,0,5) }..</c:when>
									<c:otherwise>${ls.zhu}</c:otherwise>
								</c:choose>
							</td>
							<td align="left" title="${ls.hname }">
								<c:choose>
									<c:when test="${fn:length(ls.hname) gt 7}">${fn:substring(ls.hname,0,6) }..</c:when>
									<c:otherwise>${ls.hname}</c:otherwise>
								</c:choose>
							</td>
							<td align="right">${ls.population }&nbsp;</td>
							<td align="right">${ls.labornum }&nbsp;</td>
							<td align="right">${ls.fields }&nbsp;</td>
							<td align="right">${ls.house }&nbsp;</td>
							<td align="left">&nbsp;${ls.property }</td>
							<td align="left">&nbsp;${ls.dcause }</td>
							<td class="tabtd1">
								<c:if test="${fn:length(sessionScope.vts.rbm) eq 6 }">
								<a href="${pageContext.request.contextPath }/ybhManageAction_detail.action?viewBM=${ls.hm }&rtf=home">编辑</a>&nbsp;
								</c:if>
								<a href="${pageContext.request.contextPath }/ybhManageAction_viewReportFamily.action?viewBM=${ls.hm }">查看</a>&nbsp;
					 			<a id="printBt" href="${pageContext.request.contextPath }/ybhManageAction_printFamily.action?viewBM=${ls.hm }" target="printFrame">打印</a>
							</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
         </tbody>
     </table>
</div>
<div class="split-page">
	<input type="hidden" id="pageRows" value="29"/>
	<div id="changePage"></div>
</div>
</body>
</html>