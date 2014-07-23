<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/cun_ybh.js"></script>
</head>
<body style="background:#E0EEFB;">
<h3 class="ybh_h3_title"><s:property value="year"/>年&nbsp;<s:property value="oname"/>&nbsp;村指标</h3>
<div class="ybc-return"><input type="button" value="返回" class="button43" onclick="history.go(-1)"/></div>
<div class="cunwrap">
	<table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td colspan="2" align="center">一、村基本情况</td>
        	<td colspan="2" align="center">二、建档立卡低收入农户基本情况</td>
        </tr>
    	<tr>
        	<td width="28%" align="right">总农户数(户):&nbsp;</td>
            <td width="22%" align="left">&nbsp;<s:property value='#request.cunMap.hnt'/></td>
            <td width="28%" align="right">总户数(户):&nbsp;</td>
            <td width="22%" align="left">&nbsp;<s:property value='#request.cunMap.hnl'/></td>
        </tr>
        <tr>
        	<td align="right">总人口数(人):&nbsp;</td>
            <td align="left">&nbsp;<s:property value='#request.cunMap.rnt'/></td>
            <td align="right">总人口(人):&nbsp;</td>
            <td align="left">&nbsp;<s:property value='#request.cunMap.rnl'/></td>
        </tr>
        <tr>
        	<td align="right">总劳动力数(个):&nbsp;</td>
            <td align="left">&nbsp;<s:property value='#request.cunMap.lnt'/></td>
            <td align="right">总劳动力(个):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.lnl'/></td>
        </tr>
        <tr>
        	<td align="right">承包耕地总面积(亩):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.ft'/></td>
            <td align="right">承包耕地总面积(亩):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.fl'/></td>
        </tr>
        <tr>
        	<td align="right">村农民人均纯收入(元/年):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.inpersonal'/></td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
        <tr>
        	<td align="right">村集体经营性收入(元/年):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.injy'/></td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
        <tr>
        	<td align="right">村集体负债总额(万元):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.fze'/></td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td colspan="2" align="center">五、扶贫项目落实情况</td>
        	<td colspan="2" align="center">六、扶贫资金落实情况</td>
        </tr>
        <tr>
        	<td width="28%" align="right">针对经济薄弱村扶贫项目情况:&nbsp;</td>
			<td width="22%" align="left">
				<s:if test="#request.cunMap.fps!=null && #request.cunMap.fps==1">
				<input type="checkbox" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
            <td width="28%" align="right">针对经济薄弱村扶贫资金落实数(万元):&nbsp;</td>
			<td width="22%" align="left">&nbsp;<s:property value='#request.cunMap.fpv'/></td>
        </tr>
    	<tr>
        	<td align="right">(1)产业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps1!=null && #request.cunMap.fps1==1">
				<input type="checkbox" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
            <td align="right">其中：(1)省级扶贫资金(万元):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.fpv1'/></td>
        </tr>
        <tr>
        	<td align="right">(2)基础设施建设项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps2!=null && #request.cunMap.fps2==1">
					<input type="checkbox" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
					<input type="checkbox" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
            <td align="right">(2)市、县级扶贫资金(万元):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.fpv2'/></td>
        </tr>
        <tr>
        	<td align="right">(3)公益事业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps3!=null && #request.cunMap.fps3==1">
				<input type="checkbox" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td colspan="2" align="center">七、扶贫小额贷款使用情况</td>
        	<td colspan="2" align="center">八、建档立卡低收入农户参加主要社会保障情况</td>
        </tr>
    	<tr>
        	<td width="28%" align="right">全村使用贷款农户总数(户):&nbsp;</td>
			<td width="22%" align="left">&nbsp;<s:property value='#request.cunMap.hndt'/></td>
            <td width="28%" align="right">参加新农合(户):&nbsp;</td>
			<td width="22%" align="left">&nbsp;<s:property value='#request.cunMap.b1'/></td>
        </tr>
        <tr>
        	<td align="right">其中：建档立卡农户数(户):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.nhdl'/></td>
            <td align="right">参加新农保(户):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.b2'/></td>
        </tr>
        <tr>
        	<td align="right">全村农户使用贷款总量(万元):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.vdt'/></td>
            <td align="right">参加大病医疗救助(户):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.b3'/></td>
        </tr>
        <tr>
        	<td align="right">其中：建档立卡低收入农户(万元):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.vdtl'/></td>
            <td align="right">参加或享受其它保障(户):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.b4'/></td>
        </tr>
        <tr>
        	<td align="right">全村户均贷款额度(万元):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.vdpt'/></td>
            <td align="right">未参加或享受任何保障(户):&nbsp;</td>
			<td align="left">&nbsp;<s:property value='#request.cunMap.nb'/></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00"></div>
    <div class="cun-bottom">
    	<span></span>
    	<span></span>
    	<span></span>
    	<span></span>
    </div>
</div>	
</body>
</html>