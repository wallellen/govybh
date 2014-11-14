<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css?v=3" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/ybh_income.js?v=20"></script>
	<style type="text/css">
		.tdhead{font-weight:bold;}
	</style>
</head>
<body style="background:#E0EEFB;">
<h3 class="ybh_h3_title"><s:property value="year"/>年&nbsp;[<s:property value="#session.vts.curHM"/>&nbsp;<s:property value="hname"/>]样本户基础监测更新</h3>
<div class="cunwrap">
	<form id="form1" name="form1" action="" method="post">
	<input type="hidden" name="rflag" value="<s:property value='rflag'/>"/>
	<input type="hidden" name="incometxt" value="<s:property value='#session.vts.curHM'/>"/>
	<input type="hidden" name="incometxt" value="<s:property value='year'/>"/>
	<input type="hidden" id="renkou" value="<s:property value="#session.vts.map.population"/>"/>
	<table cellpadding="0" cellspacing="0" width="100%">
    	<tr>
        	<td width="25%" align="right" class="tdhead">1、家庭人口(人):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;
            	<c:choose>
            		<c:when test="${empty population }">0</c:when>
            		<c:otherwise>${population }</c:otherwise>
            	</c:choose>
            </td>
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
            <td width="25%" align="left" class="tdhead">&nbsp;
            	<c:choose>
            		<c:when test="${empty labornum }">0</c:when>
            		<c:otherwise>${labornum }</c:otherwise>
            	</c:choose>
            </td>
            <td width="25%" align="right">其中:(1)产业发展项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs1==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs1(this)" tabindex="12" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs1(this)" tabindex="12" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox1" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：务工劳动力(个):&nbsp;</td>
            <td width="25%" align="left">&nbsp;
            	<c:choose>
            		<c:when test="${empty wlabornum }">0</c:when>
            		<c:otherwise>${wlabornum }</c:otherwise>
            	</c:choose>
            </td>
            <td width="25%" align="right">(2)帮助就业项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs2==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">3、家庭承包耕地面积(亩):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;
            	<c:choose>
            		<c:when test="${empty fields }">0</c:when>
            		<c:otherwise>${fields }</c:otherwise>
            	</c:choose>
            </td>
            <td width="25%" align="right">(3)小额扶贫贷款项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs3==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs3(this)" tabindex="13" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs3(this)" tabindex="13" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：流转面积(亩):&nbsp;</td>
            <td width="25%" align="left">&nbsp;
            	<c:choose>
            		<c:when test="${empty lzmj }">0</c:when>
            		<c:otherwise>${lzmj }</c:otherwise>
            	</c:choose>
            </td>
            <td width="25%" align="right">(4)入股收益分红类项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs4==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs4(this)" tabindex="14" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs4(this)" tabindex="14" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox4" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">4、家庭年总纯收入(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;
            	<label id="in_total">
            		<c:choose>
	            		<c:when test="${empty intotal }">0.0</c:when>
	            		<c:otherwise>${intotal }</c:otherwise>
	            	</c:choose>
            	</label>
            </td>
            <td width="25%" align="right">(5)帮助上学项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs5==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中：(1)生产经营性收入(元):&nbsp;</td>
            <td align="left">
            	<c:choose>
            		<c:when test="${empty injy }">
            			<c:set var="injyVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="injyVal" value="${injy }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId1" name="incometxt" value="${injyVal }" maxlength="10" onblur="checkInjy(this)" tabindex="2" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right">(6)帮助就医项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs6==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">(2)工资性收入(元):&nbsp;</td>
            <td align="left">
           		<c:choose>
            		<c:when test="${empty inwork }">
            			<c:set var="inworkVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="inworkVal" value="${inwork }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId2" name="incometxt" value="${inworkVal }" maxlength="10" onblur="checkInwork(this)" tabindex="3" onkeydown="enterToTab(event,this)"/>
            </td>
        	<td width="25%" align="right">(7)帮助参保项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs7==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" disabled="disabled"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" disabled="disabled"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">(3)财产性收入(元):&nbsp;</td>
        	<!-- 
            <td width="25%" align="left">&nbsp;<label id="incId3"><s:property value="incz"/></label></td>
             -->
			<td width="25%" align="left">
				<c:choose>
            		<c:when test="${empty incz }">
            			<c:set var="inczVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="inczVal" value="${incz }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId12" name="incometxt" value="${inczVal }" maxlength="10" onblur="checkCaichan(this)" tabindex="4" onkeydown="enterToTab(event,this)"/>
            </td>             
        	<td width="25%" align="right">(8)其它项目:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="fs8==1">
				<input type="checkbox" name="chk_fs_name" class="cuncbox" checked="checked" onclick="selectFs8(this)" tabindex="15" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox8" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fs_name" class="cuncbox" onclick="selectFs8(this)" tabindex="15" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="fsbox8" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<!-- 
        	<td width="25%" align="right">其中：流转耕地租金(元):&nbsp;</td>
            <td width="25%" align="left"><input type="text" id="incId12" name="incometxt" value="<s:property value='lzzj'/>" maxlength="10" onblur="checkLiuzhuan(this)" tabindex="43"/></td>
            -->
            <td width="25%" align="right">(4)各类补贴性收入(元):&nbsp;</td>
            <td width="25%" align="left">&nbsp;
            	<label id="incId4">
            		<c:choose>
	            		<c:when test="${empty inbz }">0</c:when>
	            		<c:otherwise>${inbz }</c:otherwise>
	            	</c:choose>
	            </label>
            </td>
        	<td width="25%" align="right" class="tdhead">8、得到帮扶资金(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;
            	<label id="bf_total">
            		<c:choose>
	            		<c:when test="${empty vv }">0</c:when>
	            		<c:otherwise>${vv }</c:otherwise>
	            	</c:choose>
            	</label>
            </td>
        </tr>
        <tr>
        	<td width="25%" align="right">其中:①领取种粮补助(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty zlbz }">
            			<c:set var="zlbzVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="zlbzVal" value="${zlbz }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId5" name="incometxt" value="${zlbzVal }" maxlength="10" onblur="checkZlbz(this)" tabindex="5" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right">其中:(1)省级扶贫资金(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty vv1 }">
            			<c:set var="vv1Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="vv1Val" value="${vv1 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId13" name="incometxt" value="${vv1Val }" maxlength="10" onblur="checkVv1(this)" tabindex="16" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
       	 	<td width="25%" align="right">②领取低保、五保金(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty isv1 }">
            			<c:set var="isv1Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="isv1Val" value="${isv1 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId6" name="incometxt" value="${isv1Val }" maxlength="10" onblur="checkDibao(this)" tabindex="6" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right">(2)市、县级扶贫资金(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty vv2 }">
            			<c:set var="vv2Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="vv2Val" value="${vv2 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId14" name="incometxt" value="${vv2Val }" maxlength="10" onblur="checkVv2(this)" tabindex="17" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td width="25%" align="right">③领取残疾补助金(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty isv2 }">
            			<c:set var="isv2Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="isv2Val" value="${isv2 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId7" name="incometxt" value="${isv2Val }" maxlength="10" onblur="checkIsv1(this)" tabindex="7" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right" class="tdhead">9、使用小额扶贫贷款数量(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">
            	<c:choose>
            		<c:when test="${empty xxe }">
            			<c:set var="xxeVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="xxeVal" value="${xxe }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId15" name="incometxt" value="${xxeVal }" maxlength="10" onblur="checkXe(this)" tabindex="18" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td width="25%" align="right">④领取新农合报销医疗费(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty isv3 }">
            			<c:set var="isv3Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="isv3Val" value="${isv3 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId8" name="incometxt" value="${isv3Val }" maxlength="10" onblur="checkIsv2(this)" tabindex="8" onkeydown="enterToTab(event,this)"/>
            </td>
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
        	<td width="25%" align="right">⑤领取养老金(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty isv4 }">
            			<c:set var="isv4Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="isv4Val" value="${isv4 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId9" name="incometxt" value="${isv4Val }" maxlength="10" onblur="checkIsv3(this)" tabindex="9" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right">新农合:&nbsp;</td>
            <td width="25%" align="left">
            	<s:if test="bb1==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb1(this)" tabindex="19" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox1" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb1(this)" tabindex="19" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox1" name="incometxt" value="0"/>
				</s:else>
            </td>
        </tr>
        <tr>
        	<td width="25%" align="right">⑥领取医疗救助金(元):&nbsp;</td>
            <td width="25%" align="left">
            	<c:choose>
            		<c:when test="${empty isv5 }">
            			<c:set var="isv5Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="isv5Val" value="${isv5 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId10" name="incometxt" value="${isv5Val }" maxlength="10" onblur="checkIsv4(this)" tabindex="10" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right">新农保:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="bb2==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb2(this)" tabindex="20" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox2" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb2(this)" tabindex="20" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox2" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right">⑦领取其他补助金(元)&nbsp;</td>
        	<td width="25%" align="left">
        		<c:choose>
            		<c:when test="${empty isv6 }">
            			<c:set var="isv6Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="isv6Val" value="${isv6 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="incId11" name="incometxt" value="${isv6Val }" maxlength="10" onblur="checkIsv5(this)" tabindex="11" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="25%" align="right">大病医疗救助:&nbsp;</td>
            <td width="25%" align="left">
				<s:if test="bb3==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb3(this)" tabindex="21" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox3" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb3(this)" tabindex="21" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox3" name="incometxt" value="0"/>
				</s:else>
			</td>
        </tr>
        <tr>
        	<td width="25%" align="right" class="tdhead">5、家庭年人均纯收入(元):&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;
            	<label id="rj_income">
            		<c:choose>
	            		<c:when test="${empty inpersonal }">0</c:when>
	            		<c:otherwise>${inpersonal }</c:otherwise>
	            	</c:choose>
            	</label>
            </td>
        	<td width="25%" align="right">参加或享受其它社会保障:&nbsp;</td>
            <td width="25%" align="left">
            	<s:if test="bb4==1">
				<input type="checkbox" name="chk_bb_name" class="cuncbox" checked="checked" onclick="selectBb4(this)" tabindex="22" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox4" name="incometxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_bb_name" class="cuncbox" onclick="selectBb4(this)" tabindex="22" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="bbox4" name="incometxt" value="0"/>
				</s:else>
            </td>
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
            <td width="25%" align="right" class="tdhead">上年是否脱贫:&nbsp;</td>
            <td width="25%" align="left" class="tdhead">&nbsp;<s:property value="ltp==1?'1:是':'2:否'"/></td>
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
<script type="text/javascript">  
	function enterToTab(event, input) 
	{  
	    var e = event?event:window.event;  
	    var form = document.getElementById('form1');  
	    if(e.keyCode == 13) 
		{  
	        var tabindex = input.getAttribute('tabindex');  
	        tabindex++;  
	        var inputs = form.getElementsByTagName('input');  
	        for(var i=0,j=inputs.length; i<j; i++) 
		    {  
	            if (inputs[i].getAttribute('tabindex') == tabindex) 
		        {    
	                inputs[i].focus();
	                inputs[i].select();
	                break;  
	            }  
	        }  
	    }  
	}  
</script>	
</body>
</html>