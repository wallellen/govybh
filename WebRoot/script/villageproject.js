// JavaScript Document
function popVillageProjectEdit(s,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,n){
	//title
	var vt = document.getElementById("vtitle");
	vt.innerHTML="";
	//clear
	document.getElementById("vp1").value='';
	document.getElementById("vp2").value='';
	document.getElementById("vp3").value='';
	document.getElementById("vp4").value='';
	document.getElementById("vp5").value='';
	document.getElementById("vp6").value='';
	document.getElementById("vp7").value='';
	document.getElementById("vp8").value='';
	document.getElementById("vp9").value='';
	document.getElementById("vp10").value='';
	document.getElementById("vp11").value='';
	document.getElementById("vp12").value='';
	document.getElementById("vp13").value='';
	document.getElementById("vp14").value='';

	hideVillErrTip();
	
	if(s=="edit"){
		vt.innerHTML="<font color='#fff'>【"+n+"】 修改项目</font>";
		document.getElementById("vcm").value=v1;	//要更新或插入的项目所在乡的编码
		document.getElementById("vpid").value=v2;	//项目编号,如果是新建,则项目编号为空
		document.getElementById("vp1").value=v3;
		document.getElementById("vp2").value=v4;
		document.getElementById("vp3").value=v5;
		document.getElementById("vp4").value=v6;
		document.getElementById("vp5").value=v7;
		document.getElementById("vp6").value=v8;
		document.getElementById("vp7").value=v9;
		document.getElementById("vp8").value=v10;
		document.getElementById("vp9").value=v11;
		document.getElementById("vp10").value=v12;
		document.getElementById("vp11").value=v13;
		document.getElementById("vp12").value=v14;
		document.getElementById("vp13").value=v15;
		document.getElementById("vp14").value=v16;
	}else{
		vt.innerHTML="<font color='#fff'>【"+n+"】 添加项目</font>";
		document.getElementById("vcm").value=v1;	//要更新或插入的项目所在乡的编码
		document.getElementById("vpid").value=v2;	//项目编号,如果是新建,则项目编号为空
		document.getElementById("vp1").value='项目1';
		document.getElementById("vp2").value='';
		document.getElementById("vp3").value=0;
		document.getElementById("vp4").value=0;
		document.getElementById("vp5").value=0;
		document.getElementById("vp6").value=0;
		document.getElementById("vp7").value=0;
		document.getElementById("vp8").value=0;
		document.getElementById("vp9").value=0;
		document.getElementById("vp10").value=0;
		document.getElementById("vp11").value=0;
		document.getElementById("vp12").value=2014;
		document.getElementById("vp13").value=0;
		document.getElementById("vp14").value=0;
		
	}
	
	var oWin = document.getElementById("win-villageproject");
	var oLay = document.getElementById("overlay-villageproject");
	var oClose = document.getElementById("y-close"); 
	var oH2 = oWin.getElementsByTagName("h2")[0]; 
	var bDrag = false; 
	var disX = disY = 0; 
	oLay.style.display = "block"; 
	oWin.style.display = "block" 
		oClose.onclick = function(){ 
		oLay.style.display = "none"; 
		oWin.style.display = "none" 
	}; 
	oClose.onmousedown = function(event){ 
		(event || window.event).cancelBubble = true; 
	}; 
	oH2.onmousedown = function(event){ 
		var event = event || window.event; 
		bDrag = true; 
		disX = event.clientX - oWin.offsetLeft; 
		disY = event.clientY - oWin.offsetTop; 
		this.setCapture && this.setCapture(); 
		return false 
	}; 
	document.onmousemove = function(event){ 
		if (!bDrag) return; 
		var event = event || window.event; 
		var iL = event.clientX - disX; 
		var iT = event.clientY - disY; 
		var maxL = document.documentElement.clientWidth - oWin.offsetWidth; 
		var maxT = document.documentElement.clientHeight - oWin.offsetHeight; 
		iL = iL < 0 ? 0 : iL; 
		iL = iL > maxL ? maxL : iL; 
		iT = iT < 0 ? 0 : iT; 
		iT = iT > maxT ? maxT : iT; 

		oWin.style.marginTop = oWin.style.marginLeft = 0; 
		oWin.style.left = iL + "px"; 
		oWin.style.top = iT + "px"; 
		return false 
	}; 
	document.onmouseup = window.onblur = oH2.onlosecapture = function(){ 
		bDrag = false; 
		oH2.releaseCapture && oH2.releaseCapture(); 
	}; 	
}
function subVillageProjectBt(){
	document.villageProjectForm.action="govVillageProjectAction_saveVillageProject.do";
	if(!checkVillProName(document.all.vp1)) return;
	
	if(!checkMoney(document.all.vp3)) return;
	if(!checkMoney(document.all.vp4)) return;
	if(!checkMoney(document.all.vp5)) return;
	if(!checkMoney(document.all.vp6)) return;
	if(!checkMoney(document.all.vp7)) return;
	if(!checkMoney(document.all.vp8)) return;
	if(!checkMoney(document.all.vp9)) return;
	if(!checkMoney(document.all.vp10)) return;
	if(!checkMoney(document.all.vp11)) return;
	//
	if(!checkPercent(document.all.vp13)) return;
	if(!checkPercent(document.all.vp14)) return;

	document.villageProjectForm.submit();
}

//validate
function showVillErrTip(top,c)
{
	var errTip=document.getElementById("villErrTip");
	errTip.style.marginTop=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}
function hideVillErrTip()
{
	var errTip=document.getElementById("villErrTip");
	errTip.innerHTML = '';
}

function checkVillProName(obj)
{
	var vpName = obj.value;
	if(vpName=="")
	{
		showVillErrTip(5, "项目名称不能为空");
		obj.focus();
		return false;
	}
	else
	{
		hideVillErrTip();
		return true;
	}
}
function checkMoney(obj)
{
	var t = obj.value;
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	if(reg.test(t))
	{
		hideVillErrTip();
		return true;
	}
	else
	{
		showVillErrTip(60,"请输入大于零的万元金额，最多可以输入一位小数！");
		obj.focus();
		return false;
	}
}
function checkPercent(obj)
{
	var p = obj.value;
	if(isNaN(p))
	{
		showVillErrTip(378,"只能输入数字");
		obj.focus();
		return false;
	}
	else if(p<0 || p>100)
	{
		showVillErrTip(378,"只能输入1-100之间的数字");
		obj.focus();
		return false;	
	}
	else
	{
		hideVillErrTip();
		return true;
	}
}



