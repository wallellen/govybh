<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css?v=3" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/ybh_income.js?v=18"></script>
	<style type="text/css">
		.tdhead{font-weight:bold;}
	</style>
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
        	<td width="25%" align="right" class="tdhead">1、家庭人口(人):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<s:property value="population"/></td>
            <td width="25%" align="right" class="tdhead">7、享受扶贫项目支持情况:&nbsp;</td>
            <td width="25%" align="left" class="tdhead">
				<s:if test="fs==1">
				<input type="checkbox" id="chk_fs" class="cuncbox" checked="checked" disabled="disabled"/><label>(可多选)</label>
				</s:if>
				<s:else>
				<input type="checkbox" id="chk_fs" class="cuncbox" disabled="disabled"/><label>(可多选)</label>
				</s:else>
			</td>
        </tr>
    	<tr>
        	<td width="25%" align="right" class="tdhead">2、家庭劳动力(个):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<s:property value="labornum"/></td>
            <td width="25%" align="right">其中:(1)产业发展项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs1==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs1(this)" tabindex="71"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs1(this)" tabindex="71"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：务工劳动力(个):&nbsp;</td>
            <td width="25%" align="left">&nbsp;<s:property value="wlabornum"/></td>
            <td width="25%" align="right">(2)帮助就业项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs2==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled" tabindex="72"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled" tabindex="72"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">3、家庭承包耕地面积(亩):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<s:property value="fields"/></td>
            <td width="25%" align="right">(3)小额扶贫贷款项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs3==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs3(this)" tabindex="73"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs3(this)" tabindex="73"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：流转面积(亩):&nbsp;</td>
            <td width="25%" align="left">&nbsp;<s:property value="lzmj"/></td>
            <td width="25%" align="right">(4)入股收益分红类项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs4==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs4(this)" tabindex="74"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs4(this)" tabindex="74"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">4、家庭年总纯收入(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<label id="in_total"><s:property value="intotal"/></label></td>
            <td width="25%" align="right">(5)帮助上学项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs5==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled" tabindex="75"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled" tabindex="75"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：(1)生产经营性收入(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId1" name="incometxt" value="<s:property value='injy'/>" maxlength="10" onblur="checkInjy(this)" tabindex="41"/></td>
            <td width="25%" align="right">(6)帮助就医项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs6==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled" tabindex="76"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled" tabindex="76"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">(2)工资性收入(元):&nbsp;</td>
            <td align="left"><input type="text" id="incId2" name="incometxt" value="<s:property value='inwork'/>" maxlength="10" onblur="checkInwork(this)" tabindex="42"/></td>
        	<td width="25%" align="right">(7)帮助参保项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs7==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled" tabindex="77"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled" tabindex="77"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">(3)财产性收入(元):&nbsp;</td>
            <td width="25%" align="left">&nbsp;<label id="incId3"><s:property value="incz"/></label></td>
        	<td width="25%" align="right">(8)其它项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs8==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled" tabindex="78"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled" tabindex="78"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：流转耕地租金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId12" name="incometxt" value="<s:property value='lzzj'/>" maxlength="10" onblur="checkLiuzhuan(this)" tabindex="43"/></td>
            <td width="25%" align="right" class="tdhead">8、得到帮扶资金(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<label id="bf_total"><s:property value="vv"/></label></td>
        </tr>
        <tr>
        	<td width="25%" align="right">(4)各类补贴性收入(元):&nbsp;</td>
            <td width="25%" align="left">&nbsp;<label id="incId4"><s:property value="inbz"/></label></td>
        	<td width="25%" align="right">其中:(1)省级扶贫资金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId13" name="incometxt" value="<s:property value='vv1'/>" maxlength="10" onblur="checkVv1(this)" tabindex="81"/></td>
        </tr>
        <tr>
       	 	<td width="25%" align="right">其中:①领取种粮补助(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId5" name="incometxt" value="<s:property value='zlbz'/>" maxlength="10" onblur="checkZlbz(this)" tabindex="44"/></td>
            <td width="25%" align="right">(2)市、县级扶贫资金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId14" name="incometxt" value="<s:property value='vv2'/>" maxlength="10" onblur="checkVv2(this)" tabindex="82"/></td>
        </tr>
        <tr>
        	<td width="25%" align="right">②领取低保、五保金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId6" name="incometxt" value="<s:property value='isv1'/>" maxlength="10" onblur="checkDibao(this)" tabindex="45"/></td>
            <td width="25%" align="right" class="tdhead">9、使用小额扶贫贷款数量(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead"><input type="text" id="incId15" name="incometxt" value="<s:property value='xxe'/>" maxlength="10" onblur="checkXe(this)" tabindex="91"/></td>
        </tr>
        <tr>
        	<td width="25%" align="right">③领取残疾补助金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId7" name="incometxt" value="<s:property value='isv2'/>" maxlength="10" onblur="checkIsv1(this)" tabindex="46"/></td>
            <td width="25%" align="right" class="tdhead">10、参加社会保障情况:&nbsp;</td>
            <td width="25%" align="left" class="tdhead">
				<s:if test="bb==1">
                <input type="checkbox" id="chk_bb" class="cuncbox" checked="checked" disabled="disabled"/><label>(可多选)</label>
                </s:if>
                <s:else>
                <input type="checkbox" id="chk_bb" class="cuncbox" disabled="disabled"/><label>(可多选)</label>
                </s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">④领取新农合报销医疗费(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId8" name="incometxt" value="<s:property value='isv3'/>" maxlength="10" onblur="checkIsv2(this)" tabindex="47"/></td>
           	<td width="25%" align="right">新农合:&nbsp;</td>
            <td width="25%" align="left">
            	<s:if test="bb1==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb1(this)" tabindex="101"/>
				<input type="hidden" id="bbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb1(this)" tabindex="101"/>
				<input type="hidden" id="bbox1" name="incometxt" value="0"/>
				</s:else>
            </td>
        </tr>
        <tr>
        	<td width="25%" align="right">⑤领取养老金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId9" name="incometxt" value="<s:property value='isv4'/>" maxlength="10" onblur="checkIsv3(this)" tabindex="48"/></td>
            <td width="25%" align="right">新农保:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="bb2==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb2(this)" tabindex="102"/>
				<input type="hidden" id="bbox2" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb2(this)" tabindex="102"/>
				<input type="hidden" id="bbox2" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">⑥领取医疗救助金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId10" name="incometxt" value="<s:property value='isv5'/>" maxlength="10" onblur="checkIsv4(this)" tabindex="49"/></td>
            <td width="25%" align="right">大病医疗救助:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="bb3==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb3(this)" tabindex="103"/>
				<input type="hidden" id="bbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb3(this)" tabindex="103"/>
				<input type="hidden" id="bbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">⑦领取其他补助金(元)&nbsp;</td>
        	<td width="25%" align="left"><input type="text" id="incId11" name="incometxt" value="<s:property value='isv6'/>" maxlength="10" onblur="checkIsv5(this)" tabindex="50"/></td>
            <td width="25%" align="right">参加或享受其它社会保障:&nbsp;</td>
            <td width="25%" align="left">
            	<s:if test="bb4==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb4(this)" tabindex="104"/>
				<input type="hidden" id="bbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb4(this)" tabindex="104"/>
				<input type="hidden" id="bbox4" name="incometxt" value="0"/>
				</s:else>
            </td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">5、家庭年人均纯收入(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<label id="rj_income"><s:property value="inpersonal"/></label></td>
        	<td width="25%" align="right" class="tdhead">上年是否脱贫:&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<s:property value="ltp==1?'1:是':'2:否'"/></td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">6、主要致贫原因:&nbsp;</td>
            <td width="25%" align="left" class="tdhead">
            	<s:if test="dcause==1">&nbsp;1:因灾</s:if>
            	<s:elseif test="dcause==2">&nbsp;2:因病</s:elseif>
            	<s:elseif test="dcause==3">&nbsp;3:因残</s:elseif>
            	<s:elseif test="dcause==4">&nbsp;4:因学</s:elseif>
            	<s:elseif test="dcause==5">&nbsp;5:缺技术</s:elseif>
            	<s:elseif test="dcause==6">&nbsp;6:缺劳动力</s:elseif>
            	<s:elseif test="dcause==7">&nbsp;7:缺资金</s:elseif>
            	<s:elseif test="dcause==8">&nbsp;8:其它</s:elseif>
            </td>
            <td width="25%" colspan="2" align="right">&nbsp;</td>
        </tr>
    </table>
    <div style="height:26px; line-height:26px; color:#F00" id="errTip1"></div>
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