function popXianCreditEdit(s,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13){
	//title
	var xt = document.getElementById("xtitle");
	xt.innerHTML="";
	//clear
	document.getElementById("c0").value='';
	document.getElementById("c1").value='';
	document.getElementById("c2").innerHTML='';
	document.getElementById("c3").innerHTML='';
	document.getElementById("c4").value='';
	document.getElementById("c5").value='';
	document.getElementById("c6").value='';
	document.getElementById("c7").value='';
	document.getElementById("c8").innerHTML='';
	document.getElementById("c9").innerHTML='';
	document.getElementById("c10").value='';
	document.getElementById("c11").value='';
	document.getElementById("c12").value='';
	document.getElementById("c13").value='';
	document.getElementById("xerrortip").innerHTML='';
	
	hideXiaoeErrTip();
	//
	if(s=="edit"){
		xt.innerHTML="<font color='#fff'>修改扶贫小额贷款发放、回收情况</font>";
		document.getElementById("c0").value=1;
		document.getElementById("i_month").value=x1;
		document.getElementById("c1").innerHTML=x1;
		document.getElementById("c2").innerHTML=x2;
		document.getElementById("c3").innerHTML=x3;
		document.getElementById("c4").value=x4;
		document.getElementById("c5").value=x5;
		document.getElementById("c6").value=x6;
		document.getElementById("c7").value=x7;
		document.getElementById("c8").innerHTML=x8;
		document.getElementById("c9").innerHTML=x9;
		document.getElementById("c10").value=x10;
		document.getElementById("c11").value=x11;
		document.getElementById("c12").value=x12;
		document.getElementById("c13").value=x13;
	}else{
		xt.innerHTML="<font color='#fff'>添加扶贫小额贷款发放、回收情况</font>";
		document.getElementById("c0").value=0;
		document.getElementById("i_month").value=x1;
		document.getElementById("c1").innerHTML=x1;
		document.getElementById("c2").innerHTML=x2;
		document.getElementById("c3").innerHTML=x3;
	}
	
	var oWin = document.getElementById("win-credit");
	var oLay = document.getElementById("overlay-credit");
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
function subXianCreditBt()
{
	if(!checkHuInt(document.all.c4))return;
	if(!checkMoney(document.all.c5))return;
	if(!checkHuInt(document.all.c6))return;
	if(!checkMoney(document.all.c7))return;
	if(!checkHuInt(document.all.c10))return;
	if(!checkMoney(document.all.c11))return;
	if(!checkHuInt(document.all.c12))return;
	if(!checkMoney(document.all.c13))return;
	if($("#xiaoErrTip").val().length==0){
		var year = document.getElementById("i_year").value;;
		var month = document.getElementById("i_month").value;
		var tsh = document.getElementById("c4").value;
		var tsv = document.getElementById("c5").value;
		var trh = document.getElementById("c6").value;
		var trv = document.getElementById("c7").value;
		var nh = document.getElementById("c10").value;
		var nv = document.getElementById("c11").value;
		var eh = document.getElementById("c12").value;
		var ev = document.getElementById("c13").value;
		
		var url = "govXianCreditAction_saveXianCredit.do";
		var datajson = {"year":year, "month":month, "tsh":tsh, "tsv":tsv, "trh":trh, "trv":trv, "nh":nh, "nv":nv, "eh":eh, "ev":ev};
		$.ajax({
	        type: "POST",
	        url: url,
	        dataType: "json",
	        data: datajson,
	        success: responseCredit,
	        error: function () {
	            alert("修改失败");
	        }
	    });
	}
}

function responseCredit(data, textStatus, jqXHR)
{
	if(data.status=="ok")
	{
		location.reload();
	}
	else
	{
		document.getElementById("xerrortip").innerHTML=data.status;
	}
}

function autoCalculate1()
{
	//上年(月)余额户数
	var lh = document.getElementById("c2").innerHTML;
	var lv=document.getElementById("c3").innerHTML;
	//本月发放户数
	var tsh = document.getElementById("c4").value;
	var tsv = document.getElementById("c5").value;
	//本月收回户数
	var trh = document.getElementById("c6").value;
	var trv = document.getElementById("c7").value;
	var nh = document.getElementById("c10").value;
	var nv = document.getElementById("c11").value;
	var eh = document.getElementById("c12").value;
	var ev = document.getElementById("c13").value;
	//本月余额户数
	var th = (parseInt(lh)+parseInt(tsh))-parseInt(trh);
	var tv = (parseFloat(lv)+parseFloat(tsv))-parseFloat(trv);
	tv = tv.toFixed(1);
	//未到期贷款户数
	nh = parseInt(th)-parseInt(eh);
	nv = parseFloat(tv)-parseFloat(ev);
	nv = nv.toFixed(1);
	//计算逾期贷款户数
	document.getElementById("c8").innerHTML=th;
	document.getElementById("c9").innerHTML=tv;
	document.getElementById("c10").value=nh;
	document.getElementById("c11").value=nv;
}

function autoCalculate2()
{
	//上年(月)余额户数
	var lh = document.getElementById("c2").innerHTML;
	var lv=document.getElementById("c3").innerHTML;
	//本月发放户数
	var tsh = document.getElementById("c4").value;
	var tsv = document.getElementById("c5").value;
	//本月收回户数
	var trh = document.getElementById("c6").value;
	var trv = document.getElementById("c7").value;
	var nh = document.getElementById("c10").value;
	var nv = document.getElementById("c11").value;
	var eh = document.getElementById("c12").value;
	var ev = document.getElementById("c13").value;
	//本月余额户数
	var th = (parseInt(lh)+parseInt(tsh))-parseInt(trh);
	var tv = (parseFloat(lv)+parseFloat(tsv))-parseFloat(trv);
	tv = tv.toFixed(1);
	//未到期贷款户数
	eh = parseInt(th)-parseInt(nh);
	ev = parseFloat(tv)-parseFloat(nv);
	ev = ev.toFixed(1);
	//计算逾期贷款户数
	document.getElementById("c8").innerHTML=th;
	document.getElementById("c9").innerHTML=tv;
	document.getElementById("c12").value=eh;
	document.getElementById("c13").value=ev;
}

function showXiaoeErrTip(top,c)
{
	var errTip=document.getElementById("xiaoErrTip");
	errTip.style.marginLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}

function hideXiaoeErrTip()
{
	var errTip=document.getElementById("xiaoErrTip");
	errTip.innerHTML = '';
}

function checkHuInt(obj)
{
	document.getElementById("xerrortip").innerHTML='';
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var tsh = obj.value;
	if(reg.test(tsh))
	{
		hideXiaoeErrTip();
		return true;
	}
	else
	{
		showXiaoeErrTip(120,"请输入大于零的户数！");
		obj.focus();
		return false;
	}
}

function checkMoney(obj)
{
	var tsv = obj.value;
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	if(reg.test(tsv))
	{
		hideXiaoeErrTip();
		return true;
	}
	else
	{
		showXiaoeErrTip(120,"请输入大于零的万元金额，最多可以输入一位小数！");
		obj.focus();
		return false;
	}
}

