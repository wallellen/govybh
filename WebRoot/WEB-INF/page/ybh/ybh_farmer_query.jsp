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
		*{margin:0;padding:0;list-style-type:none;}
		a,img{border:0;}
		body{font:12px/180% Arial, Helvetica, sans-serif;}
		label{cursor:pointer;}
		.democode{width:400px;margin:30px auto 0 auto;line-height:24px;}
		.democode h2{font-size:14px;color:#3366cc;height:28px;}
		.agree{margin:40px auto;width:400px;font-size:16px;font-weight:800;color:#3366cc;}
		.mainlist{padding:10px;}
		.mainlist li{height:28px;line-height:28px;font-size:12px;}
		.mainlist li span{margin:0 5px 0 0;font-family:"宋体";font-size:12px;font-weight:400;color:#ddd;}
		.btnbox{text-align:center;height:30px;padding-top:10px;background:#ECF9FF;}
		
		#windownbg{display:none;position:absolute;width:100%;height:100%;background:#000;top:0;left:0;}
		#windown-box{position:fixed;_position:absolute;border:5px solid #E9F3FD;background:#FFF;text-align:left;}
		#windown-title{position:relative;height:30px;border:1px solid #A6C9E1;overflow:hidden;background:url(images/tipbg.png) 0 0 repeat-x;}
		#windown-title h2{position:relative;left:10px;top:5px;font-size:14px;color:#666;}
		#windown-close{position:absolute;right:10px;top:8px;width:10px;height:16px;text-indent:-10em;overflow:hidden;background:url(images/tipbg.png) 100% -49px no-repeat;cursor:pointer;}
		#windown-content-border{position:relative;top:-1px;border:1px solid #A6C9E1;padding:5px 0 5px 5px;}
		#windown-content img,#windown-content iframe{display:block;}
		#windown-content .loading{position:absolute;left:50%;top:50%;margin-left:-8px;margin-top:-8px;}
		</style>
	
</head>
<body onload="loadParam()" style="background:#E0EEFB;">
<div style="float:right; width:868px; height:668px;">
	<div style="width:640px; height:22px; margin-top:10px;" class="title-stats">农户查询&nbsp;[<s:property value="#session.vts.map.name"/>]</div>
	<form name="farmerForm" action="${pageContext.request.contextPath }/system/govFarmerQueryAction_home.do" method="post" onsubmit="return changeCurPage()">
	<input type="hidden" id="qparam" name="qparam" value="<s:property value="qstr"/>"/>
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:60px;">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td width="10%" align="right"><input type="checkbox"/>全省范围</td>
				<td width="10%" align="right"><input type="button" value="选择县" onclick="popTips()"/></td>
				<td width="10%"></td>
				<td width="10%"></td>
				<td width="10%" align="center"></td>
			</tr>
			<tr>
				<td width="10%" align="right">农户编码:&nbsp;</td>
				<td width="10%"><input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[0]"/>" maxlength="15" onkeyup="value=value.replace(/[^\d]/g,'')" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/></td>
				<td width="10%" align="right">户主姓名:&nbsp;</td>
				<td width="10%"><input type="text" name="qstr" value="<s:property value="#session.vts.map.qarr[1]"/>" maxlength="10" class="inptxt1" onfocus="this.className='input_on1'" onblur="this.className='input_off1'"/></td>
				<td width="10%" align="center"><input id="searchImg" type="button" value="立即查询" class="button4"/></td>
			</tr>
		</table>	
	</div>
	</fieldset>
	<div style="height:5px;"></div>
	<!-- advance -->
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>高级选项</legend>
	<div style="height:80px;">
		<table cellpadding="0" cellspacing="0">
			<tr height="24px;">
				<td width="12%" align="right">家庭人口：</td>
				<td width="10%" align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[2]}"></s:select>
				</td>
				<td width="16%" align="left"><input type="text" name="qstr" maxlength="5" value="<s:property value="#session.vts.map.qarr[3]"/>" onkeyup="value=value.replace(/[^\d]/g,'')" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'"/></td>
				<td width="12%" align="right">劳动力：</td>
				<td width="10%" align="left">
					<s:select name="qstr" list="#application.vta.GetList('opt')" listKey="id" listValue="str" value="%{#session.vts.map.qarr[4]}"></s:select>
				</td>
				<td width="16%" align="left"><input type="text" name="qstr" class="inptxt2" onfocus="this.className='input_on2'" onblur="this.className='input_off2'" maxlength="5" value="<s:property value="#session.vts.map.qarr[5]"/>" onkeyup="value=value.replace(/[^\d]/g,'')"/></td>
				<td width="10%" align="right">家庭属性：</td>
				<td width="10%" align="left">
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
	<s:if test="#session.vts.list5!=null && #session.vts.list5.size()>0">
	<div style="height:16px; padding-top:2px; border:0px solid red;">
	<span>符合查询条件农户数：<s:property value="#session.vts.map.farmernt"/>户</span>
		<span style="float:right; width:60px;">
			<input type="button" value="导出" onclick="location.href='${pageContext.request.contextPath }/system/govFarmerQueryAction_exportFarmerInfo.do'" class="button43"/>
		</span>
	</div>
	</s:if>
	<div class="table-c" style="width:868px; height:448px; border:0px solid red; margin-top:4px;">
		<table class="data_list" width="100%" bordercolor="gray" border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr class="tabtr1">
				<td width="20%">农户编码</td>
				<td width="49%">省、市、县、乡、村</td>
				<td width="15%">户主姓名</td>
				<td width="16%" class="tabtd1">操作</td>
			</tr>
			</thead>
			<tbody id="splitpage">
				<tr align="center" style="height:20px;">
					<td align="left">320826100009001</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 张连桂</td>
					<td class="tabtd1">编辑</td>
				</tr>
				<tr align="center" style="height:20px;">
					<td align="left">320826100009002</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 二组肖素梅</td>
					<td class="tabtd1">编辑</td>
				</tr>
				<tr align="center" style="height:20px;">
					<td align="left">320826100009003</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 二组汤志刚</td>
					<td class="tabtd1">编辑</td>
				</tr>
				<tr align="center" style="height:20px;">
					<td align="left">320826100009004</td>
					<td align="left">江苏省淮安市涟水县涟城镇黄河社区居</td>
					<td align="left"> 二组谷寿文</td>
					<td class="tabtd1">编辑</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- js分页div -->
	<div class="split-page">
		<!-- 每页行数 -->
		<input type="hidden" id="pageRows" value="21"/>
		<div id="changePage"></div>
	</div>
	
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/tipswindown.js"></script>
<script type="text/javascript">
//弹出层调用
function popTips(){
	showTipsWindown("选择县", 'simTestContent', 150, 300);
}
function showTipsWindown(title,id,width,height){
	tipsWindown(title,"id:"+id,width,height,"true","","true",id);
}


</script>
<div style="display:none;">
<div id="simTestContent" class="simScrollCont">
	<div class="mainlist">
		<table cellpadding="0" cellspacing="0" width="100%">
           	<s:iterator id="ls" value="#session.vts.list">
           		<tr>
           			<s:if test="#ls.st==0">
           			<td align="left" style="background:gray"><s:property value="#ls.oname"/></td>
           			</s:if>
           			<s:elseif test="#ls.st==1">
           			<td align="center">
           				<input type="checkbox" /><s:property value="#ls.oname"/>
           			</td>
           			</s:elseif>
           		</tr>
           	</s:iterator>
		</table>
	</div>
</div>
</div>
</body>
</html>