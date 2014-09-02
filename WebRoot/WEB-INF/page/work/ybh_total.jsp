<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<style type="text/css">
		.aleft{text-align:left}
		.acenter{text-align:center}
		.aright{text-align:right}
		.chzb{cursor:pointer;}
	</style>
</head>
<body onload="loadParam()" style="background:#E0EEFB;">
<div style="width:868px; height:668px;">
	<h3 class="ybh_h3_title"><s:property value="year"/>年度扶贫观察点<s:if test="zhibiao=='cun'">村级</s:if><s:elseif test="zhibiao=='hu'">户级</s:elseif><s:else></s:else>监测数据汇总</h3>
	<form name="form1" action="${pageContext.request.contextPath }/ybhTotalAction_stats.action" method="post">
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:28px;">
	<table cellpadding="0" cellspacing="0" height="100%" width="100%">
        	<tr>
            	<td colspan="2" width="15%" align="center">
                    <s:radio name="zhibiao" list="#{ 'cun':'村级指标', 'hu':'户级指标'}" listValue="value" value="%{zhibiao==null?'cun':zhibiao}" cssClass="chzb"/>
                </td>
            	<td width="10%" align="right">年份：</td>
                <td width="10%" align="left">
                    <s:select name="year" list="#session.vts.list" value="%{year}"></s:select> 
                </td>
                <td width="20%" align="left">
	                <s:if test="#session.vts.rbm.length()==2">
	                   	 范围：<s:select name="mode" list="#application.vta.GetList('subeimode')" listKey="id" listValue="str" value="%{mode}" cssClass="sele"></s:select>
	                </s:if>
					<s:else>
					<input type="hidden" name="mode" value="1"/>
					</s:else>
				</td>
                <td width="30%"><input id="searchImg" type="submit" value="立即统计" class="button4"/></td>
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
		<div class="table-c" style="height:580px; width:868px; line-height:22px; overflow-y:auto;">
		<table class="data_list" cellpadding="0" cellspacing="0"  width="100%">
			<tr>
				<td rowspan="9" width="25%" class="aleft">&nbsp;一、观察点村基本情况</td>			
				<td width="25%" class="aleft">&nbsp;总农户（户）</td>
				<td width="15%" class="aright"><s:property value="#session.vts.map.hnt"/>&nbsp;</td>
				<td width="35%"></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;总人口（人）</td>
				<td class="aright"><s:property value="#session.vts.map.rnt"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;总劳动力（个）</td>
				<td class="aright"><s:property value="#session.vts.map.lnt"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;承包耕地（亩）</td>
				<td class="aright"><s:property value="#session.vts.map.ft"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;年人均纯收入（元）</td>
				<td class="aright"><s:property value="#session.vts.map.inTotal_ap"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;村集体经营性收入总量（万元）</td>
				<td class="aright"><s:property value="#session.vts.map.inJY"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;村均集体经性营收入（万元）</td>
				<td class="aright"><s:property value="#session.vts.map.inJy_Ac"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;村集体负债总额（万元）</td>
				<td class="aright"><s:property value="#session.vts.map.fze"/>&nbsp;</td>
				<td></td>
			</tr>
			<tr>			
				<td class="aleft">&nbsp;村均集体负债额（万元）</td>
				<td class="aright"><s:property value="#session.vts.map.fze_a"/>&nbsp;</td>
				<td></td>
			</tr>
			
	        <tr>
	        	<td rowspan="4" align="left">&nbsp;二、村建档户基本情况</td>
	            <td class="aleft">&nbsp;村建档户总户数（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.hnl"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;村建档户总人口数（人）</td>
	            <td class="aright"><s:property value="#session.vts.map.rnl"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;村建档户总劳动力数（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.lnl"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;村建档户总承包耕地面积（亩）</td>
	            <td class="aright"><s:property value="#session.vts.map.fl"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	        	<td rowspan="4" align="left">&nbsp;三、样本户收入情况</td>
	            <td class="aleft">&nbsp;样本户户均家庭纯收入（元/年）</td>
	            <td class="aright"><s:property value="#session.vts.map.inTotal_a"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;其中：①经营性收入（元）</td>
	            <td class="aright"><s:property value="#session.vts.map.inJY_ah"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;②工资性收入（元）</td>
	            <td class="aright"><s:property value="#session.vts.map.inWork_a"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;③财产性和转移性收入（元）</td>
	            <td class="aright"><s:property value="#session.vts.map.inCZ_a"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	        	<td rowspan="3" class="aleft">&nbsp;四、村建档户主要类型</td>
	            <td class="aleft">&nbsp;①扶贫户（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.p1"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;②低保户（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.p2"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;③五保户（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.p3"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	        	<td rowspan="8" class="aleft">&nbsp;五、村建档户致贫原因</td>
	            <td class="aleft">&nbsp;①因灾致贫（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc1"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;②因病致贫户（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc2"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;③因残致贫户（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc3"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;④因学致贫（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc4"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;⑤因缺技术致贫（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc5"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;⑥因缺劳力致贫（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc6"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;⑦因缺资金致贫（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc7"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	        	<td class="aleft">&nbsp;⑧其他原因致贫（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.dc8"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="5" class="aleft">&nbsp;六、村扶贫项目落实情况</td>
	            <td class="aleft">&nbsp;得到扶贫项目支持村数（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.fps"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;其中：①产业发展项目支持村（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.fps1"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;②基础设施项目支持村（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.fps2"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;③公益事业项目支持村（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.fps3"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;④未得到任何项目支持村（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.fps0"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="5" class="aleft">&nbsp;七、村扶贫资金落实情况</td>
	            <td class="aleft">&nbsp;得到扶贫资金支持村数（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.fpcn"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;得到扶贫资金总量（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.fpv"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;其中：①省级扶贫资金（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.fpv1"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;②市县级扶贫资金（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.fpv2"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;村均得到扶贫资金数（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.fpv_a"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="6" class="aleft">&nbsp;八、村扶贫小额贷款使用情况</td>
	            <td class="aleft">&nbsp;使用贷款村数（个）</td>
	            <td class="aright"><s:property value="#session.vts.map.udcn"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;使用贷款总农户数（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.hndt"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;其中：建档户数（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.nhdl"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;使用贷款总量（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.vdt"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;其中：建档户使用总量（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.vdtl"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;户均使用贷款额度（万元）</td>
	            <td class="aright"><s:property value="#session.vts.map.vdt_ha"/>&nbsp;</td>
				<td></td>
	        </tr>
	        
	        <tr>
	            <td rowspan="5" class="aleft">&nbsp;九、村建档户参加社会保障情况</td>
	            <td class="aleft">&nbsp;①参加新农合（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.b1"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;②参加新农保（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.b2"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;③参加大病医疗救助（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.b3"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;④参加享受其它保障（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.b4"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;⑤未参加或享受任何保障（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.b0"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td rowspan="3" class="aleft">&nbsp;十、村建档户脱贫情况</td>
	            <td class="aleft">&nbsp;村建档户当年脱贫数（户）</td>
	            <td class="aright"><s:property value="#session.vts.map.tph"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;村建档户当年脱贫人口（人）</td>
	            <td class="aright"><s:property value="#session.vts.map.tprk"/>&nbsp;</td>
				<td></td>
	        </tr>
	        <tr>
	            <td class="aleft">&nbsp;村百村建档户当年人口脱贫率（%）</td>
	            <td class="aright"><s:property value="#session.vts.map.tpn"/>&nbsp;</td>
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
		<div class="table-c" style="height:580px; width:868px; line-height:22px; overflow-y:auto;">
			<table class="data_list" cellpadding="0" cellspacing="0"  width="100%">
				<tr>
					<td width="10%" rowspan="5">1</td>			
					<td width="25%" class="aleft">&nbsp;总人口（人）</td>
					<td width="15%" class="aright"><s:property value="#session.vts.map.population_t"/>&nbsp;</td>
					<td width="50%"></td>
				</tr>
				<%-- 2014-08-26 add --%>
				<tr>
		            <td class="aleft">&nbsp;其中：(1)在校生人口（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_s"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;有在校生户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.nh_s"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;(2)低保、五保人口（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_b"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;低保、五保户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.nh_b"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="2">2</td>
		            <td class="aleft">&nbsp;总劳动力（个）</td>
		            <td class="aright"><s:property value="#session.vts.map.labornum_t"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;其中：务工劳动力（个）</td>
		            <td class="aright"><s:property value="#session.vts.map.wlabornum_t"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="7">3</td>
		            <td class="aleft">&nbsp;承包耕地总面积（亩）</td>
		            <td class="aright"><s:property value="#session.vts.map.fields_t"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均承包耕地面积（亩）</td>
		            <td class="aright"><s:property value="#session.vts.map.fields_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均生产经营收入（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.inJy_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;愿意流转耕地户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.nh_lz"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均流转面积（亩）</td>
		            <td class="aright"><s:property value="#session.vts.map.lzmj_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均流转耕地年租金（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.lzzj_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均领取种粮补贴（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.zlbz_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="6">4</td>
		            <td class="aleft">&nbsp;年总纯收入（万元/年）</td>
		            <td class="aright"><s:property value="#session.vts.map.intotal_t"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均年纯收入（元/年）</td>
		            <td class="aright"><s:property value="#session.vts.map.inTotal_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;其中：①经营性收入（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.inJy_t"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;②工资性收入（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.inWork_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;③财产性及转移性收入（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.incz_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;④各类补贴收入（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.inbz_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td>5</td>
		            <td class="aleft">&nbsp;年人均纯收入（元/年）</td>
		            <td class="aright"><s:property value="#session.vts.map.inTotal_ah"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="8">6</td>
		            <td class="aleft">&nbsp;①因病致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.dc1"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;②因残致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.dc2"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;③因灾致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.dc3"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;④因学致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.dc4"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑤因缺劳力致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.dc5"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑥因其它原因致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.dc6"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑦缺技术致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map."/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑧缺资金致贫（户）</td>
		            <td class="aright"><s:property value="#session.vts.map."/>&nbsp;</td>
		            <td></td>
		        </tr>
		        
		        <tr>
		            <td rowspan="16">7</td>
		            <td class="aleft">&nbsp;得到扶贫项目支持的户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;①得到产业发展项目支持（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs1"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;②得到就业项目支持（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs2"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;③得到小额扶贫贷款支持（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs3"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;④得到入股收益分红项目支持（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs4"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑤得到其它项目支持（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs5"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑥未得到任何项目支持（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs6"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑦得到帮助上学项目（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs7"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑧得到帮助就医项目（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fs8"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑧得到帮助参保项目（户）</td>
		            <td class="aright"><s:property value="#session.vts.map."/>&nbsp;</td>
		            <td></td>
		        </tr>
		        
		        <tr>
		            <td class="aleft">&nbsp;其中：得到帮扶项目到人人数（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_fst"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;①得到帮助就业（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_fs1"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;②得到帮助上学（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_fs2"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;③得到帮助就医（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_fs3"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;④得到帮助参保（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_fs4"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑤得到其它帮助（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.rk_fs5"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        
		        
		        <tr>
		            <td rowspan="6">8</td>
		            <td class="aleft">&nbsp;得到扶贫资金支持的户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.v_hn"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;得到的扶贫资金总量（万元）</td>
		            <td class="aright"><s:property value="#session.vts.map.v"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;其中：①省级扶贫资金（万元）</td>
		            <td class="aright"><s:property value="#session.vts.map.v1"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;②市县级扶贫资金（万元）</td>
		            <td class="aright"><s:property value="#session.vts.map.v2"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均得到扶贫资金（元）</td>
		            <td class="aright"><s:property value="#session.vts.map.v_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;未得到扶贫资金支持的户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.v0_hn"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="4">9</td>
		            <td class="aleft">&nbsp;使用扶贫小额贷款户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.xe_hn"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;使用贷款总量（万元）</td>
		            <td class="aright"><s:property value="#session.vts.map.xe_t"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;户均使用贷款（万元）</td>
		            <td class="aright"><s:property value="#session.vts.map.xe_a"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;未使用扶贫小额贷款的户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.xe0_hn"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="6">10</td>
		            <td class="aleft">&nbsp;参加社会保障情况（户有交叉）</td>
		            <td class="aright"><s:property value="#session.vts.map.b"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;①参加新农合（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.b1"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;②参加新农保（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.b2"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;③参加大病医疗救助（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.b3"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;④参加其它保障（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.b4"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;⑤未参加或享受任何保障（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.b0"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td rowspan="9">11</td>
		            <td class="aleft">&nbsp;累计脱贫户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.tph"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;累计脱贫人口（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.tprk"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;当年脱贫户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.tph_c"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;当年脱贫人口（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.tprk_c"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;当年人口脱贫率（%）</td>
		            <td class="aright"><s:property value="#session.vts.map."/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;去年脱贫户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.tph_l"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;去年脱贫人口（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.tprk_l"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;当年返贫户数（户）</td>
		            <td class="aright"><s:property value="#session.vts.map.fph_c"/>&nbsp;</td>
		            <td></td>
		        </tr>
		        <tr>
		            <td class="aleft">&nbsp;当年返贫人口（人）</td>
		            <td class="aright"><s:property value="#session.vts.map.fprk_c"/>&nbsp;</td>
		            <td></td>
		        </tr>
			</table>
		</div>
	</s:elseif>
	<s:else></s:else>
</div>
</body>
</html>