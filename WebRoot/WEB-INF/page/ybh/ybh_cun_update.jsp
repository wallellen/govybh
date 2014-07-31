<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/cun_ybh.js?v=4"></script>
</head>
<body style="background:#E0EEFB;">
<h3 class="ybh_h3_title"><s:property value="#session.vts.map.ybhyear"/>年[<s:property value="oname"/>]指标录入</h3>
<div class="cunwrap">
	<form name="form1" action="" method="post">
	<input type="hidden" name="cunbm" value="<s:property value='cunbm'/>"/>
	<input type="hidden" name="year" value="<s:property value='#session.vts.map.ybhyear'/>"/>
	<input type="hidden" name="oname" value="<s:property value='oname'/>"/>
	<input type="hidden" name="viewBM" value="<s:property value='#session.vts.curBM'/>"/>
	<input type="hidden" name="rflag" value="<s:property value='rflag'/>"/>
	<table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td colspan="2" align="center">一、村基本情况</td>
        	<td colspan="2" align="center">二、建档立卡低收入农户基本情况</td>
        </tr>
    	<tr>
        	<td width="28%" align="right">总农户数(户):&nbsp;</td>
            <td width="22%" align="left"><input type="text" id="cunId1" name="cuntxt" value="<s:property value='#request.cunMap.hnt'/>" maxlength="10" onblur="checkHnt(this)" tabindex="11"/></td>
            <td width="28%" align="right">总户数(户):&nbsp;</td>
            <td width="22%" align="left"><input type="text" id="cunId2" name="cuntxt" value="<s:property value='#request.cunMap.hnl'/>" maxlength="10" onblur="checkHnl(this)" tabindex="21"/></td>
        </tr>
        <tr>
        	<td align="right">总人口数(人):&nbsp;</td>
            <td align="left"><input type="text" id="cunId3" name="cuntxt" value="<s:property value='#request.cunMap.rnt'/>" maxlength="10" onblur="checkRnt(this)" tabindex="12"/></td>
            <td align="right">总人口(人):&nbsp;</td>
            <td align="left"><input type="text" id="cunId4" name="cuntxt" value="<s:property value='#request.cunMap.rnl'/>" maxlength="10" onblur="checkRnl(this)" tabindex="22"/></td>
        </tr>
        <tr>
        	<td align="right">总劳动力数(个):&nbsp;</td>
            <td align="left"><input type="text" id="cunId5" name="cuntxt" value="<s:property value='#request.cunMap.lnt'/>" maxlength="10" onblur="checkLnt(this)" tabindex="13"/></td>
            <td align="right">总劳动力(个):&nbsp;</td>
			<td align="left"><input type="text" id="cunId6" name="cuntxt" value="<s:property value='#request.cunMap.lnl'/>" maxlength="10" onblur="checkLnl(this)" tabindex="23"/></td>
        </tr>
        <tr>
        	<td align="right">承包耕地总面积(亩):&nbsp;</td>
			<td align="left"><input type="text" id="cunId7" name="cuntxt" value="<s:property value='#request.cunMap.ft'/>" maxlength="10" onblur="checkFt(this)" tabindex="14"/></td>
            <td align="right">承包耕地总面积(亩):&nbsp;</td>
			<td align="left"><input type="text" id="cunId8" name="cuntxt" value="<s:property value='#request.cunMap.fl'/>" maxlength="10" onblur="checkFl(this)" tabindex="24"/></td>
        </tr>
        <tr>
        	<td align="right">村农民人均纯收入(元/年):&nbsp;</td>
			<td align="left"><input type="text" id="cunId9" name="cuntxt" value="<s:property value='#request.cunMap.inpersonal'/>" maxlength="10" onblur="checkInpersonal(this)" tabindex="15"/></td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
        <tr>
        	<td align="right">村集体经营性收入(元/年):&nbsp;</td>
			<td align="left"><input type="text" id="cunId10" name="cuntxt" value="<s:property value='#request.cunMap.injy'/>" maxlength="10" onblur="checkInjy(this)" tabindex="16"/></td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
        <tr>
        	<td align="right">村集体负债总额(万元):&nbsp;</td>
			<td align="left"><input type="text" id="cunId11" name="cuntxt" value="<s:property value='#request.cunMap.fze'/>" maxlength="10" onblur="checkFze(this)" tabindex="17"/></td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip1"></div>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td colspan="2" align="center">五、扶贫项目落实情况</td>
        	<td colspan="2" align="center">六、扶贫资金落实情况</td>
        </tr>
        <tr>
        	<td width="28%" align="right">针对经济薄弱村扶贫项目情况:&nbsp;</td>
			<td width="22%" align="left">
				<s:if test="#request.cunMap.fps!=null && #request.cunMap.fps==1">
				<input type="checkbox" id="chk_fps" class="cuncbox" checked="checked" disabled="disabled"/><label>(可多选)</label>
				</s:if>
				<s:else>
				<input type="checkbox" id="chk_fps" class="cuncbox" disabled="disabled"/><label>(可多选)</label>
				</s:else>
			</td>
            <td width="28%" align="right">针对经济薄弱村扶贫资金落实数(万元):&nbsp;</td>
			<td width="22%" align="left">&nbsp;<span id="fupinzj"><s:property value='#request.cunMap.fpv'/></span></td>
        </tr>
    	<tr>
        	<td align="right">(1)产业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps1!=null && #request.cunMap.fps1==1">
				<input type="checkbox" name="chk_fps_name" class="cuncbox" checked="checked" onclick="selectFps1(this)" tabindex="31"/>
				<input type="hidden" id="chbox1" name="cuntxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fps_name" class="cuncbox" onclick="selectFps1(this)" tabindex="31"/>
				<input type="hidden" id="chbox1" name="cuntxt" value="0"/>
				</s:else>
			</td>
            <td align="right">其中：(1)省级扶贫资金(万元):&nbsp;</td>
			<td align="left"><input type="text" id="cunId12" name="cuntxt" value="<s:property value='#request.cunMap.fpv1'/>" maxlength="10" onblur="checkFpv1(this)" tabindex="41"/></td>
        </tr>
        <tr>
        	<td align="right">(2)基础设施建设项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps2!=null && #request.cunMap.fps2==1">
					<input type="checkbox" name="chk_fps_name" class="cuncbox" checked="checked" onclick="selectFps2(this)" tabindex="32"/>
					<input type="hidden" id="chbox2" name="cuntxt" value="1"/>
				</s:if>
				<s:else>
					<input type="checkbox" name="chk_fps_name" class="cuncbox" onclick="selectFps2(this)" tabindex="32"/>
					<input type="hidden" id="chbox2" name="cuntxt" value="0"/>
				</s:else>
			</td>
            <td align="right">(2)市、县级扶贫资金(万元):&nbsp;</td>
			<td align="left"><input type="text" id="cunId13" name="cuntxt" value="<s:property value='#request.cunMap.fpv2'/>" maxlength="10" onblur="checkFpv2(this)" tabindex="42"/></td>
        </tr>
        <tr>
        	<td align="right">(3)公益事业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps3!=null && #request.cunMap.fps3==1">
				<input type="checkbox" name="chk_fps_name" class="cuncbox" checked="checked" onclick="selectFps3(this)" tabindex="33"/>
				<input type="hidden" id="chbox3" name="cuntxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fps_name" class="cuncbox" onclick="selectFps3(this)" tabindex="33"/>
				<input type="hidden" id="chbox3" name="cuntxt" value="0"/>
				</s:else>
			</td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip2"></div>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td colspan="2" align="center">七、扶贫小额贷款使用情况</td>
        	<td colspan="2" align="center">八、建档立卡低收入农户参加主要社会保障情况</td>
        </tr>
    	<tr>
        	<td width="28%" align="right">全村使用贷款农户总数(户):&nbsp;</td>
			<td width="22%" align="left"><input type="text" id="cunId14" name="cuntxt" value="<s:property value='#request.cunMap.hndt'/>" maxlength="10" onblur="checkHndt(this)" tabindex="51"/></td>
            <td width="28%" align="right">参加新农合(户):&nbsp;</td>
			<td width="22%" align="left"><input type="text" id="cunId15" name="cuntxt" value="<s:property value='#request.cunMap.b1'/>" maxlength="10" onblur="checkB1(this)" tabindex="61"/></td>
        </tr>
        <tr>
        	<td align="right">其中：建档立卡农户数(户):&nbsp;</td>
			<td align="left"><input type="text" id="cunId16" name="cuntxt" value="<s:property value='#request.cunMap.nhdl'/>" maxlength="10" onblur="checkNhdl(this)" tabindex="52"/></td>
            <td align="right">参加新农保(户):&nbsp;</td>
			<td align="left"><input type="text" id="cunId17" name="cuntxt" value="<s:property value='#request.cunMap.b2'/>" maxlength="10" onblur="checkB2(this)" tabindex="62"/></td>
        </tr>
        <tr>
        	<td align="right">全村农户使用贷款总量(万元):&nbsp;</td>
			<td align="left"><input type="text" id="cunId18" name="cuntxt" value="<s:property value='#request.cunMap.vdt'/>" maxlength="10" onblur="checkVdt(this)" tabindex="53"/></td>
            <td align="right">参加大病医疗救助(户):&nbsp;</td>
			<td align="left"><input type="text" id="cunId19" name="cuntxt" value="<s:property value='#request.cunMap.b3'/>" maxlength="10" onblur="checkB3(this)" tabindex="63"/></td>
        </tr>
        <tr>
        	<td align="right">其中：建档立卡低收入农户(万元):&nbsp;</td>
			<td align="left"><input type="text" id="cunId20" name="cuntxt" value="<s:property value='#request.cunMap.vdtl'/>" maxlength="10" onblur="checkVdtl(this)" tabindex="54"/></td>
            <td align="right">参加或享受其它保障(户):&nbsp;</td>
			<td align="left"><input type="text" id="cunId21" name="cuntxt" value="<s:property value='#request.cunMap.b4'/>" maxlength="10" onblur="checkB4(this)" tabindex="64"/></td>
        </tr>
        <tr>
        	<td align="right">全村户均贷款额度(万元):&nbsp;</td>
			<td align="left"><input type="text" id="cunId22" name="cuntxt" value="<s:property value='#request.cunMap.vdpt'/>" maxlength="10" onblur="checkVdpt(this)" tabindex="55" readonly="readonly"/></td>
            <td align="right">未参加或享受任何保障(户):&nbsp;</td>
			<td align="left"><input type="text" id="cunId23" name="cuntxt" value="<s:property value='#request.cunMap.nb'/>" maxlength="10" onblur="checkNb(this)" tabindex="65"/></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip3"></div>
    <div class="cun-bottom">
    	<span></span>
    	<span><input type="button" value="保存" class="button4" onclick="saveCunBt()"/></span>
    	<span><input type="button" value="返回" class="button4" onclick="history.go(-<s:property value="rflag"/>)"/></span>
    	<span></span>
    </div>
    </form>
</div>	
</body>
</html>