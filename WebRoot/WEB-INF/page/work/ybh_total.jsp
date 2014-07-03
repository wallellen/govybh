<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
</head>
<body onload="loadParam()" style="background:#E0EEFB;">
<div style="float:right; width:868px; height:668px;">
	<div style="width:640px; height:22px; margin-top:10px;" class="title-stats">农户查询&nbsp;[<s:property value="#session.vts.map.name"/>]</div>
	<form name="farmerForm" action="${pageContext.request.contextPath }/system/govFarmerQueryAction_home.do" method="post" onsubmit="return changeCurPage()">
	<input type="hidden" id="qparam" name="qparam" value="<s:property value="qstr"/>"/>
	<fieldset style="border:1px solid #3B9FFF; margin:0; padding:0; width:99%;">
	<legend>查询条件</legend>
	<div style="height:60px;">
	<table cellpadding="0" cellspacing="0"  width="100%">
        	<tr>
            	<td colspan="2">
                	<input type="radio" name="quota"/>村级指标
                    <input type="radio" name="quota"/>户级指标
                </td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
            	<td width="20%" align="right">年份：</td>
                <td width="20%" align="left">
                    <select>
                        <option>2014</option>
                        <option>2015</option>
                    </select>
                </td>
                <td width="20%" align="right">范围：</td>
                <td width="20%" align="left">
                    <select>
                        <option>1:苏北五市</option>
                        <option>2:苏北22县</option>
                        <option>3:茅山革命老区</option>
                        <option>4:黄桥革命老区</option>
                        <option>5:苏北苏中结合部</option>
                    </select>
                </td>
                <td width="20%"><input id="searchImg" type="button" value="立即查询" class="button4"/></td>
            </tr>
        </table>
	</div>
	</fieldset>
	<div style="height:5px;"></div>
	</form>

	<div class="table-c" style="height:24px; width:851px;">
    <table class="data_list" border="0" cellpadding="0" cellspacing="0"  width="100%">
        <tr class="tabtr1">
			<td width="30%">类别</td>			
			<td width="50%%">监测指标</td>
			<td width="20%">全省100村</td>
		</tr>
        </table>
    </div>
	<div class="table-c" style="height:524px; width:868px; overflow-y:auto;">

	<table class="data_list" cellpadding="0" cellspacing="0"  width="100%">
		<tr>
			<td rowspan="9" align="center" width="30%">一、观察点村基本情况</td>			
			<td width="50%" align="right">总农户（户）</td>
			<td width="20%" align="right">hnt</td>
		</tr>
		<tr>			
			<td>总人口（人）</td>
			<td>rnt</td>
		</tr>
		<tr>			
			<td>总劳动力（个）</td>
			<td>lnt</td>
		</tr>
		<tr>			
			<td>承包耕地（亩）</td>
			<td>ft</td>
		</tr>
		<tr>			
			<td>年人均纯收入（元）</td>
			<td>inTotal_ap</td>
		</tr>
		<tr>			
			<td>村集体经营性收入总量（万元）</td>
			<td>inJY</td>
		</tr>
		<tr>			
			<td>村均集体经性营收入（万元）</td>
			<td>inJy_Ac</td>
		</tr>
		<tr>			
			<td>村集体负债总额（万元）</td>
			<td>fze</td>
		</tr>
		<tr>			
			<td>村均集体负债额（万元）</td>
			<td>fze_a</td>
		</tr>
		
        <tr>
        	<td rowspan="4">二、村建档户基本情况</td>
            <td>村建档户总户数（户）</td>
            <td>hnl</td>
        </tr>
        <tr>
        	<td>村建档户总人口数（人）</td>
            <td>rnl</td>
        </tr>
        <tr>
        	<td>村建档户总劳动力数（个）</td>
            <td>lnl</td>
        </tr>
        <tr>
        	<td>村建档户总承包耕地面积（亩）</td>
            <td>fl</td>
        </tr>
        
        <tr>
        	<td rowspan="4">三、样本户收入情况</td>
            <td>样本户户均家庭纯收入（元/年）</td>
            <td>inTotal_a</td>
        </tr>
        <tr>
        	<td>其中：①经营性收入（元）</td>
            <td>inJY_ah</td>
        </tr>
        <tr>
        	<td>②工资性收入（元）</td>
            <td>inWork_a</td>
        </tr>
        <tr>
        	<td>③财产性和转移性收入（元）</td>
            <td>inCZ_a</td>
        </tr>
        
        <tr>
        	<td rowspan="3">四、村建档户主要类型</td>
            <td>①扶贫户（户）</td>
            <td>p1</td>
        </tr>
        <tr>
        	<td>②低保户（户）</td>
            <td>p2</td>
        </tr>
        <tr>
        	<td>③五保户（户）</td>
            <td>p3</td>
        </tr>
        
        <tr>
        	<td rowspan="8">五、村建档户致贫原因</td>
            <td>①因灾致贫（户）</td>
            <td>dc1</td>
        </tr>
        <tr>
        	<td>②因病致贫户（户）</td>
            <td>dc2</td>
        </tr>
        <tr>
        	<td>③因残致贫户（户）</td>
            <td>dc3</td>
        </tr>
        <tr>
        	<td>④因学致贫（户）</td>
            <td>dc4</td>
        </tr>
        <tr>
        	<td>⑤因缺技术致贫（户）</td>
            <td>dc5</td>
        </tr>
        <tr>
        	<td>⑥因缺劳力致贫（户）</td>
            <td>dc6</td>
        </tr>
        <tr>
        	<td>⑦因缺资金致贫（户）</td>
            <td>dc7</td>
        </tr>
        <tr>
        	<td>⑧其他原因致贫（户）</td>
            <td>dc8</td>
        </tr>
        
        <tr>
            <td rowspan="5">六、村扶贫项目落实情况</td>
            <td>得到扶贫项目支持村数（个）</td>
            <td>fps</td>
        </tr>
        <tr>
            <td>其中：①产业发展项目支持村（个）</td>
            <td>fps1</td>
        </tr>
        <tr>
            <td>②基础设施项目支持村（个）</td>
            <td>fps2</td>
        </tr>
        <tr>
            <td>③公益事业项目支持村（个）</td>
            <td>fps3</td>
        </tr>
        <tr>
            <td>④未得到任何项目支持村（个）</td>
            <td>fps0</td>
        </tr>
        
        <tr>
            <td rowspan="5">七、村扶贫资金落实情况</td>
            <td>得到扶贫资金支持村数（个）</td>
            <td>fpcn</td>
        </tr>
        <tr>
            <td>得到扶贫资金总量（万元）</td>
            <td>fpv</td>
        </tr>
        <tr>
            <td>其中：①省级扶贫资金（万元）</td>
            <td>fpv1</td>
        </tr>
        <tr>
            <td>②市县级扶贫资金（万元）</td>
            <td>fpv2</td>
        </tr>
        <tr>
            <td>村均得到扶贫资金数（万元）</td>
            <td>fpv_a</td>
        </tr>
        
        <tr>
            <td rowspan="6">八、村扶贫小额贷款使用情况</td>
            <td>使用贷款村数（个）</td>
            <td>udcn</td>
        </tr>
        <tr>
            <td>使用贷款总农户数（户）</td>
            <td>hndt</td>
        </tr>
        <tr>
            <td>其中：建档户数（户）</td>
            <td>nhdl</td>
        </tr>
        <tr>
            <td>使用贷款总量（万元）</td>
            <td>vdt</td>
        </tr>
        <tr>
            <td>其中：建档户使用总量（万元）</td>
            <td>vdtl</td>
        </tr>
        <tr>
            <td>户均使用贷款额度（万元）</td>
            <td>vdt_ha</td>
        </tr>
        
        <tr>
            <td rowspan="5">九、村建档户参加社会保障情况</td>
            <td>①参加新农合（户）</td>
            <td>b1</td>
        </tr>
        <tr>
            <td>②参加新农保（户）</td>
            <td>b2</td>
        </tr>
        <tr>
            <td>③参加大病医疗救助（户）</td>
            <td>b3</td>
        </tr>
        <tr>
            <td>④参加享受其它保障（户）</td>
            <td>b4</td>
        </tr>
        <tr>
            <td>⑤未参加或享受任何保障（户）</td>
            <td>b0</td>
        </tr>
        <tr>
            <td rowspan="3">十、村建档户脱贫情况</td>
            <td>村建档户当年脱贫数（户）</td>
            <td>tph</td>
        </tr>
        <tr>
            <td>村建档户当年脱贫人口（人）</td>
            <td>tprk</td>
        </tr>
        <tr>
            <td>村百村建档户当年人口脱贫率（%）</td>
            <td>tpn</td>
        </tr>
	</table>
	</div>
</div>
</body>
</html>