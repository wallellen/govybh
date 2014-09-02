<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	window.onload=function(){
		//页面加载时，组名获取输入焦点
		document.all.zhu.focus();
	}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/familymember.js?v=6"></script>
<style type="text/css">
	.family-errtip{color:#F00; width:570px;}
</style>
<s:if test="%{#session.vts.map.hname!=''}">
<h3 class="ybh_h3_title">[<s:property value="#session.vts.curHM"/>&nbsp;<s:property value="#session.vts.map.hname"/>]家庭基本信息</h3>
</s:if>
<s:else>
<h3 class="ybh_h3_title">家庭基本信息</h3>
</s:else>
<div id="familyErrTip" class="family-errtip"></div>
<form name="personForm" action="" method="post">
<div id="base-info">
	<ul class="info1">
		<li>组名：<input type="text" id="zhu" name="zhu" style="width:55px; height:20px; line-height:20px; border:1px solid #D8D8D8;" value="<s:property value="#session.vts.map.zhu"/>" maxlength="10" onfocus="this.className='input_onzhu'" onblur="this.className='input_offzhu'"/></li>
		<li>姓名：<input type="text" id="hname" name="hname" value="<s:property value="#session.vts.map.hname"/>" maxlength="10" onfocus="this.className='input_on'" onblur="checkHuName(this)"/></li>
        <li>身份证号码：<input type="text" id="idcno" name="idcno" value="<s:property value="#session.vts.map.idcno"/>" maxlength="18" onfocus="this.className='input_on'" onblur="checkIDCard(this)"/></li>
        <li>联系电话：<input type="text" id="htel" name="htel" value="<s:property value="#session.vts.map.telnum"/>" maxlength="15" onfocus="this.className='input_on'" onblur="checkTelphone(this)"/></li>
	</ul>
    <ul class="info2">
     	<li>承包耕地面积(亩)：<input type="text" name="fields" value="<s:property value="#session.vts.map.fields"/>" maxlength="10" onfocus="this.className='input_on'" onblur="this.className='input_off'" onkeyup="checkFloatInput(this)"/></li>
        <li>住房面积(m2)：<input type="text" id="house" name="house" value="<s:property value="#session.vts.map.house"/>" maxlength="5" onfocus="this.className='input_on'" onblur="checkHouse(this)"/></li>
        <li>农户属性：<s:select name="property" list="#application.vta.GetList('family')" listKey="id" listValue="str" value="%{#session.vts.map.property}" cssClass="sele"></s:select></li>
		<li>贫困原因：<s:select name="dcause" list="#application.vta.GetList('dcause')" listKey="id" listValue="str" value="%{#session.vts.map.dcause}" cssClass="sele"></s:select></li>
	</ul>
	<ul class="info3">
		<li><label for="chkhz">是否参加农民专业合作社</label><s:if test="#session.vts.map.isnh==1">
			<input type="checkbox" id="chkhz" checked="checked" onclick="checkHezuo(this)"/>
			<input type="hidden" name="hezuo" id="hezuo" value="1"/>
			</s:if>
			<s:else>
			<input type="checkbox" id="chkhz" onclick="checkHezuo(this)"/>
			<input type="hidden" name="hezuo" id="hezuo" value="0"/>
			</s:else>
		</li>
		<li><label for="chklz">是否愿意流转</label><s:if test="#session.vts.map.islz==1">
			<input type="checkbox" id="chklz" checked="checked" onclick="checkLiuzhuan(this)">
			<input type="hidden" name="liuzhuan" id="liuzhuan" value="1"/>
			</s:if>
			<s:else>
			<input type="checkbox" id="chklz" onclick="checkLiuzhuan(this)">
			<input type="hidden" name="liuzhuan" id="liuzhuan" value="0"/>
			</s:else>
		</li>
		<li>流转面积：&nbsp;<input type="text" id="lzmj" name="lzmj" onblur="checkLiuzhuanmj(this)" value="<s:property value='#session.vts.map.lzmj'/>" style="width:55px; height:20px; line-height:20px; border:1px solid #D8D8D8;"/></li>
		<li><label for="chktp">去年是否已经脱贫</label><s:if test="#session.vts.map.tpl==1">
			<input type="checkbox" id="chktp" checked="checked" onclick="checkTuopin(this)"/>
			<input type="hidden" name="tuopin" id="tuopin" value="1"/>
			</s:if>
			<s:else>
			<input type="checkbox" id="chktp" onclick="checkTuopin(this)"/>
			<input type="hidden" name="tuopin" id="tuopin" value="0"/>
			</s:else>
		</li>
	</ul>
</div>
<div id="base-info2">
    <ul class="info3">
        <li class="input1">挂钩帮扶人：<input type="text" id="frname" name="frname" value="<s:property value="#session.vts.map.frname"/>" maxlength="10" onfocus="this.className='input_on'" onblur="checkBanfPerson(this)"/></li>
        <li class="input1">单位职务：<input type="text" id="frwork" name="frwork" value="<s:property value="#session.vts.map.frwork"/>" maxlength="10" onfocus="this.className='input_on'" onblur="checkBanfWork(this)"/></li>
        <li class="input1">帮扶人联系电话：<input type="text" id="frtel" name="frtel" value="<s:property value="#session.vts.map.frtel"/>" maxlength="15" onfocus="this.className='input_on'" onblur="checkBanfTelphone(this)"/></li>
        <li>
        	<s:if test="#session.vts.isedit==1">
			<input type="button" value="保存" class="button4" onclick="checkPersonForm()"/>
			</s:if>
			<s:if test="%{#session.vts.map.hname!=''}">
			<input type="button" value="保存返回" class="button4" onclick="saveReturnFamily()"/>
			</s:if>
			<input type="button" value="返回" class="button4" onclick="location.href='${pageContext.request.contextPath }/ybhManageAction_backup.action?viewBM=<s:property value="#session.vts.curBM"/>'"/>
        </li>
    </ul>
</div>
</form>