<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		function checkZhibiao()
		{
			var s = document.getElementsByName("zhibiao");
			var count = 0;
			if(s.length>0) {  
				for(var index=0;index<s.length;index++){   
				  	if(s[index].checked){
				  		count++;break;
				  	}  
				} 
			} 
			if(count == 0){
			 	alert("请选择村级或户级指标查询 ");
			 	return false;
			}
		}
	</script>
</head>
<body onload="loadParam()" style="background:#E0EEFB;">
<div style="float:right; width:868px; height:668px;">
	<div style="width:640px; height:22px; margin-top:10px;" class="title-stats">农户查询&nbsp;[<s:property value="#session.vts.map.name"/>]</div>
	<form name="form1" action="${pageContext.request.contextPath }/ybhTotalAction_stats.action" method="post" onsubmit="return checkZhibiao()">
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:60px;">
	<table cellpadding="0" cellspacing="0" height="100%" width="100%">
        	<tr>
        		<td></td>
            	<td colspan="2">
                    <s:radio name="zhibiao" list="#{ 'cun':'村级指标', 'hu':'户级指标'}" value="%{zhibiao}"/>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
            	<td width="20%" align="right">年份：</td>
                <td width="20%" align="left">
                    <s:select name="year" list="{'2014','2015'}" value="%{year}"></s:select> 
                </td>
                <td width="20%" align="right">范围：</td>
                <td width="20%" align="left">
                    <s:select name="mode" list="#application.vta.GetList('subeimode')" listKey="id" listValue="str" value="%{mode}" cssClass="sele"></s:select></li>
                </td>
                <td width="20%"><input id="searchImg" type="submit" value="立即查询" class="button4"/></td>
            </tr>
        </table>
	</div>
	</fieldset>
	<div style="height:2px;"></div>
	</form>
	<s:if test="zhibiao=='cun'">
		<div class="table-c" style="height:24px; width:851px;">
	    <table class="data_list" border="0" cellpadding="0" cellspacing="0"  width="100%">
	        <tr class="tabtr1">
				<td width="25%">类别</td>			
				<td width="25%%">监测指标</td>
				<td width="15%">
					<s:if test="mode==1">全部</s:if>
					<s:if test="mode==2">苏北五市</s:if>
					<s:elseif test="mode==3">苏北22县</s:elseif>
					<s:elseif test="mode==4">茅山革命老区</s:elseif>
					<s:elseif test="mode==5">黄桥革命老区</s:elseif>
					<s:elseif test="mode==6">苏北苏中结合部</s:elseif>
				</td>
				<td width="35%"></td>
			</tr>
	        </table>
	    </div>
		<div class="table-c" style="height:524px; width:868px; line-height:22px; overflow-y:auto;">
	
		<table class="data_list" cellpadding="0" cellspacing="0"  width="100%">
			<tr>
				<td rowspan="9" width="25%">一、观察点村基本情况</td>			
				<td width="25%">总农户（户）</td>
				<td width="15%"><s:property value="#session.vts.map.hnt"/></td>
				<td width="35%"></td>
			</tr>
			<tr>			
				<td>总人口（人）</td>
				<td><s:property value="#session.vts.map.rnt"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>总劳动力（个）</td>
				<td><s:property value="#session.vts.map.lnt"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>承包耕地（亩）</td>
				<td><s:property value="#session.vts.map.ft"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>年人均纯收入（元）</td>
				<td><s:property value="#session.vts.map.inTotal_ap"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>村集体经营性收入总量（万元）</td>
				<td><s:property value="#session.vts.map.inJY"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>村均集体经性营收入（万元）</td>
				<td><s:property value="#session.vts.map.inJy_Ac"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>村集体负债总额（万元）</td>
				<td><s:property value="#session.vts.map.fze"/></td>
				<td></td>
			</tr>
			<tr>			
				<td>村均集体负债额（万元）</td>
				<td><s:property value="#session.vts.map.fze_a"/></td>
				<td></td>
			</tr>
			
	        <tr>
	        	<td rowspan="4">二、村建档户基本情况</td>
	            <td>村建档户总户数（户）</td>
	            <td><s:property value="#session.vts.map.hnl"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>村建档户总人口数（人）</td>
	            <td><s:property value="#session.vts.map.rnl"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>村建档户总劳动力数（个）</td>
	            <td><s:property value="#session.vts.map.lnl"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>村建档户总承包耕地面积（亩）</td>
	            <td><s:property value="#session.vts.map.fl"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	        	<td rowspan="4">三、样本户收入情况</td>
	            <td>样本户户均家庭纯收入（元/年）</td>
	            <td><s:property value="#session.vts.map.inTotal_a"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>其中：①经营性收入（元）</td>
	            <td><s:property value="#session.vts.map.inJY_ah"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>②工资性收入（元）</td>
	            <td><s:property value="#session.vts.map.inWork_a"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>③财产性和转移性收入（元）</td>
	            <td><s:property value="#session.vts.map.inCZ_a"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	        	<td rowspan="3">四、村建档户主要类型</td>
	            <td>①扶贫户（户）</td>
	            <td><s:property value="#session.vts.map.p1"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>②低保户（户）</td>
	            <td><s:property value="#session.vts.map.p2"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>③五保户（户）</td>
	            <td><s:property value="#session.vts.map.p3"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	        	<td rowspan="8">五、村建档户致贫原因</td>
	            <td>①因灾致贫（户）</td>
	            <td><s:property value="#session.vts.map.dc1"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>②因病致贫户（户）</td>
	            <td><s:property value="#session.vts.map.dc2"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>③因残致贫户（户）</td>
	            <td><s:property value="#session.vts.map.dc3"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>④因学致贫（户）</td>
	            <td><s:property value="#session.vts.map.dc4"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>⑤因缺技术致贫（户）</td>
	            <td><s:property value="#session.vts.map.dc5"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>⑥因缺劳力致贫（户）</td>
	            <td><s:property value="#session.vts.map.dc6"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>⑦因缺资金致贫（户）</td>
	            <td><s:property value="#session.vts.map.dc7"/></td>
				<td></td>
	        </tr>
	        <tr>
	        	<td>⑧其他原因致贫（户）</td>
	            <td><s:property value="#session.vts.map.dc8"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="5">六、村扶贫项目落实情况</td>
	            <td>得到扶贫项目支持村数（个）</td>
	            <td><s:property value="#session.vts.map.fps"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>其中：①产业发展项目支持村（个）</td>
	            <td><s:property value="#session.vts.map.fps1"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>②基础设施项目支持村（个）</td>
	            <td><s:property value="#session.vts.map.fps2"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>③公益事业项目支持村（个）</td>
	            <td><s:property value="#session.vts.map.fps3"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>④未得到任何项目支持村（个）</td>
	            <td><s:property value="#session.vts.map.fps0"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="5">七、村扶贫资金落实情况</td>
	            <td>得到扶贫资金支持村数（个）</td>
	            <td><s:property value="#session.vts.map.fpcn"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>得到扶贫资金总量（万元）</td>
	            <td><s:property value="#session.vts.map.fpv"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>其中：①省级扶贫资金（万元）</td>
	            <td><s:property value="#session.vts.map.fpv1"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>②市县级扶贫资金（万元）</td>
	            <td><s:property value="#session.vts.map.fpv2"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>村均得到扶贫资金数（万元）</td>
	            <td><s:property value="#session.vts.map.fpv_a"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="6">八、村扶贫小额贷款使用情况</td>
	            <td>使用贷款村数（个）</td>
	            <td><s:property value="#session.vts.map.udcn"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>使用贷款总农户数（户）</td>
	            <td><s:property value="#session.vts.map.hndt"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>其中：建档户数（户）</td>
	            <td><s:property value="#session.vts.map.nhdl"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>使用贷款总量（万元）</td>
	            <td><s:property value="#session.vts.map.vdt"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>其中：建档户使用总量（万元）</td>
	            <td><s:property value="#session.vts.map.vdt1"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>户均使用贷款额度（万元）</td>
	            <td><s:property value="#session.vts.map.vdt_ha"/></td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="5">九、村建档户参加社会保障情况</td>
	            <td>①参加新农合（户）</td>
	            <td><s:property value="#session.vts.map.b1"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>②参加新农保（户）</td>
	            <td><s:property value="#session.vts.map.b2"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>③参加大病医疗救助（户）</td>
	            <td><s:property value="#session.vts.map.b3"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>④参加享受其它保障（户）</td>
	            <td><s:property value="#session.vts.map.b4"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>⑤未参加或享受任何保障（户）</td>
	            <td><s:property value="#session.vts.map.b0"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td rowspan="3">十、村建档户脱贫情况</td>
	            <td>村建档户当年脱贫数（户）</td>
	            <td><s:property value="#session.vts.map.tph"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>村建档户当年脱贫人口（人）</td>
	            <td><s:property value="#session.vts.map.tprk"/></td>
				<td></td>
	        </tr>
	        <tr>
	            <td>村百村建档户当年人口脱贫率（%）</td>
	            <td><s:property value="#session.vts.map.tpn"/></td>
				<td></td>
	        </tr>
		</table>
		</div>
	</s:if>
	<s:elseif test="zhibiao=='hu'">
		<div class="table-c" style="height:24px; width:851px;">
	    <table class="data_list" border="0" cellpadding="0" cellspacing="0"  width="100%">
	        <tr class="tabtr1">
				<td width="10%">类别</td>			
				<td width="25%">监测指标</td>
				<td width="15%">
					<s:if test="mode==1">全部</s:if>
					<s:if test="mode==2">苏北五市</s:if>
					<s:elseif test="mode==3">苏北22县</s:elseif>
					<s:elseif test="mode==4">茅山革命老区</s:elseif>
					<s:elseif test="mode==5">黄桥革命老区</s:elseif>
					<s:elseif test="mode==6">苏北苏中结合部</s:elseif>
				</td>
				<td width="50%"></td>
			</tr>
	        </table>
	    </div>
		<div class="table-c" style="height:524px; width:868px; line-height:22px; overflow-y:auto;">
			<table class="data_list" cellpadding="0" cellspacing="0"  width="100%">
				<tr>
					<td width="10%">1</td>			
					<td width="25%">总人口（人）</td>
					<td width="15%"><s:property value="#session.vts.map.population_t"/></td>
					<td width="50%"></td>
				</tr>
		        <tr>
		            <td rowspan="2">2</td>
		            <td>总劳动力（个）</td>
		            <td><s:property value="#session.vts.map.labornum_t"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>其中：务工劳动力（个）</td>
		            <td><s:property value="#session.vts.map.wlabornum_t"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="2">3</td>
		            <td>承包耕地总面积（亩）</td>
		            <td><s:property value="#session.vts.map.fields_t"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>户均耕地面积（亩）</td>
		            <td><s:property value="#session.vts.map.fields_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="5">4</td>
		            <td>年总纯收入（万元/年）</td>
		            <td><s:property value="#session.vts.map.intotal_t"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>户均年纯收入（元/年）</td>
		            <td><s:property value="#session.vts.map.inTotal_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>其中：①经营性收入（元）</td>
		            <td><s:property value="#session.vts.map.inJy_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>②工资性收入（元）</td>
		            <td><s:property value="#session.vts.map.inWork_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>③财产性及转移性收入（元）</td>
		            <td><s:property value="#session.vts.map.incz_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>5</td>
		            <td>年人均纯收入（元/年）</td>
		            <td><s:property value="#session.vts.map.inTotal_ah"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="6">6</td>
		            <td>①因病致贫（户）</td>
		            <td><s:property value="#session.vts.map.dc1"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>②因残致贫（户）</td>
		            <td><s:property value="#session.vts.map.dc2"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>③因灾致贫（户）</td>
		            <td><s:property value="#session.vts.map.dc3"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>④因学致贫（户）</td>
		            <td><s:property value="#session.vts.map.dc4"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>⑤因缺劳力致贫（户）</td>
		            <td><s:property value="#session.vts.map.dc5"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>⑥因其它原因致贫（户）</td>
		            <td><s:property value="#session.vts.map.dc6"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="7">7</td>
		            <td>得到扶贫项目支持的户数（户）</td>
		            <td><s:property value="#session.vts.map.fs"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>①得到产业发展项目支持（户）</td>
		            <td><s:property value="#session.vts.map.fs1"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>②得到就业项目支持（户）</td>
		            <td><s:property value="#session.vts.map.fs2"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>③得到小额扶贫贷款支持（户）</td>
		            <td><s:property value="#session.vts.map.fs3"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>④得到入股收益分红项目支持（户）</td>
		            <td><s:property value="#session.vts.map.fs4"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>⑤得到其它项目支持（户）</td>
		            <td><s:property value="#session.vts.map.fs5"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>⑥未得到任何项目支持（户）</td>
		            <td><s:property value="#session.vts.map.fs0"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="6">8</td>
		            <td>得到扶贫资金支持的户数（户）</td>
		            <td><s:property value="#session.vts.map.v_hn"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>得到的扶贫资金总量（万元）</td>
		            <td><s:property value="#session.vts.map.v"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>其中：①省级扶贫资金（万元）</td>
		            <td><s:property value="#session.vts.map.v1"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>②市县级扶贫资金（万元）</td>
		            <td><s:property value="#session.vts.map.v2"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>户均得到扶贫资金（元）</td>
		            <td><s:property value="#session.vts.map.v_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>未得到扶贫资金支持的户数（户）</td>
		            <td><s:property value="#session.vts.map.v0_hn"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="4">9</td>
		            <td>使用扶贫小额贷款户数（户）</td>
		            <td><s:property value="#session.vts.map.xe_hn"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>使用贷款总量（万元）</td>
		            <td><s:property value="#session.vts.map.xe_t"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>户均使用贷款（万元）</td>
		            <td><s:property value="#session.vts.map.xe_a"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>未使用扶贫小额贷款的户数（户）</td>
		            <td><s:property value="#session.vts.map.xe0_hn"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="6">10</td>
		            <td>参加社会保障情况（户有交叉）</td>
		            <td><s:property value="#session.vts.map.b"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>①参加新农合（户）</td>
		            <td><s:property value="#session.vts.map.b1"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>②参加新农保（户）</td>
		            <td><s:property value="#session.vts.map.b2"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>③参加大病医疗救助（户）</td>
		            <td><s:property value="#session.vts.map.b3"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>④参加其它保障（户）</td>
		            <td><s:property value="#session.vts.map.b4"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>⑤未参加或享受任何保障（户）</td>
		            <td><s:property value="#session.vts.map.b0"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="3">11</td>
		            <td>当年脱贫户数（户）</td>
		            <td><s:property value="#session.vts.map.tph"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>当年脱贫人口（人）</td>
		            <td><s:property value="#session.vts.map.tprk"/></td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>当年人口脱贫率（%）</td>
		            <td><s:property value="#session.vts.map.tpn"/></td>
		            <td></td>
		        </tr>
			</table>
		</div>
	</s:elseif>
	<s:else></s:else>
</div>
</body>
</html>