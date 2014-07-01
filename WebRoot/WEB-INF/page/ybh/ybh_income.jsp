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
<div id="jiangbu-data1">
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
	<s:iterator id="ls" value="#session.vts.list">
    <tr>
    	<td><s:property value="#ls.year"/></td>
    	<td><s:property value="#ls.intotal"/></td>
    	<td><s:property value="#ls.injy"/></td>
    	<td><s:property value="#ls.inwork"/></td>
    	<td><s:property value="#ls.incz"/></td>
    	<td><s:property value="#ls.inpersonal"/></td>
    	<td>
    		<s:if test="#ls.fs==1">
    		√
    		</s:if>
    		<s:else>
    		&nbsp;
    		</s:else>
    	</td>
    	<td><s:property value="#ls.v"/></td>
    	<td><s:property value="#ls.v1"/></td>
    	<td><s:property value="#ls.v2"/></td>
    	<td><s:property value="#ls.xe"/></td>
    	<td>
    		<a href="${pageContext.request.contextPath }/yearDataAction_editIncome.action?year=<s:property value="year"/>&curhm=<s:property value="curhm"/>&hname=<s:property value="hname"/>&intotal=<s:property value="#ls.intotal"/>&injy=<s:property value="#ls.injy"/>&inwork=<s:property value="#ls.inwork"/>&incz=<s:property value="#ls.incz"/>&inpersonal=<s:property value="#ls.inpersonal"/>&fs=<s:property value="#ls.fs"/>&fs1=<s:property value="#ls.fs1"/>&fs2=<s:property value="#ls.fs2"/>&fs3=<s:property value="#ls.fs3"/>&fs4=<s:property value="#ls.fs4"/>&fs5=<s:property value="#ls.fs5"/>&vv=<s:property value="#ls.v"/>&vv1=<s:property value="#ls.v1"/>&vv2=<s:property value="#ls.v2"/>&xxe=<s:property value="#ls.xe"/>&bb=<s:property value="#ls.b"/>&bb1=<s:property value="#ls.b1"/>&bb2=<s:property value="#ls.b2"/>&bb3=<s:property value="#ls.b3"/>&bb4=<s:property value="#ls.b4"/>">编辑</a>
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