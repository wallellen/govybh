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
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/voicet-common-1.0.js"></script>
	
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
<body style="background:#E0EEFB;">
<div style="float:left; width:868px; height:668px;">
	<div style="width:640px; height:22px; margin-top:10px;" class="title-stats">人口查询&nbsp;[<s:property value="#session.vts.map.name"/>]</div>
	<form name="memberForm" action="${pageContext.request.contextPath }/ybhMemberAction_queryMember.action" method="post" onsubmit="return changeCurPage()">
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:60px;">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td width="10%" align="right"></td>
				<td width="10%">
					<input type="checkbox"/>全省范围
				</td>
				<td width="10%" align="right"></td>
				<td width="10%">
				<input type="button" value="选择县" onclick="popTips()"/>
				</td>
				<td width="10%" align="right"></td>
				<td width="8%" align="left">
				</td>
				<td width="10%" align="left">
				</td>
				<td width="20%" align="center"></td>
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
				<td width="8%" align="left">
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
	<div style="height:60px;">
		<table cellpadding="0" cellspacing="0">
			<tr height="24px;">
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
			<tr height="24px;">
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
	<div class="table-c" style="width:868px; height:424px; border:0px solid red; margin-top:4px;">
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
				<td width="4%">操作</td>
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
					<td>
						&nbsp;
					</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- js分页div -->
	<div class="split-page">
		<!-- 每页行数 -->
		<input type="hidden" id="pageRows" value="17"/>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/script/tipswindown.js"></script>
<script type="text/javascript">
//弹出层调用
function popTips(){
	showTipsWindown("选择村", 'simTestContent', 300, 255);
}
function showTipsWindown(title,id,width,height){
	tipsWindown(title,"id:"+id,width,height,"true","","true",id);
}


</script>
<div style="display:none;">
<div id="simTestContent" class="simScrollCont">
	<div class="mainlist">
		<table cellpadding="0" cellspacing="0" width="100%">
           	<tr style="background:#C0C0C0">
              	<td colspan="2" align="left">淮安市-清浦区-盐河镇</td>
			</tr>
            <tr>
              	<td align="right">&nbsp;&nbsp;<input type="checkbox"/></td>
              	<td align="left">&nbsp;盐河居委会</td>
             </tr>
             <tr>
              	<td align="right">&nbsp;&nbsp;<input type="checkbox"/></td>
              	<td align="left">&nbsp;杨庙村委会</td>
              </tr>
              <tr>
              	<td align="right">&nbsp;&nbsp;<input type="checkbox"/></td>
              	<td align="left">&nbsp;甘露村委会</td>
              </tr>
              <tr style="background:#C0C0C0">
              	<td colspan="2" align="left">淮安市-清浦区-黄码乡</td>
			</tr>
            <tr>
              	<td align="right">&nbsp;&nbsp;<input type="checkbox"/></td>
              	<td align="left">&nbsp;运西村委会</td>
             </tr>
             <tr>
              	<td align="right">&nbsp;&nbsp;<input type="checkbox"/></td>
              	<td align="left">&nbsp;运南村委会</td>
              </tr>
              <tr>
              	<td align="right">&nbsp;&nbsp;<input type="checkbox"/></td>
              	<td align="left">&nbsp;吴圩村委会</td>
              </tr>
           </table>
	</div>
</div>
</div>
</html>