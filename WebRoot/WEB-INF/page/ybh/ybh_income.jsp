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
<h3 class="jiangbu-title">[<s:property value="curhm"/>&nbsp;<s:property value="hname"/>]家庭年收入及帮扶情况</h3>
<div id="jiangbu-data">
<table class="data_list" cellpadding="0" cellspacing="0" width="100%">
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
	<tbody id="splitpage">
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
    		<a href="${pageContext.request.contextPath }/ybhManageAction_editIncome.action?hname=<s:property value="#session.vts.map.hname"/>&year=<s:property value="#ls2.year"/>&intotal=<s:property value="#ls2.intotal"/>&injy=<s:property value="#ls2.injy"/>&inwork=<s:property value="#ls2.inwork"/>&incz=<s:property value="#ls2.incz"/>&inpersonal=<s:property value="#ls2.inpersonal"/>&fs=<s:property value="#ls2.fs"/>&fs1=<s:property value="#ls2.fs1"/>&fs2=<s:property value="#ls2.fs2"/>&fs3=<s:property value="#ls2.fs3"/>&fs4=<s:property value="#ls2.fs4"/>&fs5=<s:property value="#ls2.fs5"/>&vv=<s:property value="#ls2.v"/>&vv1=<s:property value="#ls2.v1"/>&vv2=<s:property value="#ls2.v2"/>&xxe=<s:property value="#ls2.xe"/>&bb=<s:property value="#ls2.b"/>&bb1=<s:property value="#ls2.b1"/>&bb2=<s:property value="#ls2.b2"/>&bb3=<s:property value="#ls2.b3"/>&bb4=<s:property value="#ls2.b4"/>">编辑</a>
    	</td>
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