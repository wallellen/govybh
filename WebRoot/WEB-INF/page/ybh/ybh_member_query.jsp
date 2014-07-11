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
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/farmem.js"></script>
	<!-- fancybox插件开始 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/fancybox/jquery.fancybox-1.3.1.pack.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/fancybox/fancybox.css" />
	<!-- fancybox插件结束 -->
	<script type="text/javascript">
		function setTab(name,cursel,n){
			for(i=1;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"hover":"";
				con.style.display=i==cursel?"block":"none";
			}
		}
	</script>
	
	<style type="text/css">
		#data{width:620px; height:200px;}
		.Menubox{height:28px; border-bottom:1px solid #64B8E4; background:#E4F2FB;}
		.Menubox ul{list-style:none;margin:0px 2px;padding:0;}
		.Menubox ul li{float:left;background:#64B8E4;line-height:28px;display:block;cursor:pointer;text-align:center;color:#fff;font-weight:bold;border-top:1px solid #64B8E4;border-left:1px solid #64B8E4;border-right:1px solid #64B8E4; margin-right:2px;padding: 0 5px 0 5px;}
		.Menubox ul li.hover{background:#fff;border-bottom:1px solid #fff;color:#147AB8;}
		.Contentbox{clear:both;margin-top:0px;border-top:none;height:150px;padding-top:4px;}
		.Contentbox ul{list-style:none;margin:7px;padding:0;}
		.Contentbox ul li{line-height:24px; width:58px; float:left; margin-right:5px;}	
	</style>
	
	
</head>
<body style="background:#E0EEFB;">
<div style="float:left; width:868px; height:668px;">
	<div style="width:640px; height:22px; margin-top:10px;" class="title-stats">人口查询&nbsp;[<s:property value="#session.vts.map.name"/>]</div>
	<form name="memberForm" action="${pageContext.request.contextPath }/ybhMemberAction_queryMember.action" method="post" onsubmit="return changeCurPage()">
	<input type="hidden" id="xmlist" name="xmlist" value=""/>
	<input type="hidden" id="xmname" name="xmname" value="[全省]"/>
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:58px; line-height:26px;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="10%" align="right" class="td_bottom_line">
					<a id="various1" href="#data" kesrc="#data" title="选择县" class="sel_title">选择县&nbsp;</a>
				</td>
				<td colspan="7" class="td_bottom_line">&nbsp;<label id="selxian"><s:property value="xmname"/></label></td>
			</tr>
			<tr>
				<td width="10%" align="right">姓名：&nbsp;</td>
				<td width="10%">
					<input type="text" name="memberstr" value="<s:property value="#session.vts.map.marr[0]"/>" maxlength="15" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/>
				</td>
				<td width="10%" align="right">性别：&nbsp;</td>
				<td width="10%">
					
					<s:select name="memberstr" list="#application.vta.GetList('sexex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[1]}"></s:select>
					
				</td>
				<td width="10%" align="right">年龄：&nbsp;</td>
				<td width="6%" align="left">
					<s:select name="memberstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.marr[2]}"></s:select>
				</td>
				<td width="10%" align="left">
					<input type="text" name="memberstr" value="<s:property value="#session.vts.map.marr[3]"/>" maxlength="15" class="inptxt12" onfocus="this.className='input_on12'" onblur="this.className='input_off12'" onkeyup="checkIntInput(this)"/>
				</td>
				<td width="20%" align="center"><input id="searchImg" type="submit" value="立即查询" class="button4"/></td>
			</tr>
		</table>	
	</div>
	</fieldset>
	<div style="height:5px;"></div>
	<!-- advance -->
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>高级选项</legend>
	<div style="height:55px; line-height:24px;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td width="20%" align="right">在校生：</td>
				<td width="10%" align="left">
					<s:select name="memberstr" cssClass="borwer-sel" list="#application.vta.GetList('yesnoex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[4]}"></s:select>
				</td>
				<td width="20%" align="right">文化程度：</td>
				<td width="10%" align="left">
					<s:select name="memberstr" cssClass="borwer-sel" list="#application.vta.GetList('educationex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[5]}"></s:select>
				</td>
				<td width="20%" align="right">身体状况：</td>
				<td width="10%" align="left">
					<s:select name="memberstr" cssClass="borwer-sel" list="#application.vta.GetList('healthex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[6]}"></s:select>
				</td>
				<td width="10%"></td>
			</tr>
			<tr>
				<td align="right">劳动力状况：</td>
				<td align="left">
					<s:select name="memberstr" cssClass="borwer-sel" list="#application.vta.GetList('laborex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[7]}"></s:select>
				</td>
				<td align="right">打工状况：</td>
				<td align="left">
					<s:select name="memberstr" cssClass="borwer-sel" list="#application.vta.GetList('workex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[8]}"></s:select>
				</td>
				<td align="right">低保人口：</td>
				<td align="left">
					<s:select name="memberstr" cssClass="borwer-sel" list="#application.vta.GetList('yesnoex')" listKey="id" listValue="str" value="%{#session.vts.map.marr[9]}"></s:select>
				</td>
				<td width="10%"></td>
			</tr>
		</table>	
	</div>
	</fieldset>
	</form>
	<s:if test="#session.vts.list2!=null && #session.vts.list2.size()>0">
	<div style="height:18px; line-height:18px; padding-top:2px;">
		<span>符合查询条件人口数：<s:property value="#session.vts.map.membernt"/>人</span>
		<span style="float:right; width:60px;">
			<!--  
			<input type="button" value="导出" onclick="location.href='${pageContext.request.contextPath }/system/govFarmerQueryAction_exportMemberInfo.do?memberstr=<s:property value="memberstr"/>'" class="button43"/>
			-->
		</span>
	</div>
	</s:if>
	<s:if test="#session.vts.list2!=null && #session.vts.list2.size()>0">
	<div class="table-c" style="width:868px; height:450px; border:0px solid red; margin-top:4px;">
		<table class="data_list" width="100%" bordercolor="gray" border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr class="tabtr1">
				<td width="6%">姓名</td>
				<td width="4%">性别</td>
				<td width="4%">年龄</td>
				<td width="4%">在校生</td>
				<td width="10%">文化程度</td>
				<td width="10%">身体状况</td>
				<td width="10%">劳动力状况</td>
				<td width="8%">打工状况</td>
				<td width="6%">低保人口</td>
				<td width="6%">领取金额</td>
			</tr>
			</thead>
			<tbody id="splitpage">
				<s:iterator value="#session.vts.list2" var="ls2">
				<tr align="center" style="height:20px; display:none;">
					<td align="left">&nbsp;<s:property value="#ls2.uname"/></td>
					<td><s:property value="#ls2.sex"/></td>
					<td align="right"><s:property value="#ls2.age"/>&nbsp;</td>
					<td><s:property value="#ls2.school"/></td>
					<td align="left">&nbsp;<s:property value="#ls2.education"/></td>
					<td align="left">&nbsp;<s:property value="#ls2.hearth"/></td>
					<td align="left">&nbsp;<s:property value="#ls2.labors"/></td>
					<td align="left">&nbsp;<s:property value="#ls2.works"/></td>
					<td><s:property value="#ls2.bla"/></td>
					<td align="right"><s:property value="#ls2.tbfd"/>&nbsp;</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- js分页div -->
	<div class="split-page">
		<!-- 每页行数 -->
		<input type="hidden" id="pageRows" value="21"/>
		<div id="changePage"></div>
	</div>
	</s:if>
</div>
</body>
<script type="text/javascript">
	//立即查询之后重置当前页
	function changeCurPage(){
		parent.document.getElementById("globalCurPage").value=1;
	}
</script>
<!-- fancybox start -->
<div style="display:none;">
    <div id="data">
    <s:property value="#session.vts.html" escape="false"/>
    </div>
</div>
<!-- fancybox end -->
<script type="text/javascript">
   	$(document).ready(function() {
		$("#various1").fancybox({
			//是否显示标题 
			'titleShow':'true',
			//设置标题显示的位置,可设置为outside,inside,over
			'titlePosition':'outside',
			//设置动画效果,可设置为elastic,fade,none
			'transitionIn':'none',
			'transitionOut':'none',
			
		});				   
	});
</script>
</html>