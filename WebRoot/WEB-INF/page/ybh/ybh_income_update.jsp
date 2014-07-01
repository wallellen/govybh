<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/yeardata_income.js"></script>
</head>
<body style="background:#E0EEFB;">
<h3 class="jiangbu-title">[<s:property value="curhm"/>&nbsp;<s:property value="hname"/>]家庭年收入及帮扶情况</h3>
<div class="cunwrap">
	<form name="form1" action="" method="post">
	<input type="hidden" name="rflag" value="<s:property value='rflag'/>"/>
	<input type="hidden" name="incometxt" value="<s:property value='curhm'/>"/>
	<input type="hidden" name="incometxt" value="<s:property value='year'/>"/>
	<input type="hidden" name="curhm" value="<s:property value='curhm'/>"/>
	<input type="hidden" name="hname" value="<s:property value='hname'/>"/>
	<input type="hidden" name="year" value="<s:property value='year'/>"/>
	<table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="30%" align="right">4、家庭年总纯收入(元):&nbsp;</td>
            <td width="20%" align="left">&nbsp;<s:property value="intotal"/></td>
            <td width="30%" align="right">8、得到帮扶资金(元):&nbsp;</td>
            <td width="20%" align="left">&nbsp;<s:property value="vv"/></td>
        </tr>
        <tr>
        	<td align="right">其中:(1)家庭经营性收入(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId1" name="incometxt" value="<s:property value='injy'/>" maxlength="10" onblur="checkInjy(this)"/></td>
            <td align="right">其中:(1)省级扶贫资金(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId4" name="incometxt" value="<s:property value='vv1'/>" maxlength="10" onblur="checkVv1(this)"/></td>
        </tr>
        <tr>
        	<td align="right">(2)工资性收入(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId2" name="incometxt" value="<s:property value='inwork'/>" maxlength="10" onblur="checkInwork(this)"/></td>
            <td align="right">(2)市、县级扶贫资金(元):&nbsp;</td>
			<td align="left"><input type="text" id="incId5" name="incometxt" value="<s:property value='vv2'/>" maxlength="10" onblur="checkVv2(this)"/></td>
        </tr>
        <tr>
        	<td align="right">(3)财产性及转移性收入(元):&nbsp;</td>
			<td align="left"><input type="text" id="incId3" name="incometxt" value="<s:property value='incz'/>" maxlength="10" onblur="checkIncz(this)"/></td>
            <td align="right"></td>
			<td align="left"></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip1"></div>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="30%" align="right">5、家庭年人均纯收入(元):&nbsp;</td>
			<td width="20%" align="left">&nbsp;<s:property value="inpersonal"/></td>
            <td width="30%" align="right">9、使用小额扶贫贷款数量(元):&nbsp;</td>
			<td align="left"><input type="text" id="incId6" name="incometxt" value="<s:property value='xxe'/>" maxlength="10" onblur="checkXe(this)"/></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip2"></div>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="30%" align="right">7、享受扶贫项目支持情况:&nbsp;</td>
			<td width="20%" align="left">
				<s:if test="fs==1">
				<input type="checkbox" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
            <td align="center" colspan="2">10、参加社会保障情况&nbsp;&nbsp;</td>
        </tr>
        <tr>
        	<td align="right">其中:(1)产业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs1==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectFs1(this)"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectFs1(this)"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td width="30%" align="right">新农合:&nbsp;</td>
			<td width="20%" align="left">
				<s:if test="bb1==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectBb1(this)"/>
				<input type="hidden" id="bbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectBb1(this)"/>
				<input type="hidden" id="bbox1" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(2)帮助就业项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs2==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectFs2(this)"/>
				<input type="hidden" id="fsbox2" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectFs2(this)"/>
				<input type="hidden" id="fsbox2" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right">新农保:&nbsp;</td>
			<td align="left">
				<s:if test="bb2==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectBb2(this)"/>
				<input type="hidden" id="bbox2" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectBb2(this)"/>
				<input type="hidden" id="bbox2" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(3)小额扶贫贷款项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs3==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectFs3(this)"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectFs3(this)"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right">大病医疗救助:&nbsp;</td>
			<td align="left">
				<s:if test="bb3==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectBb3(this)"/>
				<input type="hidden" id="bbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectBb3(this)"/>
				<input type="hidden" id="bbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(4)入股收益分红类项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs4==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectFs4(this)"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectFs4(this)"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right">未参加或享受任何保障:&nbsp;</td>
			<td align="left">
				<s:if test="bb4==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectBb4(this)"/>
				<input type="hidden" id="bbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectBb4(this)"/>
				<input type="hidden" id="bbox4" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(5)其它项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs5==1">
				<input type="checkbox" class="cuncbox" checked="checked" onclick="selectFs5(this)"/>
				<input type="hidden" id="fsbox5" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" onclick="selectFs5(this)"/>
				<input type="hidden" id="fsbox5" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right"></td>
			<td align="left"></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip3"></div>
    <div class="cun-bottom">
    	<span></span>
    	<span><input type="button" value="保存" class="button4" onclick="saveYearDataBt()"/></span>
    	<span><input type="button" value="返回" class="button4" onclick="history.go(-<s:property value='rflag'/>)"/></span>
    	<span></span>
    </div>
    </form>
</div>	
</body>
</html>