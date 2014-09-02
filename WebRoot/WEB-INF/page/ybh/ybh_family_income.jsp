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
		<li style="background:url(${pageContext.request.contextPath }/images/tab-bg2.png); color:#FFF;">样本户年指标</li>
	</ul>
</div>
<div id="member-info-data">
	<h3 id="base-title" style="float:left">样本户基础监测统计</h3>
	<table class="tab-member" cellpadding="0" cellspacing="0">
		<thead>
		<tr>
	    	<td width="4%">年份</td>
	    	<td width="6%">1、家庭人口(人)</td>
	        <td width="6%">2、家庭劳动力(个)</td>
	        <td width="8%">3、家庭承包耕地面积(亩)</td>
	        <td width="8%">4、家庭年总纯收入(元)</td>
	        <td width="8%">5、家庭年人均纯收入(元)</td>
	        <td width="6%">6、主要致贫原因</td>
	        <td width="8%">7、享受扶贫项目支持情况</td>
	        <td width="6%">8、得到帮扶资金(元)</td>
	        <td width="8%">9、使用小额扶贫贷款数量(元)</td>
	        <td width="8%">10、参加社会保障情况</td>
	        <td width="6%">上年是否脱贫</td>
	        <td width="6%">操作</td>
	    </tr>
	    </thead>
	    <tbody>
		    <s:iterator id="ls2" value="#session.vts.list2">
		    <tr>
		    	<td><s:property value="#ls2.year"/></td>
		    	<td><s:property value="#ls2.population"/></td>
		    	<td><s:property value="#ls2.labornum"/></td>
		    	<td><s:property value="#ls2.fields"/></td>
		    	<td><s:property value="#ls2.intotal"/></td>
		    	<td><s:property value="#ls2.inpersonal"/></td>
		    	<td>
		    		<s:if test="#ls2.dcause==1">&nbsp;1:因灾</s:if>
	            	<s:elseif test="#ls2.dcause==2">&nbsp;2:因病</s:elseif>
	            	<s:elseif test="#ls2.dcause==3">&nbsp;3:因残</s:elseif>
	            	<s:elseif test="#ls2.dcause==4">&nbsp;4:因学</s:elseif>
	            	<s:elseif test="#ls2.dcause==5">&nbsp;5:缺技术</s:elseif>
	            	<s:elseif test="#ls2.dcause==6">&nbsp;6:缺劳动力</s:elseif>
	            	<s:elseif test="#ls2.dcause==7">&nbsp;7:缺资金</s:elseif>
	            	<s:elseif test="#ls2.dcause==8">&nbsp;8:其它</s:elseif>
		    	</td>
		    	<td>
		    		<s:if test="#ls2.fs==1">
		    		√
		    		</s:if>
		    		<s:else>
		    		&nbsp;
		    		</s:else>
		    	</td>
		    	<td><s:property value="#ls2.v"/></td>
		    	<td><s:property value="#ls2.xe"/></td>
		    	<td>
		    		<s:if test="#ls2.b==1">
		    		√
		    		</s:if>
		    		<s:else>
		    		&nbsp;
		    		</s:else>
		    	</td>
		    	<td>
		    		<s:if test="#ls2.ltp==1">
		    		是
		    		</s:if>
		    		<s:else>
		    		否
		    		</s:else>
		    	</td>
		    	<td>
		    		<a href="${pageContext.request.contextPath }/ybhManageAction_editIncome.action?hname=<s:property value="#session.vts.map.hname"/>&year=<s:property value="#ls2.year"/>&population=<s:property value="#ls2.population"/>&labornum=<s:property value="labornum"/>&wlabornum=<s:property value="#ls2.wlabornum"/>&fields=<s:property value="#ls2.fields"/>&lzmj=<s:property value="#ls2.lzmj"/>&intotal=<s:property value="#ls2.intotal"/>&injy=<s:property value="#ls2.injy"/>&inwork=<s:property value="#ls2.inwork"/>&incz=<s:property value="#ls2.incz"/>&lzzj=<s:property value="#ls2.lzzj"/>&inbz=<s:property value="#ls2.inbz"/>&zlbz=<s:property value="#ls2.zlbz"/>&isv1=<s:property value="#ls2.isv1"/>&isv2=<s:property value="#ls2.isv2"/>&isv3=<s:property value="#ls2.isv3"/>&isv4=<s:property value="#ls2.isv4"/>&isv5=<s:property value="#ls2.isv5"/>&isv6=<s:property value="#ls2.isv6"/>&inpersonal=<s:property value="#ls2.inpersonal"/>&dcause=<s:property value="#ls2.dcause"/>&fs=<s:property value="#ls2.fs"/>&fs1=<s:property value="#ls2.fs1"/>&fs2=<s:property value="#ls2.fs2"/>&fs3=<s:property value="#ls2.fs3"/>&fs4=<s:property value="#ls2.fs4"/>&fs5=<s:property value="#ls2.fs5"/>&fs6=<s:property value="#ls2.fs6"/>&fs7=<s:property value="#ls2.fs7"/>&fs8=<s:property value="#ls2.fs8"/>&vv=<s:property value="#ls2.v"/>&vv1=<s:property value="#ls2.v1"/>&vv2=<s:property value="#ls2.v2"/>&xxe=<s:property value="#ls2.xe"/>&bb=<s:property value="#ls2.b"/>&bb1=<s:property value="#ls2.b1"/>&bb2=<s:property value="#ls2.b2"/>&bb3=<s:property value="#ls2.b3"/>&bb4=<s:property value="#ls2.b4"/>&ltp=<s:property value="#ls2.ltp"/>">编辑</a>
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