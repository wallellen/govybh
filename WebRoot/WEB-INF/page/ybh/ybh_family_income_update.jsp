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
<h3 class="jiangbu-title"><s:property value="hname"/></h3>
<div class="cunwrap">
	<form name="form1" action="" method="post">
	<input type="hidden" name="cunbm" value="<s:property value='cunbm'/>"/>
	<input type="hidden" name="year" value="<s:property value='year'/>"/>
	<input type="hidden" name="oname" value="<s:property value='oname'/>"/>
	<input type="hidden" name="viewBM" value="<s:property value='#session.vts.curBM'/>"/>
	<input type="hidden" name="rflag" value="<s:property value='rflag'/>"/>
	<table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="30%" align="right">4、家庭年总纯收入(元):&nbsp;</td>
            <td width="20%" align="left"></td>
            <td width="30%" align="right">8、得到帮扶资金(元):&nbsp;</td>
            <td width="20%" align="left"></td>
        </tr>
        <tr>
        	<td align="right">其中:(1)家庭经营性收入(元):&nbsp;</td>
            <td align="left"><input type="text" value=""/></td>
            <td align="right">其中:(1)省级扶贫资金(元):&nbsp;</td>
            <td align="left"><input type="text" value=""/></td>
        </tr>
        <tr>
        	<td align="right">(2)工资性收入(元):&nbsp;</td>
            <td align="left"><input type="text" value=""/></td>
            <td align="right">(2)市、县级扶贫资金(元):&nbsp;</td>
			<td align="left"><input type="text" value=""/></td>
        </tr>
        <tr>
        	<td align="right">(3)财产性及转移性收入(元):&nbsp;</td>
			<td align="left"><input type="text" value=""/></td>
            <td align="right"></td>
			<td align="left"></td>
        </tr>
    </table>
    <br/>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="30%" align="right">5、家庭年人均纯收入(元):&nbsp;</td>
			<td width="20%" align="left"></td>
            <td width="30%" align="right">9、使用小额扶贫贷款数量(元):&nbsp;</td>
			<td width="20%" align="left"><input type="text" value=""/></td>
        </tr>
    </table>
    <br/>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="30%" align="right">7、享受扶贫项目支持情况:&nbsp;</td>
			<td width="20%" align="left"></td>
            <td align="center" colspan="2">10、参加社会保障情况&nbsp;&nbsp;</td>
        </tr>
        <tr>
        	<td align="right">其中:(1)产业发展项目:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
            <td width="30%" align="right">新农合:&nbsp;</td>
			<td width="20%" align="left"><input type="checkbox" class="cuncbox"/></td>
        </tr>
        <tr>
        	<td align="right">(2)帮助就业项目:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
            <td align="right">新农保:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
        </tr>
        <tr>
        	<td align="right">(3)小额扶贫贷款项目:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
            <td align="right">大病医疗救助:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
        </tr>
        <tr>
        	<td align="right">(4)入股收益分红类项目:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
            <td align="right">未参加或享受任何保障:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
        </tr>
        <tr>
        	<td align="right">(5)其它项目:&nbsp;</td>
			<td align="left"><input type="checkbox" class="cuncbox"/></td>
            <td align="right"></td>
			<td align="left"></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip3"></div>
    <div class="cun-bottom">
    	<span></span>
    	<span><input type="button" value="保存" class="button4" onclick="saveCunBt()"/></span>
    	<span><input type="button" value="返回" class="button4" onclick="history.go(-1)"/></span>
    	<span></span>
    </div>
    </form>
</div>	
</body>
</html>