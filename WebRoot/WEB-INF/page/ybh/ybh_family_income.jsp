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
		<li><a href="${pageContext.request.contextPath }/yearDataAction_itemFamily.do">家庭成员信息</a></li>
		<li style="background:url(${pageContext.request.contextPath }/images/tab-bg2.png); color:#FFF;">家庭收入及帮扶情况</li>
	</ul>
</div>
<div id="member-info-data">
	<h3 id="base-title" style="float:left">家庭收入及帮扶情况</h3>
	<table class="tab-member" cellpadding="0" cellspacing="0">
		<thead>
	   	<tr>
	   		<td rowspan="3" width="4%">年份</td>
	        <td colspan="8">家庭年收入情况(元)</td>
	        <td colspan="5">帮扶情况</td>
	        <td rowspan="3" width="8%">操作</td>
	    </tr>
	    <tr>
	    	<td rowspan="2" width="5%">1.全年家庭纯收入</td>
	       	<td colspan="6">其中</td>
			<td rowspan="2" width="5%">2.家庭人均纯收入</td>
	       	<td rowspan="2" width="5%">无偿帮扶资金(元)</td>
	       	<td rowspan="2" width="5%">得到股份(元)</td>
	       	<td rowspan="2" width="5%">小额贷款和互助资金(元)</td>
	       	<td rowspan="2" width="5%">劳动力转移培训(人)</td>
	       	<td rowspan="2" width="5%">劳动力转移就业人数(人)</td>
	    </tr>
	    <tr>
	        <td width="5%">种植业纯收入</td>
	        <td width="5%">养殖业纯收入</td>
	        <td width="5%">务工收入</td>
	        <td width="5%">低保、五保、养老收入</td>
	        <td width="5%">补贴性收入 </td>
	        <td width="5%">其他收入</td>
	    </tr>
	    </thead>
	    <s:iterator value="#session.vts.list5" var="ls5" status="tc">
		<tr>
			<td><s:property value="#ls5.c0"/></td>
			<td><s:property value="#ls5.c1"/></td>
			<td><s:property value="#ls5.c2"/></td>
			<td><s:property value="#ls5.c3"/></td>
			<td><s:property value="#ls5.c4"/></td>
			<td><s:property value="#ls5.c5"/></td>
			<td><s:property value="#ls5.c6"/></td>
			<td><s:property value="#ls5.c7"/></td>
			<td><s:property value="#ls5.c8"/></td>
			<td><s:property value="#ls5.c9"/></td>
			<td><s:property value="#ls5.c10"/></td>
			<td><s:property value="#ls5.c11"/></td>
			<td><s:property value="#ls5.c12"/></td>
			<td><s:property value="#ls5.c13"/></td>
			<td>
			<s:if test="#session.vts.isedit==1 && #ls5.c14==1">
				<s:if test="#ls5.c1.length()>0">
				<a href="javascript:popSaveYear('edit','<s:property value="#ls5.c0"/>','<s:property value="#ls5.c2"/>','<s:property value="#ls5.c3"/>','<s:property value="#ls5.c4"/>','<s:property value="#ls5.c5"/>','<s:property value="#ls5.c6"/>','<s:property value="#ls5.c7"/>','<s:property value="#ls5.c9"/>','<s:property value="#ls5.c10"/>','<s:property value="#ls5.c11"/>','<s:property value="#ls5.c12"/>','<s:property value="#ls5.c13"/>')">修改</a>
				</s:if>
				<s:if test="#ls5.c1.length()==0">
					<a href="javascript:popSaveYear('add','<s:property value="#ls5.c0"/>','','','','','','','','','','','')">添加</a>
				</s:if>
			</s:if>
			</td>
		</tr>
		</s:iterator>
	</table>
</div>
</s:if>

<!-- add year start -->
<div id="overlay-year"></div>
<div id="win-year" style="line-height: 30px">
<h2 style="line-height:20px; text-align:left; margin-top:2px;"><span id="ytitle"><font color="#fff">添加</font></span></h2>
<form name="yearForm" action="" method="post">
<input type="hidden" id="yflag" name="incomearr" value=""/>
<div class="member-list">
	<table width="450px" cellpadding="0" cellspacing="0">
		<tr>
			<td width="50%" align="right"><label id="yearhidden">年份:&nbsp;&nbsp;</label></td>
			<td width="40%" align="left">
				<input type="text" id="y-year" name="incomearr" size="12" class="back-input"/>
			</td>
			<td width="10%" align="left"></td>
		</tr>
		<tr>
			<td align="right">种植业(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yinCrop" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">养殖业(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yinLovStock" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">务工(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yinWork" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">低保、五保、养老(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yinBla" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">补贴(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yinSubside" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">其他(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yinOther" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">无偿帮扶(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="ygrantAid" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">股份分红(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="yshare" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">小额贷款、互相资金(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="ypettyLoan" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">劳动力转移培训(元):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="ylabTrain" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomeMoney(this)"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td align="right">劳动力转移就业(人):&nbsp;&nbsp;</td>
			<td align="left">
				<input type="text" id="ylabJob" name="incomearr" size="12" class="back-input" maxlength="8" onblur="checkIncomePerson(this)"/>
			</td>
			<td></td>
		</tr>
	</table>
</div>
<div id="incomeErrTip" class="fincome-errtip"></div>
<div style="margin-top:20px; margin-left:150px;">
	<input type="button" value="确定" class="button4" onclick="subYearBt()"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input id="y-close" type="button" value="取消" class="button4"/>
</div>
</form>
</div>
<!-- add year end-->
<s:if test="#session.vts.hasStack()">
	<s:property value="#session.vts.popAllList()"/>
</s:if>
</body>
</html>