
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

