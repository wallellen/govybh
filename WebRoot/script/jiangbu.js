// JavaScript Document
function popJiangBuEdit(s,r1,t1,t2,t3,t4,t5,t6,t7,v1,v2,v3,b1,hname){
	//title
	var jt = document.getElementById("jtitle");
	jt.innerHTML="";
	//clear
	document.getElementById("tt1").checked=false;
	document.getElementById("tt2").checked=false;
	document.getElementById("tt3").checked=false;
	document.getElementById("tt4").checked=false;
	document.getElementById("tt5").checked=false;
	document.getElementById("tt6").checked=false;
	document.getElementById("tt7").checked=false;
	document.getElementById("tt8").checked=false;
	document.getElementById("vv1").value='';
	document.getElementById("vv2").value='';
	document.getElementById("vv3").value='';
	
	hideJiangErrTip();
	
	if(s=="edit"){
		jt.innerHTML="<font color='#fff'>修改奖补项目信息&nbsp;["+hname+"]</font>";
		if(t1==1){
			document.getElementById("tt1").checked=true;
		}
		if(t2==1){
			document.getElementById("tt2").checked=true;
		}
		if(t3==1){
			document.getElementById("tt3").checked=true;
		}
		if(t4==1){
			document.getElementById("tt4").checked=true;
		}
		if(t5==1){
			document.getElementById("tt5").checked=true;
		}
		if(t6==1){
			document.getElementById("tt6").checked=true;
		}
		if(t7==1){
			document.getElementById("tt7").checked=true;
		}
		if(b1==1){
			document.getElementById("tt8").checked=true;
		}
		document.getElementById("vv1").value=v1;
		document.getElementById("vv2").value=v2;
		document.getElementById("vv3").value=v3;
		
	}else{
		jt.innerHTML="<font color='#fff'>添加奖补项目信息&nbsp;["+hname+"]</font>";
		document.getElementById("vv1").value=0;
		document.getElementById("vv2").value=0;
		document.getElementById("vv3").value=0;
	}
	//批次号
	document.getElementById("rid1").value=r1;
		
	var oWin = document.getElementById("win-jiangbu");
	var oLay = document.getElementById("overlay-jiangbu");
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
function subJiangBuBt(){
	var chkjb = document.getElementsByName("jbchk");
	var s='';
	for(var i=0;i<chkjb.length;i++){
		if(chkjb[i].checked){
			s+='1';
		}else{
			s+='0';
		}
	}
	var vs1 = document.getElementById("vv1").value;
	var vs2 = document.getElementById("vv2").value;
	var vs3 = document.getElementById("vv3").value;
	var vst = parseInt(vs1)+parseInt(vs2)+parseInt(vs3);
	
	if(!checkMoney(document.all.vv1))return;
	if(!checkMoney(document.all.vv2))return;
	if(!checkMoney(document.all.vv3))return;
	
	if(s.indexOf("1")>=0 && vst>0){
		document.getElementById("jbstr").value=s;
		document.jBForm.action="govJiangBuAction_saveJiangBu.do";
		document.jBForm.submit();
	}else{
		alert("至少需要选择一项,且金额大于0");
	}
}
//

function showJiangErrTip(top,c)
{
	var errTip=document.getElementById("jiangErrTip");
	errTip.style.marginLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}

function hideJiangErrTip()
{
	var errTip=document.getElementById("jiangErrTip");
	errTip.innerHTML = '';
}
function checkMoney(obj)
{
	var t = obj.value;
	var reg = /^[0-9]*[0-9][0-9]*$/;
	if(reg.test(t))
	{
		hideJiangErrTip();
		return true;
	}
	else
	{
		showJiangErrTip(175, "请输入大于零的整数");
		obj.focus();
		return false;
	}
}


	