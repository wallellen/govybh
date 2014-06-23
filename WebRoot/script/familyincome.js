/** add year **/
function popSaveYear(s,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12){
	var ytitle = document.getElementById("ytitle");
	ytitle.innerHTML="";
	//clear
	document.getElementById("yflag").value = '';
	document.getElementById("y-year").value = '';
	
	document.getElementById("yinCrop").value = '';
	document.getElementById("yinLovStock").value = '';
	document.getElementById("yinWork").value = '';
	document.getElementById("yinBla").value = '';
	document.getElementById("yinSubside").value = '';
	document.getElementById("yinOther").value = '';
	document.getElementById("ygrantAid").value = '';
	document.getElementById("yshare").value = '';
	document.getElementById("ypettyLoan").value = '';
	document.getElementById("ylabTrain").value = '';
	document.getElementById("ylabJob").value = '';
	document.getElementById("yearhidden").innerHTML='';
	
	hideIncomeErrTip();
	
	if(s=="edit"){
		ytitle.innerHTML="<font color='#fff'>修改家庭收入及帮扶情况</font>";
		document.getElementById("yearhidden").innerHTML='年份:&nbsp;&nbsp;';
		document.getElementById("y-year").style.display='block';
		document.getElementById("y-year").readOnly='true';
		document.getElementById("y-year").value = y1;
		document.getElementById("yinCrop").value = y2;
		document.getElementById("yinLovStock").value = y3;
		document.getElementById("yinWork").value = y4;
		document.getElementById("yinBla").value = y5;
		document.getElementById("yinSubside").value = y6;
		document.getElementById("yinOther").value = y7;
		document.getElementById("ygrantAid").value = y8;
		document.getElementById("yshare").value = y9;
		document.getElementById("ypettyLoan").value = y10;
		document.getElementById("ylabTrain").value = y11;
		document.getElementById("ylabJob").value = y12;
		document.getElementById("yflag").value = "1";
	}else{
		ytitle.innerHTML="<font color='#fff'>添加家庭收入及帮扶情况</font>";
		document.getElementById("yflag").value = "0";
		document.getElementById("yearhidden").innerHTML='年份:&nbsp;&nbsp;';
		document.getElementById("y-year").style.display='block';
		document.getElementById("y-year").readOnly='true';
		document.getElementById("y-year").value = y1;
		document.getElementById("yinCrop").value = 0;
		document.getElementById("yinLovStock").value = 0;
		document.getElementById("yinWork").value = 0;
		document.getElementById("yinBla").value = 0;
		document.getElementById("yinSubside").value = 0;
		document.getElementById("yinOther").value = 0;
		document.getElementById("ygrantAid").value = 0;
		document.getElementById("yshare").value = 0;
		document.getElementById("ypettyLoan").value = 0;
		document.getElementById("ylabTrain").value = 0;
		document.getElementById("ylabJob").value = 0;
	}
	
	var oWin = document.getElementById("win-year");
	var oLay = document.getElementById("overlay-year");
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
function subYearBt(){
	document.yearForm.action="govBrowerAction_saveYear.do";
	if(!checkIncomeMoney(document.all.yinCrop))return;
	if(!checkIncomeMoney(document.all.yinLovStock))return;
	if(!checkIncomeMoney(document.all.yinWork))return;
	if(!checkIncomeMoney(document.all.yinBla))return;
	if(!checkIncomeMoney(document.all.yinSubside))return;	
	if(!checkIncomeMoney(document.all.yinOther))return;
	if(!checkIncomeMoney(document.all.ygrantAid))return;
	if(!checkIncomeMoney(document.all.yshare))return;
	if(!checkIncomeMoney(document.all.ypettyLoan))return;
	if(!checkIncomeMoney(document.all.ylabTrain))return;
	if(!checkIncomePerson(document.all.ylabJob))return;
	
	document.yearForm.submit();
}

function showIncomeErrTip(top,c)
{
	var errTip=document.getElementById("incomeErrTip");
	errTip.style.marginLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}
function hideIncomeErrTip()
{
	var errTip=document.getElementById("incomeErrTip");
	errTip.innerHTML = '';
}
function checkIncomeMoney(obj)
{
	var income = obj.value;
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	if(reg.test(income))
	{
		hideIncomeErrTip();
		return true;
	}
	else
	{
		showIncomeErrTip(100,"请输入大于零的金额，最多可以输入一位小数！");
		obj.focus();
		return false;
	}
}

function checkIncomePerson(obj)
{
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var inper = obj.value;
	if(reg.test(inper))
	{
		hideIncomeErrTip();
		return true;
	}
	else
	{
		showIncomeErrTip(100,"请输入大于零的人数！");
		obj.focus();
		return false;
	}
}


