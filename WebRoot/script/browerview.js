//进入操作 
function viewBMInfo(str){
	document.getElementById("viewBM").value=str;
	document.Form1.action="govBrowerAction_viewArea.do";
	
	document.Form1.submit();
}
//直接进入操作
function directAccess(){
	var dBM = document.getElementById("dirBM").value;
	//向后台发请求, 读取当前属性值
	var url = "govBrowerAction_isDirect.do";
	var datajson = {"bmhm":dBM};
	$.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: datajson,
        success: resDirectInfo,
        error: function () {
            alert("fa");
        }
    });
}	
function resDirectInfo(data, textStatus, jqXHR){
	var dBM = document.getElementById("dirBM").value;
	if(data.status=="bm"){
		document.getElementById("viewBM").value = dBM;
		document.Form1.action="govBrowerAction_homeDirect.do";
		document.Form1.submit();
	}else if(data.status=="hm"){
		location.href="govBrowerAction_viewReportFamily.do?viewBM="+dBM;
	}else{
		alert("您所输入的编码不正确! ");
	}
}
/** 修改 */
function popEditName(n, h, p, b){
	//clear
	document.getElementById("newAreaTips").innerHTML='';
	if(b.length==12){
		document.getElementById("newHtnTips").innerHTML='';
	}
	
	var insBm = document.getElementById("insBm");
	insBm.value=b;
	var oldArea = document.getElementById("oldArea");
	oldArea.innerHTML=n;
	var insName = document.getElementById("insName");
	insName.value=n;
	var insHtn = document.getElementById("insHtn");
	if(insHtn!=null)
		insHtn.value=h;
	var insPtn = document.getElementById("insPtn");
	if(insPtn!=null)
		insPtn.value=p;
	
	var oWin = document.getElementById("win-edit");
	var oLay = document.getElementById("overlay-edit");
	var oClose = document.getElementById("close"); 
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
function subAreaBt(){
	document.areaForm.action="govBrowerAction_edit.do";
	document.areaForm.submit();
}
function addUserInfo(){
	location.href="govBrowerAction_addFamily.do?rtf=home";
}

//check input
function checkinsName(){
	var insName = $("#insName").val();
	if(insName==""){
		$("#newAreaTips").html("新地区名称不能为空");
		areaForm.insName.focus(); 
		return false;
	}else{
		$("#newAreaTips").html("");
		return true;
	}
}
function checkinsHtn(){
	var insHtn = $("#insHtn").val();
	// 正整数
	var pattern = /^[0-9]*[0-9][0-9]*$/;
	flag = pattern.test(insHtn);
	if(insHtn=="" || insHtn==null){
		$("#newHtnTips").html("农户总数不能为空");
		areaForm.insHtn.focus(); 
		return false;
	}else if(!flag){
		$("#newHtnTips").html("请输入大于0的整数！");
		areaForm.insHtn.focus(); 
		return false;
	}else{
		$("#newHtnTips").html("");
		return true;
	}
}

function checkinsPtn(){
	var insPtn = $("#insPtn").val();
	// 正整数
	var pattern = /^[0-9]*[0-9][0-9]*$/;
	flag = pattern.test(insPtn);
	if(insPtn=="" || insPtn==null){
		$("#newPtnTips").html("人口总数不能为空");
		areaForm.insPtn.focus(); 
		return false;
	}else if(!flag){
		$("#newPtnTips").html("请输入大于0的整数！");
		areaForm.insPtn.focus(); 
		return false;
	}else{
		$("#newPtnTips").html("");
		return true;
	}
}

//管理弹出层
function popManager(b){
	//clear
	var isLogon = document.getElementById("isLogon");
	isLogon.checked=false;
	var isEdit = document.getElementById("isEdit");
	isEdit.checked=false;
	var isAudit = document.getElementById("isAudit");
	isAudit.checked=false;
	
	//operCode
	var operCode = document.getElementById("operCode");
	operCode.value=b;
	
	var oWin = document.getElementById("win-manage");
	var oLay = document.getElementById("overlay-manage");
	var oClose = document.getElementById("close-manage"); 
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
	//向后台发请求, 读取当前属性值
	var url = "system/govConfigAction_manage.do";
	var datajson = {"opCode":b};
	$.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: datajson,
        success: resRoleRight,
        error: function () {
            alert("fa");
        }
    });
}

function resRoleRight(data, textStatus, jqXHR){
	var isEdit = document.getElementById("isEdit");
	if(data.e=="1"){
		isEdit.checked=true;
	}else{
		isEdit.checked=false;
	}
}

// 角色权限管理，允许、禁止
function subManageBt(f){
	var isLogon = document.getElementById("isLogon");
	var logon;
	if (isLogon.checked) {
		logon = 1;
	} else {
		logon = 0;
	}
	var isEdit = document.getElementById("isEdit");
	var edit;
	if (isEdit.checked) {
		edit = 1;
	} else {
		edit = 0;
	}
	var isAudit = document.getElementById("isAudit");
	var audit;
	if (isAudit.checked) {
		audit = 1;
	} else {
		audit = 0;
	}
	//alert(logon+","+edit+","+audit+","+f);
	var opCode = document.getElementById("operCode").value;
	var url = "system/govConfigAction_editRole.do";
	var datajson = {"opCode":opCode, "isLogon":logon, "isEdit":edit, "isAudit":audit, "isAllow":f};
	$.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: datajson,
        success: function(){
        	location.reload();
        },
        error: function () {
            alert("fa");
        }
    });
}

// 初始化密码操作 
function initPassword(){
	var opCode = document.getElementById("operCode").value;
	var url = "system/govConfigAction_initPass.do";
	var oWin = document.getElementById("win-manage");
	var oLay = document.getElementById("overlay-manage");
	var datajson = {"opCode":opCode};
	$.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: datajson,
        success: function(){
        	//location.reload();
        	oLay.style.display = "none"; 
			oWin.style.display = "none"
        	alert("密码初始化成功");
        },
        error: function () {
            alert("fail");
        }
    });
}

//删除户主
function popDelFamily(f1,f2)
{
	document.getElementById("delhm").value=f1;
	document.getElementById("delname").innerHTML=f2;
	
	var oWin = document.getElementById("win-delfamily");
	var oLay = document.getElementById("overlay-delfamily");
	var oClose = document.getElementById("close-delfamily"); 
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
function subDelFamilyBt()
{
	document.delFamilyForm.action="govBrowerAction_deleteFamily.do";
	document.delFamilyForm.submit();
}