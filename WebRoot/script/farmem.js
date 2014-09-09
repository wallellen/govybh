
//初始化fancybox控件页面的checkbox
function initFancyCheckbox()
{
	var c = document.getElementsByName("chkbox");
	var xmlist = document.getElementById("xmlist");
	var xmValue = xmlist.value;
	xmValue=xmValue.split(",");
	if(xmValue.length>0)
	{
		for(var i=0; i<xmValue.length; i++)
		{
			for(var j=0; j<c.length; j++){ 
				if(c[j].id == xmValue[i]){
					c[j].checked=true;  
				}
			}
		}
	}
}

//选择县
function selectXian(){
	var c = document.getElementsByName("chkbox");
	var xmlist = document.getElementById("xmlist");
	var closeBt = "<label id='closeBtn' class='dis_sel_xian'>&nbsp;</label>";
	selxian.innerHTML='';
	var xmListCode = ''; 
	var xmListName = '';
	for(var i=0; i<c.length; i++){ 
		if(c[i].checked){
			xmListCode += c[i].id+',';          
			xmListName += c[i].value+',';  
		}
	}
	$("#xmlist").val(xmListCode);
	var xnameCloseBt = "<label class='sel_xian_list'>["+xmListName+"]</label>"+closeBt;
	$("#xmname").val(xnameCloseBt);
	if(xmListName.length>0)
	{
		selxian.innerHTML="<label class='sel_xian_list'>["+xmListName+"]</label>"+closeBt;
	}
	else
	{
		selxian.innerHTML="[全省]";
		$("#xmname").val("[全省]");
		xmlist.value=null;
	}
	$("#closeBtn").bind('click',disSelectXian);	
}
//反选
function disSelectXian()
{
	var c = document.getElementsByName("chkbox");
	for(var i=0; i<c.length; i++){   
		c[i].checked=false;
	}   
	selxian.innerHTML="[全省]";
	$("#xmname").val("[全省]");
	xmlist.value=null;
}


//享受扶贫项目支持情况
function setFupinVal(o)
{
	if(o.checked==true){
		fupin_val.value="1";
	}else{
		fupin_val.value="";
	}
}
//产业发展项目
function setFupinValA(o)
{
	if(o.checked==true){
		fupin_val_a.value="1";
	}else{
		fupin_val_a.value="";
	}
}
//帮助就业项目
function setFupinValB(o)
{
	if(o.checked==true){
		fupin_val_b.value="1";
	}else{
		fupin_val_b.value="";
	}
}
//小额扶贫贷款项目
function setFupinValC(o)
{
	if(o.checked==true){
		fupin_val_c.value="1";
	}else{
		fupin_val_c.value="";
	}
}
//入股收益分红类项目
function setFupinValD(o)
{
	if(o.checked==true){
		fupin_val_d.value="1";
	}else{
		fupin_val_d.value="";
	}
}
//其它项目
function setFupinValE(o)
{
	if(o.checked==true){
		fupin_val_e.value="1";
	}else{
		fupin_val_e.value="";
	}
}
/////////////////////////////////
//参加社会保障情况
function setShebaoVal(o)
{
	if(o.checked==true){
		shebao_val.value="1";
	}else{
		shebao_val.value="";
	}
}
//新农合
function setShebaoValA(o)
{
	if(o.checked==true){
		shebao_val_a.value="1";
	}else{
		shebao_val_a.value="";
	}
}
//新农保
function setShebaoValB(o)
{
	if(o.checked==true){
		shebao_val_b.value="1";
	}else{
		shebao_val_b.value="";
	}
}
//大病医疗救助
function setShebaoValC(o)
{
	if(o.checked==true){
		shebao_val_c.value="1";
	}else{
		shebao_val_c.value="";
	}
}
//参加或享受其它社会保障
function setShebaoValD(o)
{
	if(o.checked==true){
		shebao_val_d.value="1";
	}else{
		shebao_val_d.value="";
	}
}
/////////////////////////////////////////////////////////////////////////
//指标名称 
var zbcurid=0;
var zbcurtype;
function changeZhibiao(i)
{
	var zbSelect = $("#zbSelectId"+i)[0];
	//指标ID
	var zbId = zbSelect.options[zbSelect.selectedIndex].id;
	if(zbSelect.options[zbSelect.selectedIndex].value=='1')
	{
		$(".spanCheck"+i).show();
		$(".spanVal"+i).hide();
		$("#a"+i).val(zbId);
		$("#d"+i).val(1);
		$("#c"+i).attr("value",$("#a"+i).val()+","+$("#b"+i).val()+"#");
	}
	else if(zbSelect.options[zbSelect.selectedIndex].value=='2')
	{
		$(".spanCheck"+i).hide();
		$(".spanVal"+i).show();
		$("#a"+i).val(zbId);
		$("#d"+i).val(2);
		//
		var fieldOrMoney;
		if(zbId==300)
		{
			fieldOrMoney = "请输入面积";
		}
		else
		{
			fieldOrMoney = "请输入金额";
		}
		$("#yuan"+i).attr('placeholder',fieldOrMoney);
	}
	else
	{
		$(".spanCheck"+i).hide();
		$(".spanVal"+i).hide();
		$("#a"+i).val(zbId);
		$("#d"+i).val('');
	}
}

//逻辑关系 
function changeGtLt(i)
{
	var glSelect = $("#glSelectId"+i)[0];
	var glId = glSelect.options[glSelect.selectedIndex].value;
	$("#b"+i).val(glId);
	glId = glId==1?'>=':'<=';
	$("#c"+i).attr("value",$("#a"+i).val()+","+ glId +$("#yuan"+i).val()+"#")
}

//复选框 
function changeCheckBox(i)
{
	var ckVal = 0;
	var chkbox = $("#chk_box"+i)[0];
	if(chkbox.checked)
	{
		ckVal = 1;
		$("#b"+i).val(1);
		$("#d"+i).val(1);
	}
	else
	{
		ckVal = 0;
		$("#a"+i).val('');
		$("#b"+i).val(0);
		$("#d"+i).val(0);
	}
	$("#c"+i).attr("value",$("#a"+i).val()+","+ckVal+"#")
}

//指标值 
function changeZhibVal(i)
{
	var lj = $("#b"+i).val();
	var yuan = $("#yuan"+i).val();
	var dyxy;
	if(lj==1)
	{
	 	dyxy=">=";
	}
	else
	{
		dyxy="<=";
	}
	if(!yuan)
	{
		alert("指标值不能为空");
	}
	else
	{
		$("#c"+i).attr("value",$("#a"+i).val()+","+dyxy+yuan+"#");
	}
}

//单选
function changeRadioBox(i)
{
	var ckVal = 0;
	var radio = document.getElementsByName("radio_box"+i);
	if(radio[0].checked)
    {
		ckVal = 1;
		$("#b"+i).val(1);
		$("#d"+i).val(1);
    }
	else
	{
		ckVal = 0;
		$("#b"+i).val(0);
		$("#d"+i).val(0);
	}
	$("#c"+i).attr("value",$("#a"+i).val()+","+ckVal+"#")
}

//查询提交校验指标值
function checkZhibiaoInput()
{
	var yuans = $("input[name='yuan']");
	for(var i=1; i<=yuans.length; i++)
	{
		var zbSelect = $("#zbSelectId"+i)[0];
		//指标ID
		var zbId = zbSelect.options[zbSelect.selectedIndex].id;
		if(zbSelect.options[zbSelect.selectedIndex].value=='2')
		{
			var yuan=$("#yuan"+i).val();
			if(!yuan){
				alert("查询指标值不能为空");
				return false;
			}
		}
	}
	
}