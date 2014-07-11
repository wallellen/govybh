<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		window.onload=function(){
			var v1 = parent.document.getElementById("navigate");
			v1.innerHTML=document.getElementById('nav-hide').innerHTML;
		}
		var rflag = 1;
		function printFamilyInfo(){
			document.getElementById("printBtn").href='govBrowerAction_printFamily.do';
			rflag=rflag+1;
		}
		function returnFamilyList(){
			document.getElementById("returnBtn").href="javascript:history.go(-"+rflag+");";
		}
	</script>
</head>
<body style="background:#E0EEFB;">
<div style="display:none;" id="nav-hide">
	<s:property value="#session.vts.navPath" escape="false"/>
</div>
<div id="leftCon1">
	<div class="view-family-report">
    <h1>脱贫奔小康低收入农户登记表</h1>
    <p class="view-print">
	    <a id="printBtn" onclick="printFamilyInfo()" target="printFrame" style="cursor:pointer;">打印</a>
		<!--
		<a href="${pageContext.request.contextPath }/system/govBrowerAction_backup.do">返回</a>
		-->
		<a id="returnBtn" onclick="returnFamilyList()" style="cursor:pointer;">返回</a>
    </p>
    <div id="view-family-tit">
    	<div class="viewleft">
        	<p class="view-sp1">
            	<span><u><s:property value="#session.vts.map.x"/></u>&nbsp;县(市、区)</span>
                <span><u><s:property value="#session.vts.map.xx"/></u>&nbsp;乡(镇)</span>
                <span><u><s:property value="#session.vts.map.c"/></u>&nbsp;村</span>
                <span><u><s:property value="#session.vts.map.z"/></u>&nbsp;组</span>
			</p>
            <p class="view-sp2">
            	<span>县码：<u><s:property value="#session.vts.map.xm"/></u></span>
                <span>乡(镇)：<u><s:property value="#session.vts.map.xxm"/></u></span>
                <span>村码：<u><s:property value="#session.vts.map.cm"/></u></span>
                <span>户码：<u><s:property value="#session.vts.map.hm"/></u></span>
            </p>
        </div>
        <div class="viewright">
        	<p>表号：T001表</p>
            <p>文号：国开发(2010)25号</p>
            <p>制表机关：江苏省扶贫办</p>
        </div>
        <div style="clear:both"></div>
    </div>
    
	<table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td colspan="11">一、低收入农户基本情况</td>
        </tr>
        <tr>
        	<td width="10%">姓名</td>
            <td width="6%">性别<br/>1男2女</td>
			<td width="4%">年龄</td>
			<td width="8%">在校生<br/>1是2否</td>
			<td width="4%">文化程度</td>
			<td width="4%">身体状况</td>
			<td width="14%">残疾证号</td>
			<td width="6%">劳动力<br/>状况</td>
			<td width="4%">打工状况</td>
			<td width="8%">低保人口<br/>1是2否</td>
			<td width="12%">领取低保金、五保、残疾金(元)</td>
        </tr>
        <s:iterator value="#session.vts.list" var="ls" status="sc">
		<tr>
			<td>&nbsp;<s:property value="#ls.uname"/></td>
			<td>&nbsp;<s:property value="#ls.sex"/></td>
			<td>&nbsp;<s:property value="#ls.age"/></td>
			<td>&nbsp;<s:property value="#ls.school"/></td>
			<td>&nbsp;<s:property value="#ls.education"/></td>
			<td>&nbsp;<s:property value="#ls.health"/></td>
			<td>&nbsp;<s:property value="#ls.dcno"/></td>
			<td>&nbsp;<s:property value="#ls.labors"/></td>
			<td>&nbsp;<s:property value="#ls.works"/></td>
			<td>&nbsp;<s:property value="#ls.bla"/></td>
			<td>&nbsp;<s:property value="#ls.tbfd"/></td>
		</tr>
		</s:iterator>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="15%">家庭人口(人)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.population"/></td>
			<td width="15%">劳动力(人)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.labornum"/></td>
			<td width="15%">承包耕地面积(亩)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.fields"/></td>
			<td width="15%">住房面积(m2)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.house"/></td>
        </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="50%" align="left">&nbsp;&nbsp;农户属性(单选)1扶贫户,2低保户,3五保户</td>
			<td width="10%" align="center">&nbsp;<s:property value="#session.vts.map.property"/></td>
			<td width="20%" align="center">联系电话</td>
			<td width="20%" align="center">&nbsp;<s:property value="#session.vts.map.telnum"/></td>
        </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="80%" align="left">&nbsp;&nbsp;贫困原因(单选):1因灾,2因病,3因残,4因学,5缺技术,6缺劳力,7缺资金,8其它</td>
			<td width="20%" align="center">&nbsp;<s:property value="#session.vts.map.dcause"/></td>
        </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="20%" align="left">&nbsp;&nbsp;户主身份证号</td>
			<td width="80%" align="center">&nbsp;<s:property value="#session.vts.map.idcno"/></td>
        </tr>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="15%" align="left">&nbsp;&nbsp;挂钩帮扶人</td>
			<td width="15%" align="center">&nbsp;<s:property value="#session.vts.map.frname"/></td>
			<td width="10%" align="center">联系电话</td>
			<td width="20%" align="center">&nbsp;<s:property value="#session.vts.map.frtel"/></td>
			<td width="10%" align="center">单位职务</td>
			<td width="30%" align="center">&nbsp;<s:property value="#session.vts.map.frwork"/></td>
        </tr>
    </table>
    <table class="last-tab" width="100%" cellpadding="0" cellspacing="0">
    	<!-- start -->
    	<s:iterator value="#session.vts.list2" var="ls2" status="sc">
    	<s:if test="#sc.count==1">
    		<tr>
                <td rowspan="9">二、脱贫进程</td>
                <td width="22%">指标名称</td>
		      	<td width="8%">单位</td>
		       	<td width="6%">代码</td>
		       	<td width="10%"><s:property value="#session.vts.map.y1"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y2"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y3"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y4"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y5"/>年</td>
            </tr>
    	</s:if>
    	<tr>
    		<s:elseif test="#sc.count==9">
    		<td rowspan="5">三、帮扶情况</td>
    		</s:elseif>
    		<td align="left">&nbsp;&nbsp;<s:property value="#ls2.ids"/></td>
	      	<td>&nbsp;<s:property value="#ls2.unit"/></td>
	       	<td>&nbsp;<s:property value="#ls2.code"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v1"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v2"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v3"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v4"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v5"/></td>
    	</tr>
    	</s:iterator>
    	<!-- end -->
		<tr>
			<td colspan="4">农&nbsp;&nbsp;户&nbsp;&nbsp;签&nbsp;&nbsp;名&nbsp;&nbsp;(盖章)</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
            <td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4">填&nbsp;&nbsp;表&nbsp;&nbsp;人&nbsp;&nbsp;签&nbsp;&nbsp;名</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
	       	<td>&nbsp;</td>
	       	<td>&nbsp;</td>
	       	<td>&nbsp;</td>
		</tr>
    </table>
  	<p class="view-report-tip">注：<font style="font-size:16px;">①</font>文化程度：1文盲、半文盲，2小学，3初中，4高中，5大专，6大专以上，7学龄年儿童；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">②</font>身体健状况：1健康，2体弱多病，3长期慢性病，4患有大病，5残疾人；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">③</font>劳动力状况：1劳动力，2丧失劳动力，3非劳动力；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">④</font>打工状况：1在家务农，2县内务工，3县外省内务工，4省外务工，5其他（国外）。</p>
    </div>
</div>
<s:if test="#session.vts.hasStack()">
	<s:property value="#session.vts.popAllList()"/>
</s:if>
</body>
</html>