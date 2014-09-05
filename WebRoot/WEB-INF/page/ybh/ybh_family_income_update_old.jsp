<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/ybh_income.js?v=7"></script>
</head>
<body style="background:#E0EEFB;">
<h3 class="ybh_h3_title"><s:property value="year"/>年&nbsp;[<s:property value="#session.vts.curHM"/>&nbsp;<s:property value="hname"/>]样本户基础监测更新</h3>
<div class="cunwrap">
	<form name="form1" action="" method="post">
	<input type="hidden" name="rflag" value="<s:property value='rflag'/>"/>
	<input type="hidden" name="incometxt" value="<s:property value='#session.vts.curHM'/>"/>
	<input type="hidden" name="incometxt" value="<s:property value='year'/>"/>
	<input type="hidden" id="renkou" value="<s:property value="#session.vts.map.population"/>"/>
	<table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="25%" align="right">4、家庭年总纯收入(元):&nbsp;</td>
            <td width="25%" align="left">&nbsp;<label id="in_total"><s:property value="intotal"/></label></td>
            <td width="25%" align="right">8、得到帮扶资金(元):&nbsp;</td>
            <td width="25%" align="left">&nbsp;<label id="bf_total"><s:property value="vv"/></label></td>
        </tr>
        <tr>
        	<td align="right">其中:(1)家庭经营性收入(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId1" name="incometxt" value="<s:property value='injy'/>" maxlength="10" onblur="checkInjy(this)" tabindex="11"/></td>
            <td align="right">其中:(1)省级扶贫资金(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId4" name="incometxt" value="<s:property value='vv1'/>" maxlength="10" onblur="checkVv1(this)" tabindex="21"/></td>
        </tr>
        <tr>
        	<td align="right">(2)工资性收入(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId2" name="incometxt" value="<s:property value='inwork'/>" maxlength="10" onblur="checkInwork(this)" tabindex="12"/></td>
            <td align="right">(2)市、县级扶贫资金(元):&nbsp;</td>
			<td align="left"><input type="text" id="incId5" name="incometxt" value="<s:property value='vv2'/>" maxlength="10" onblur="checkVv2(this)" tabindex="22"/></td>
        </tr>
        <!--  
        <tr>
        	<td align="right">(3)财产性及转移性收入(元):&nbsp;</td>
			<td align="left"><input type="text" id="incId3" name="incometxt" value="<s:property value='incz'/>" maxlength="10" onblur="checkIncz(this)" tabindex="13"/></td>
            <td align="right"></td>
			<td align="left"></td>
        </tr>
        -->
        <input type="hidden" id="incId3" name="incometxt" value="<s:property value='incz'/>"/>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip1"></div>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="25%" align="right">5、家庭年人均纯收入(元):&nbsp;</td>
			<td width="25%" align="left">&nbsp;<label id="rj_income"><s:property value="inpersonal"/></label></td>
            <td width="25%" align="right">9、使用小额扶贫贷款数量(元):&nbsp;</td>
			<td width="25%" align="left"><input type="text" id="incId6" name="incometxt" value="<s:property value='xxe'/>" maxlength="10" onblur="checkXe(this)" tabindex="41"/></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip2"></div>
    <table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="25%" align="right">7、享受扶贫项目支持情况:&nbsp;</td>
			<td width="25%" align="left">
				<s:if test="fs==1">
				<input type="checkbox" id="chk_fs" class="cuncbox" checked="checked" disabled="disabled"/><label>(可多选)</label>
				</s:if>
				<s:else>
				<input type="checkbox" id="chk_fs" class="cuncbox" disabled="disabled"/><label>(可多选)</label>
				</s:else>
			</td>
            <td align="right">10、参加社会保障情况&nbsp;&nbsp;</td>
            <td width="25%" align="left">
                <s:if test="bb==1">
                <input type="checkbox" id="chk_bb" class="cuncbox" checked="checked" disabled="disabled"/><label>(可多选)</label>
                </s:if>
                <s:else>
                <input type="checkbox" id="chk_bb" class="cuncbox" disabled="disabled"/><label>(可多选)</label>
                </s:else>
            </td>
        </tr>
        <tr>
        	<td align="right">其中:(1)产业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs1==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs1(this)" tabindex="51"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs1(this)" tabindex="51"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td width="25%" align="right">新农合:&nbsp;</td>
			<td width="25%" align="left">
				<s:if test="bb1==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb1(this)" tabindex="61"/>
				<input type="hidden" id="bbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb1(this)" tabindex="61"/>
				<input type="hidden" id="bbox1" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(2)帮助就业项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs2==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs2(this)" tabindex="52"/>
				<input type="hidden" id="fsbox2" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs2(this)" tabindex="52"/>
				<input type="hidden" id="fsbox2" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right">新农保:&nbsp;</td>
			<td align="left">
				<s:if test="bb2==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb2(this)" tabindex="62"/>
				<input type="hidden" id="bbox2" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb2(this)" tabindex="62"/>
				<input type="hidden" id="bbox2" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(3)小额扶贫贷款项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs3==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs3(this)" tabindex="53"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs3(this)" tabindex="53"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right">大病医疗救助:&nbsp;</td>
			<td align="left">
				<s:if test="bb3==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb3(this)" tabindex="63"/>
				<input type="hidden" id="bbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb3(this)" tabindex="63"/>
				<input type="hidden" id="bbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(4)入股收益分红类项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs4==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs4(this)" tabindex="54"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs4(this)" tabindex="54"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right">参加或享受其它社会保障:&nbsp;</td>
			<td align="left">
				<s:if test="bb4==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb4(this)" tabindex="64"/>
				<input type="hidden" id="bbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb4(this)" tabindex="64"/>
				<input type="hidden" id="bbox4" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td align="right">(5)其它项目:&nbsp;</td>
			<td align="left">
				<s:if test="fs5==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs5(this)" tabindex="55"/>
				<input type="hidden" id="fsbox5" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs5(this)" tabindex="55"/>
				<input type="hidden" id="fsbox5" name="incometxt" value="0"/>
				</s:else>
			</td>
            <td align="right"></td>
			<td align="left"></td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip3"></div>
    
    <table cellpadding="0" cellspacing="0" width="100%">
		<tr>
	    	<td width="25%" align="right">种粮补助(元):&nbsp;</td>
	        <td width="25%" align="left"><input type="text" id="zlbz" name="incometxt" value="<s:property value='zlbz'/>" maxlength="10" onblur="checkZlbz(this)" tabindex="71"/></td>
	        <td width="25%" align="right">流转租金(元):&nbsp;</td>
	        <td width="25%" align="left"><input type="text" id="lzzj" name="incometxt" value="<s:property value='lzzj'/>" maxlength="10" onblur="checkLzzj(this)" tabindex="72"/></td>
	    </tr>
	    <tr>
	    	<td align="right">领取残疾补助金(元):&nbsp;</td>
	        <td align="left"><input type="text" id="isv1" name="incometxt" value="<s:property value='isv1'/>" maxlength="10" onblur="checkIsv1(this)" tabindex="73"/></td>
	        <td align="right">领取新农合报销医疗费(元):&nbsp;</td>
	        <td align="left"><input type="text" id="isv2" name="incometxt" value="<s:property value='isv2'/>" maxlength="10" onblur="checkIsv2(this)" tabindex="74"/></td>
	    </tr>
	    <tr>
	    	<td align="right">领取养老金(元):&nbsp;</td>
	        <td align="left"><input type="text" id="isv3" name="incometxt" value="<s:property value='isv3'/>" maxlength="10" onblur="checkIsv3(this)" tabindex="75"/></td>
	        <td align="right">领取医疗救助金(元):&nbsp;</td>
			<td align="left"><input type="text" id="isv4" name="incometxt" value="<s:property value='isv4'/>" maxlength="10" onblur="checkIsv4(this)" tabindex="76"/></td>
	    </tr>
	    <tr>
	    	<td align="right">领取其他补助金(元):&nbsp;</td>
			<td align="left"><input type="text" id="isv5" name="incometxt" value="<s:property value='isv5'/>" maxlength="10" onblur="checkIsv5(this)" tabindex="77"/></td>
	        <td align="right"></td>
			<td align="left"></td>
	    </tr>
	</table>
	<div style="height:26px; line-height:26px; color:#F00" id="errTip4"></div>
    
    <div class="cun-bottom">
    	<span></span>
    	<span><input type="button" value="保存" class="button4" onclick="saveIncomeBt()"/></span>
    	<span><input type="button" value="返回" class="button4" onclick="history.go(-<s:property value='rflag'/>)"/></span>
    	<span></span>
    </div>
    </form>
</div>	
</body>
</html>