function showBanfErrTip(top,c)
{
	var errTip=document.getElementById("errTip1");
	errTip.style.paddingLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}
function hideBanfErrTip()
{
	var errTip=document.getElementById("errTip1");
	errTip.innerHTML = '';
}
/******* 村基本情况 start ********/
//总农户数
function checkHnt(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		updata_avg();
		return true;
	}
	else
	{
		showBanfErrTip(142,"总农户数大于等于零");
		//obj.focus();
		return false;
	}
	
}
//总人口数
function checkRnt(obj)
{
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(142,"总人口数大于等于零");
		//obj.focus();
		return false;
	}
}
//总劳动力数
function checkLnt(obj)
{
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(142,"总劳动力数大于等于零");
		//obj.focus();
		return false;
	}
}

//承包耕地总面积
function checkFt(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(142,"承包耕地总面积大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}

//村农民人均纯收入
function checkInpersonal(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(142,"村农民人均纯收入大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}

//村集体经营性收入
function checkInjy(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(142,"村集体经营性收入大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
//村集体负债总额
function checkFze(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(142,"村集体负债总额大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
/******* 村基本情况 end ********/

/******* 建档立卡低收入农户基本情况 start ********/
//总户数
function checkHnl(obj)
{
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(520,"总户数大于等于零");
		//obj.focus();
		return false;
	}
}
//总人口
function checkRnl(obj)
{
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(520,"总人口大于等于零");
		//obj.focus();
		return false;
	}
}
//总劳动力
function checkLnl(obj)
{
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(520,"总劳动力大于等于零");
		//obj.focus();
		return false;
	}
}
//承包耕地总面积
function checkFl(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip();
		return true;
	}
	else
	{
		showBanfErrTip(520,"承包耕地总面积大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
/******* 建档立卡低收入农户基本情况 end ********/


////////////////////////////// tip2分隔  ////////////////////////////////////
function showBanfErrTip2(top,c)
{
	var errTip=document.getElementById("errTip2");
	errTip.style.paddingLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}
function hideBanfErrTip2()
{
	var errTip=document.getElementById("errTip2");
	errTip.innerHTML = '';
}



/******* 扶贫资金落实情况 start ********/
//其中：(1)省级扶贫资金
function checkFpv1(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip2();
		getFupinzj();
		return true;
	}
	else
	{
		showBanfErrTip2(450,"省级扶贫资金大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
//(2)市、县级扶贫资金
function checkFpv2(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip2();
		getFupinzj();
		return true;
	}
	else
	{
		showBanfErrTip2(450,"市、县级扶贫资金大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}

//计算针对经济薄弱村扶贫资金落实数
function getFupinzj()
{
	if(cunId12.value>0 && cunId13.value>0)
	{
		var v = parseFloat(cunId12.value)+parseFloat(cunId13.value);
		fupinzj.innerHTML = v.toFixed(1);
	}
}

/******* 扶贫资金落实情况 end ********/

////////////////////////////tip2分隔  ////////////////////////////////////
function showBanfErrTip3(top,c)
{
	var errTip=document.getElementById("errTip3");
	errTip.style.paddingLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}
function hideBanfErrTip3()
{
	var errTip=document.getElementById("errTip3");
	errTip.innerHTML = '';
}
/******* 扶贫小额贷款使用情况 start ********/

//全村使用贷款农户总数
function checkHndt(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(142,"全村使用贷款农户总数大于等于零");
		//obj.focus();
		return false;
	}
}
//其中：建档立卡农户数
function checkNhdl(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(142,"建档立卡农户数大于等于零");
		//obj.focus();
		return false;
	}
}
//全村农户使用贷款总量
function checkVdt(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		updata_avg();
		return true;
	}
	else
	{
		showBanfErrTip3(142,"全村农户使用贷款总量为大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
function updata_avg()
{
	//
	if(cunId1.value>0 &&cunId18.value>0)
	{
		var v=cunId18.value/cunId1.value;
		qchjdk.innerHTML=v.toFixed(1);
		cunId22.value=v.toFixed(1);
	}
}
//其中：建档立卡低收入农户
function checkVdtl(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(142,"建档立卡低收入农户大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
//全村户均贷款额度
function checkVdpt(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(142,"全村户均贷款额度大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
/******* 扶贫小额贷款使用情况 end ********/
/******* 建档立卡低收入农户参加主要社会保障情况 start ********/
//参加新农合
function checkB1(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(450,"参加新农合大于等于零");
		//obj.focus();
		return false;
	}
}
//参加新农保
function checkB2(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(450,"参加新农保大于等于零");
		//obj.focus();
		return false;
	}
}
//参加大病医疗救助
function checkB3(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(450,"参加大病医疗救助大于等于零");
		//obj.focus();
		return false;
	}
}
//参加或享受其它保障
function checkB4(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(450,"参加或享受其它保障大于等于零");
		//obj.focus();
		return false;
	}
}
//未参加或享受任何保障
function checkNb(obj){
	var reg = /^[0-9]*[0-9][0-9]*$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		return true;
	}
	else
	{
		showBanfErrTip3(450,"未参加或享受任何保障大于等于零");
		//obj.focus();
		return false;
	}
}
/******* 建档立卡低收入农户参加主要社会保障情况 end ********/

/******* 选中 扶贫项目落实情况 start ********/
function selectFps1(obj)
{
	var chbox1 = document.getElementById("chbox1");
	if(obj.checked)
	{
		chbox1.value=1;
		
	}
	else
	{
		chbox1.value=0;
	}
	changechk_fps();
}
function selectFps2(obj)
{
	var chbox2 = document.getElementById("chbox2");
	if(obj.checked)
	{
		chbox2.value=1;
	}
	else
	{
		chbox2.value=0;
	}
	changechk_fps();
}
//
function selectFps3(obj)
{
	//var chbox3 = document.getElementById("chbox3");
	if(obj.checked)
	{
		chbox3.value=1;
	}
	else
	{
		chbox3.value=0;
	}
	changechk_fps();
}
function changechk_fps()
{
	var fps_name = document.getElementsByName("chk_fps_name");
	chk_fps.checked=false;
	for(var i=0; i<fps_name.length; i++)
	{
		
		if(fps_name[i].checked)
		{
			chk_fps.checked=true;
		}
	}
}
/******* 选中 扶贫项目落实情况 end ********/

function saveCunBt()
{
	//
	if(!checkHnt(document.all.cunId1)) return;
	if(!checkRnt(document.all.cunId3)) return;
	if(!checkLnt(document.all.cunId5)) return;
	if(!checkFt(document.all.cunId7)) return;
	if(!checkInpersonal(document.all.cunId9)) return;
	if(!checkInjy(document.all.cunId10)) return;
	if(!checkFze(document.all.cunId11)) return;
	//
	if(!checkHnl(document.all.cunId2)) return;
	if(!checkRnl(document.all.cunId4)) return;
	if(!checkLnl(document.all.cunId6)) return;
	if(!checkFl(document.all.cunId8)) return;
	//
	if(!checkFpv1(document.all.cunId12)) return;
	if(!checkFpv2(document.all.cunId13)) return;
	//
	if(!checkHndt(document.all.cunId14)) return;
	if(!checkNhdl(document.all.cunId16)) return;
	if(!checkVdt(document.all.cunId18)) return;
	if(!checkVdtl(document.all.cunId20)) return;
	//if(!checkVdpt(document.all.cunId22)) return;
	//
	if(!checkB1(document.all.cunId15)) return;
	if(!checkB2(document.all.cunId17)) return;
	if(!checkB3(document.all.cunId19)) return;
	if(!checkB4(document.all.cunId21)) return;
	if(!checkNb(document.all.cunId23)) return;
	document.form1.action="yearDataAction_saveCunYbh.action";
	document.form1.submit();
}

