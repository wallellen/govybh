/** add report **/
function popReport(s,p1,p2,p3,p4,p5,p6){
	
	//title
	var pt = document.getElementById("ptitle");
	pt.innerHTML="";
	
	document.getElementById("p1").value='';
	document.getElementById("p2").value='';
	document.getElementById("p3").value='';
	document.getElementById("p4").value='';
	document.getElementById("p5").checked=false;
	document.getElementById("p6").checked=false;
	document.getElementById("showcode").innerHTML='';
	
	if(s=="edit"){
		pt.innerHTML="<font color='#fff'>修改报告信息</font>";
		document.getElementById("p1").style.display='block';
		document.getElementById("showcode").innerHTML='代码:&nbsp;&nbsp;';
		document.getElementById("p1").value=p1;
		document.getElementById("p1").readOnly=true;
		document.getElementById("p2").value=p2;
		document.getElementById("p3").value=p3;
		document.getElementById("p4").value=p4;
		if(p5==1){
			document.getElementById("p5").checked=true;
		}
		if(p6==1){
			document.getElementById("p6").checked=true;
		}
	}else{
		pt.innerHTML="<font color='#fff'>添加报告信息</font>";
		document.getElementById("p1").style.display='none';
		document.getElementById("showcode").innerHTML='';
	}
	
	
	var oWin = document.getElementById("win-report");
	var oLay = document.getElementById("overlay-report");
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
function subReportBt(){
	var chp = document.getElementsByName("chkp");
	var s='';
	for(var i=0;i<chp.length;i++){
		if(chp[i].checked){
			s+='1';
		}else{
			s+='0';
		}
	}
	document.getElementById("isde").value=s;
	document.reportForm.action="sysReportAction_saveReport.do";
	var title = document.getElementById("p2");
	var sdt = document.getElementById("p3");
	var edt = document.getElementById("p4");
	if(title.value==''){
		alert("标题不能为空!");
	}else if(sdt.value==''){
		alert("开始日期不能为空!");
	}else if(edt.value==''){
		alert("结束日期为空!");
	}else{
		document.reportForm.submit();
	}
}
