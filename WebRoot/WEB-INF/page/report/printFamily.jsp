<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript">
		function findPrint3(){
			window.setTimeout(printView, 1);
		}
		function printView(){
			// 获得打印窗口焦点
			parent.printFrame.focus();
			window.print();
			return false;
		}
	</script>
</head>
<body onload="findPrint3()" style="background:#E0EEFB;">
<div id="leftCon1">
<div class="view-family-report1">
    <h1>样本户基础监测信息表</h1>
    <p class="view-print">&nbsp; </p>
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
    </div>
    
	<table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td colspan="19">一、低收入农户基本情况</td>
        </tr>
        <tr>
        	<td width="8%">姓名</td>
            <td width="6%">性别<br/>1男2女</td>
			<td width="4%">年龄</td>
			<td width="8%">在校生<br/>1是2否</td>
			<td width="4%">文化程度</td>
			<td width="4%">身体状况</td>
			<td width="6%">劳动力<br/>状况</td>
			<td width="4%">打工状况</td>
			<td width="8%">低保人口<br/>1是2否</td>
			<td width="2%">A1</td>
			<td width="2%">A2</td>
			<td width="2%">A3</td>
			<td width="2%">A4</td>
			<td width="2%">A5</td>
			<td width="2%">B1</td>
			<td width="2%">B2</td>
			<td width="2%">B3</td>
			<td width="2%">B4</td>
			<td width="2%">B5</td>
        </tr>
        <s:iterator value="#session.vts.list" var="ls" status="sc">
		<tr>
			<td>&nbsp;<s:property value="#ls.uname"/></td>
			<td>&nbsp;<s:property value="#ls.sex"/></td>
			<td>&nbsp;<s:property value="#ls.age"/></td>
			<td>&nbsp;<s:property value="#ls.school"/></td>
			<td>&nbsp;<s:property value="#ls.education"/></td>
			<td>&nbsp;<s:property value="#ls.hearth"/></td>
			<td>&nbsp;<s:property value="#ls.labors"/></td>
			<td>&nbsp;<s:property value="#ls.works"/></td>
			<td>&nbsp;<s:property value="#ls.bla"/></td>
			<td>&nbsp;<s:property value="#ls.ist1==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ist2==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ist3==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ist4==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ist5==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ish1==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ish2==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ish3==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ish4==1?'√':''"/></td>
			<td>&nbsp;<s:property value="#ls.ish5==1?'√':''"/></td>
		</tr>
		</s:iterator>
    </table>
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="15%">家庭人口(人)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.population"/></td>
			<td width="15%">劳动力(人)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.labornum"/></td>
			<td width="15%">务工劳动力(个)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.wlabornum"/></td>
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
        	<td width="20%" align="left">&nbsp;&nbsp;挂钩帮扶人</td>
			<td width="20%" align="center">&nbsp;<s:property value="#session.vts.map.frname"/></td>
			<td width="10%" align="center">联系电话</td>
			<td width="20%" align="center">&nbsp;<s:property value="#session.vts.map.frtel"/></td>
			<td width="10%" align="center">单位职务</td>
			<td width="20%" align="center">&nbsp;<s:property value="#session.vts.map.frwork"/></td>
        </tr>
    </table>
    <!-- 2014-831 add begin -->
    <table width="100%" cellpadding="0" cellspacing="0">
    	<tr>
        	<td width="16%">承包耕地面积(亩)</td>
			<td width="10%">&nbsp;<s:property value="#session.vts.map.fields"/></td>
        	<td width="14%" align="left">&nbsp;&nbsp;是否愿意流转</td>
			<td width="10%" align="center">&nbsp;<s:property value="#session.vts.map.islz==1?'1:是':'2:否'"/></td>
			<td width="14%" align="center">流转面积</td>
			<td width="10%" align="center">&nbsp;<s:property value="#session.vts.map.lzmj"/></td>
			<td width="14%" align="center">去年是否脱贫</td>
			<td width="10%" align="center">&nbsp;<s:property value="#session.vts.map.tpl==1?'1:是':'2:否'"/></td>
        </tr>
    </table>
    <!-- 2014-831 add end -->
    <table class="last-tab" width="100%" cellpadding="0" cellspacing="0">
    	<!-- start -->
    	<s:iterator value="#session.vts.list2" var="ls2" status="sc">
    	<s:if test="#sc.count==1">
    		<tr>
		       	<td width="6%">编号</td>
                <td width="22%">监测指标名称</td>
		       	<td width="10%"><s:property value="#session.vts.map.y1"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y2"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y3"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y4"/>年</td>
		       	<td width="10%"><s:property value="#session.vts.map.y5"/>年</td>
            </tr>
    	</s:if>
    	<tr>
	       	<td>&nbsp;<s:property value="#ls2.code"/></td>
	       	<s:if test="#ls2.st==1">
	       		<td align="left" style="font-weight:bold">&nbsp;<s:property value="#ls2.ids"/></td>
	       	</s:if>
	       	<s:else>
	       		<td align="right"><s:property value="#ls2.ids"/>&nbsp;</td>
	       	</s:else>
	       	<td>&nbsp;<s:property value="#ls2.v1"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v2"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v3"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v4"/></td>
	       	<td>&nbsp;<s:property value="#ls2.v5"/></td>
    	</tr>
    	</s:iterator>
    	<!-- end -->
    </table>
    <p class="view-report-tip">注：<font style="font-size:16px;">①</font>文化程度：1文盲、半文盲，2小学，3初中，4高中，5大专，6大专以上，7学龄年儿童；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">②</font>身体健状况：1健康，2体弱多病，3长期慢性病，4患有大病，5残疾人；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">③</font>劳动力状况：1劳动力，2丧失劳动力，3非劳动力；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">④</font>打工状况：1在家务农，2县内务工，3县外省内务工，4省外务工，5其他（国外）；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">⑤</font>A1~A5：享受残疾补助、新型农村合作医疗、城乡居民基本养老保险、大病医疗救助、其他补助；</p>
    <p class="view-report-tip1"><font style="font-size:16px;">⑥</font>B1~B4:帮助就业、帮助上学、帮助就医、帮助参保、其他帮扶。</p>
</div>
</div>
<s:if test="#session.vts.hasStack()">
	<s:property value="#session.vts.popAllList()"/>
</s:if>
</body>
</html>