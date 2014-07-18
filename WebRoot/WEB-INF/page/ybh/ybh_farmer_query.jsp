<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/datePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/datePicker/WdatePicker.js"></script>
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
	
	<script type="text/javascript">
		//保存查询参数
		function loadParam(){
			var qparam = document.getElementById("qparam").value;
			var qstr = document.getElementsByName("qstr");
		}
		function changeCurPage(){
			parent.document.getElementById("globalCurPage").value=1;
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
<body onload="loadParam()" style="background:#E0EEFB;">
<div style="float:right; width:868px; height:668px;">
	<h3 class="ybh_h3_title">农户查询</h3>
	<form name="farmerForm" action="${pageContext.request.contextPath }/ybhFarmerAction_queryFarmer.action" method="post" onsubmit="return changeCurPage()">
	<input type="hidden" id="xmlist" name="xmlist" value=""/>
	<input type="hidden" id="xmname" name="xmname" value="[全省]"/>
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:60px; line-height:26px;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td align="right" width="15%" class="td_bottom_line">
					<a id="various1" href="#data" kesrc="#data" title="选择县" class="sel_title">选择县&nbsp;</a>
				</td>
				<td colspan="4" class="td_bottom_line">
				&nbsp;<label id="selxian"><s:property value="xmname"/></label>
				</td>
			</tr>
		</table>
		<div style="height:2px;"></div>
		<table>
			<tr>
				<td width="10%" align="right">农户编码:&nbsp;</td>
				<td width="10%"><input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[0]"/>" maxlength="15" onkeyup="value=value.replace(/[^\d]/g,'')" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/></td>
				<td width="10%" align="right">户主姓名:&nbsp;</td>
				<td width="10%"><input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[1]"/>" maxlength="10" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/></td>
				<td width="10%" align="center"><input id="searchImg" type="submit" value="立即查询" class="button4"/></td>
			</tr>
		</table>	
	</div>
	</fieldset>
	<div style="height:5px;"></div>
	<!-- advance -->
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>高级选项</legend>
	<div style="height:78px;">
		<table cellpadding="0" cellspacing="0" width="100%">
			<tr height="24px;">
				<td width="16%" align="right">家庭人口：</td>
				<td width="8%" align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[2]}"></s:select>
				</td>
				<td width="14%" align="left"><input type="text" name="qstr" maxlength="5" value="<s:property value="#session.vts.map.qarr[3]"/>" onkeyup="value=value.replace(/[^\d]/g,'')" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'"/></td>
				<td width="12%" align="right">劳动力：</td>
				<td width="8%" align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[4]}"></s:select>
				</td>
				<td width="14%" align="left"><input type="text" name="qstr" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'" maxlength="5" value="<s:property value="#session.vts.map.qarr[5]"/>" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
				<td width="12%" align="right">家庭属性：</td>
				<td width="14%" align="left">
					<s:select name="qstr" cssClass="borwer-sel" list="#application.vta.GetList('familyex')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[6]}"></s:select>
				</td>
			</tr>
			<tr height="24px;">
				<td align="right">住房面积：</td>
				<td align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[7]}"></s:select>
				</td>
				<td align="left"><input type="text" name="qstr" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'" maxlength="5" value="<s:property value="#session.vts.map.qarr[8]"/>" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
				<td align="right">耕地：</td>
				<td align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[9]}"></s:select>
				</td>
				<td align="left"><input type="text" name="qstr" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'" maxlength="5" value="<s:property value="#session.vts.map.qarr[10]"/>" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
				<td align="right">贫困原因：</td>
				<td align="left">
					<s:select name="qstr" cssClass="borwer-sel" list="#application.vta.GetList('dcauseex')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[11]}"></s:select>
				</td>
			</tr>
			<tr height="24px;">
				<td align="right">家庭总收入：</td>
				<td align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[12]}"></s:select>
				</td>
				<td align="left"><input type="text" name="qstr" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'" maxlength="5" value="<s:property value="#session.vts.map.qarr[13]"/>" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
				<td align="right">年人均收入：</td>
				<td align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[14]}"></s:select>
				</td>
				<td align="left"><input type="text" name="qstr" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'" maxlength="5" value="<s:property value="#session.vts.map.qarr[15]"/>" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
				<td align="right">年份：</td>
				<td align="left">
					<input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[16]"/>" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy'})" class="Wdate" style="width:80px; height:18px;" maxlength="4"/>
				</td>
			</tr>
		</table>	
	</div>
	</fieldset>
	</form>
	<s:if test="#session.vts.list2!=null && #session.vts.list2.size()>0">
	<div style="height:16px; padding-top:2px; border:0px solid red;">
	<span>符合查询条件农户数：<s:property value="#session.vts.map.farmernt"/>户,</span>
	<span>人口数：<s:property value="#session.vts.map.peoplent"/>人</span>
		<span style="float:right; width:60px;">
			<!-- 
			<input type="button" value="导出" onclick="location.href='${pageContext.request.contextPath }/ybhFarmerAction_exportFarmerInfo.action'" class="button43"/>
			-->
		</span>
	</div>
	<div class="table-c" style="width:868px; height:426px; border:0px solid red; margin-top:4px;">
		<table class="data_list" width="100%" bordercolor="gray" border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr class="tabtr1">
				<td width="15%">农户编码</td>
				<td width="45%">省、市、县、乡、村</td>
				<td width="25%">户主姓名</td>
				<td width="15%">操作</td>
			</tr>
			</thead>
			<tbody id="splitpage">
				<s:iterator value="#session.vts.list2" var="ls2">
				<tr align="center" style="height:20px; display:none;">
					<td align="left">&nbsp;<s:property value="#ls2.hm"/></td>
					<td align="left">&nbsp;<s:property value="#ls2.govname"/></td>
					<td align="left">&nbsp;<s:property value="#ls2.hname"/></td>
					<td align="center">
						<s:if test="#session.vts.rbm.length()==6">
						<a href="${pageContext.request.contextPath }/ybhManageAction_detail.action?viewBM=<s:property value="#ls.hm"/>&rtf=home">编辑</a>&nbsp;
						</s:if>
						<a href="${pageContext.request.contextPath }/ybhManageAction_viewReportFamily.action?viewBM=<s:property value="#ls.hm"/>">查看</a>&nbsp;
			 			<a id="printBt" href="${pageContext.request.contextPath }/ybhManageAction_printFamily.action?viewBM=<s:property value="#ls.hm"/>" target="printFrame">打印</a>
					</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- js分页div -->
	<div class="split-page">
		<!-- 每页行数 -->
		<input type="hidden" id="pageRows" value="20"/>
		<div id="changePage"></div>
	</div>
	</s:if>
</div>
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
			'titleShow':'false',
			//设置标题显示的位置,可设置为outside,inside,over
			'titlePosition':'outside',
			//设置动画效果,可设置为elastic,fade,none
			'transitionIn':'none',
			'transitionOut':'none',
			
		});				   
	});
</script>
</body>
</html>