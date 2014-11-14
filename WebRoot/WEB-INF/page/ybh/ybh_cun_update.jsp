<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/cun_ybh.js?v=7"></script>
</head>
<body style="background:#E0EEFB;">
<h3 class="ybh_h3_title"><s:property value="#session.vts.map.ybhyear"/>年[<s:property value="oname"/>]指标录入</h3>
<div class="cunwrap">
	<form id="form1" name="form1" action="" method="post">
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
            <td width="22%" align="left">
            	<c:choose>
            		<c:when test="${empty cunMap.hnt }">
            			<c:set var="hntVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="hntVal" value="${cunMap.hnt }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId1" name="cuntxt" value="${hntVal }" maxlength="10" onblur="checkHnt(this)" tabindex="11" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="28%" align="right">总户数(户):&nbsp;</td>
            <td width="22%" align="left">
            	<c:choose>
            		<c:when test="${empty cunMap.hnl }">
            			<c:set var="hnlVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="hnlVal" value="${cunMap.hnl }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId2" name="cuntxt" value="${hnlVal }" maxlength="10" onblur="checkHnl(this)" tabindex="18" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">总人口数(人):&nbsp;</td>
            <td align="left">
            	<c:choose>
            		<c:when test="${empty cunMap.rnt }">
            			<c:set var="rntVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="rntVal" value="${cunMap.rnt }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId3" name="cuntxt" value="${rntVal }" maxlength="10" onblur="checkRnt(this)" tabindex="12" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right">总人口(人):&nbsp;</td>
            <td align="left">
            	<c:choose>
            		<c:when test="${empty cunMap.rnl }">
            			<c:set var="rnlVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="rnlVal" value="${cunMap.rnl }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId4" name="cuntxt" value="${rnlVal }" maxlength="10" onblur="checkRnl(this)" tabindex="19" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">总劳动力数(个):&nbsp;</td>
            <td align="left">
            	<c:choose>
            		<c:when test="${empty cunMap.lnt }">
            			<c:set var="lntVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="lntVal" value="${cunMap.lnt }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId5" name="cuntxt" value="${lntVal }" maxlength="10" onblur="checkLnt(this)" tabindex="13" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right">总劳动力(个):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.lnl }">
            			<c:set var="lnlVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="lnlVal" value="${cunMap.lnl }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId6" name="cuntxt" value="${lnlVal }" maxlength="10" onblur="checkLnl(this)" tabindex="20" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">承包耕地总面积(亩):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.ft }">
            			<c:set var="ftVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="ftVal" value="${cunMap.ft }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId7" name="cuntxt" value="${ftVal }" maxlength="10" onblur="checkFt(this)" tabindex="14" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right">承包耕地总面积(亩):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.fl }">
            			<c:set var="flVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="flVal" value="${cunMap.fl }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId8" name="cuntxt" value="${flVal }" maxlength="10" onblur="checkFl(this)" tabindex="21" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">村农民人均纯收入(元/年):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.inpersonal }">
            			<c:set var="inpersonalVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="inpersonalVal" value="${cunMap.inpersonal }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId9" name="cuntxt" value="${inpersonalVal }" maxlength="10" onblur="checkInpersonal(this)" tabindex="15" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
        <tr>
        	<td align="right">村集体经营性收入(元/年):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.injy }">
            			<c:set var="injyVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="injyVal" value="${cunMap.injy }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId10" name="cuntxt" value="${injyVal }" maxlength="10" onblur="checkInjy(this)" tabindex="16" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right"></td>
            <td align="left"></td>
        </tr>
        <tr>
        	<td align="right">村集体负债总额(万元):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.fze }">
            			<c:set var="fzeVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="fzeVal" value="${cunMap.fze }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId11" name="cuntxt" value="${fzeVal }" maxlength="10" onblur="checkFze(this)" tabindex="17" onkeydown="enterToTab(event,this)"/>
            </td>
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
				<input type="checkbox" name="chk_fps_name" class="cuncbox" checked="checked" onclick="selectFps1(this)" tabindex="22" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="chbox1" name="cuntxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fps_name" class="cuncbox" onclick="selectFps1(this)" tabindex="22" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="chbox1" name="cuntxt" value="0"/>
				</s:else>
			</td>
            <td align="right">其中：(1)省级扶贫资金(万元):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.fpv1 }">
            			<c:set var="fpv1Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="fpv1Val" value="${cunMap.fpv1 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId12" name="cuntxt" value="${fpv1Val }" maxlength="10" onblur="checkFpv1(this)" tabindex="25" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">(2)基础设施建设项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps2!=null && #request.cunMap.fps2==1">
					<input type="checkbox" name="chk_fps_name" class="cuncbox" checked="checked" onclick="selectFps2(this)" tabindex="23" onkeydown="enterToTab(event,this)"/>
					<input type="hidden" id="chbox2" name="cuntxt" value="1"/>
				</s:if>
				<s:else>
					<input type="checkbox" name="chk_fps_name" class="cuncbox" onclick="selectFps2(this)" tabindex="23" onkeydown="enterToTab(event,this)"/>
					<input type="hidden" id="chbox2" name="cuntxt" value="0"/>
				</s:else>
			</td>
            <td align="right">(2)市、县级扶贫资金(万元):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.fpv2 }">
            			<c:set var="fpv2Val" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="fpv2Val" value="${cunMap.fpv2 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId13" name="cuntxt" value="${fpv2Val }" maxlength="10" onblur="checkFpv2(this)" tabindex="26" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">(3)公益事业发展项目:&nbsp;</td>
			<td align="left">
				<s:if test="#request.cunMap.fps3!=null && #request.cunMap.fps3==1">
				<input type="checkbox" name="chk_fps_name" class="cuncbox" checked="checked" onclick="selectFps3(this)" tabindex="24" onkeydown="enterToTab(event,this)"/>
				<input type="hidden" id="chbox3" name="cuntxt" value="1"/>
				</s:if>
				<s:else>
				<input type="checkbox" name="chk_fps_name" class="cuncbox" onclick="selectFps3(this)" tabindex="24" onkeydown="enterToTab(event,this)"/>
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
			<td width="22%" align="left">
				<c:choose>
            		<c:when test="${empty cunMap.hndt }">
            			<c:set var="hndtVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="hndtVal" value="${cunMap.hndt }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId14" name="cuntxt" value="${hndtVal }" maxlength="10" onblur="checkHndt(this)" tabindex="27" onkeydown="enterToTab(event,this)"/>
            </td>
            <td width="28%" align="right">参加新农合(户):&nbsp;</td>
			<td width="22%" align="left">
				<c:choose>
            		<c:when test="${empty cunMap.b1 }">
            			<c:set var="b1Val" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="b1Val" value="${cunMap.b1 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId15" name="cuntxt" value="${b1Val }" maxlength="10" onblur="checkB1(this)" tabindex="31" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">其中：建档立卡农户数(户):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.nhdl }">
            			<c:set var="nhdlVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="nhdlVal" value="${cunMap.nhdl }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId16" name="cuntxt" value="${nhdlVal }" maxlength="10" onblur="checkNhdl(this)" tabindex="28" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right">参加新农保(户):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.b2 }">
            			<c:set var="b2Val" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="b2Val" value="${cunMap.b2 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId17" name="cuntxt" value="${b2Val }" maxlength="10" onblur="checkB2(this)" tabindex="32" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">全村农户使用贷款总量(万元):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.vdt }">
            			<c:set var="vdtVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="vdtVal" value="${cunMap.vdt }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId18" name="cuntxt" value="${vdtVal }" maxlength="10" onblur="checkVdt(this)" tabindex="29" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right">参加大病医疗救助(户):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.b3 }">
            			<c:set var="b3Val" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="b3Val" value="${cunMap.b3 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId19" name="cuntxt" value="${b3Val }" maxlength="10" onblur="checkB3(this)" tabindex="33" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">其中：建档立卡低收入农户(万元):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.vdtl }">
            			<c:set var="vdtlVal" value="0.0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="vdtlVal" value="${cunMap.vdtl }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId20" name="cuntxt" value="${vdtlVal }" maxlength="10" onblur="checkVdtl(this)" tabindex="30" onkeydown="enterToTab(event,this)"/>
            </td>
            <td align="right">参加或享受其它保障(户):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.b4 }">
            			<c:set var="b4Val" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="b4Val" value="${cunMap.b4 }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId21" name="cuntxt" value="${b4Val }" maxlength="10" onblur="checkB4(this)" tabindex="34" onkeydown="enterToTab(event,this)"/>
            </td>
        </tr>
        <tr>
        	<td align="right">全村户均贷款额度(万元):&nbsp;</td>
			<td align="left">
				&nbsp;<span id="qchjdk"><s:property value='#request.cunMap.vdpt'/></span>
				<!--  
				<input type="text" id="cunId22" name="cuntxt" value="<s:property value='#request.cunMap.vdpt'/>" maxlength="10" tabindex="55" readonly="readonly"/>
				-->
				<c:choose>
            		<c:when test="${empty cunMap.vdpt }">
            			<c:set var="vdptVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="vdptVal" value="${cunMap.vdpt }"></c:set>
            		</c:otherwise>
            	</c:choose>
				<input type="hidden" id="cunId22" name="cuntxt" value="${vdptVal }">
			</td>
            <td align="right">未参加或享受任何保障(户):&nbsp;</td>
			<td align="left">
				<c:choose>
            		<c:when test="${empty cunMap.nb }">
            			<c:set var="nbVal" value="0"></c:set>
            		</c:when>
            		<c:otherwise>
            			<c:set var="nbVal" value="${cunMap.nb }"></c:set>
            		</c:otherwise>
            	</c:choose>
            	<input type="text" id="cunId23" name="cuntxt" value="${nbVal }" maxlength="10" onblur="checkNb(this)" tabindex="35" onkeydown="enterToTab(event,this)"/>
            </td>
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