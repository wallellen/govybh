function showBanfErrTip1(top,c)
{
	var errTip=document.getElementById("errTip1");
	errTip.style.paddingLeft=top+"px";
	errTip.style.display="";
	errTip.innerHTML = c;
}
function hideBanfErrTip1()
{
	var errTip=document.getElementById("errTip1");
	errTip.innerHTML = '';
}
/******* 4、家庭年总纯收入 start ********/
//其中:(1)家庭经营性收入
function checkInjy(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(142,"家庭经营性收入大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
//(2)工资性收入
function checkInwork(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(142,"工资性收入大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
//(3)财产性及转移性收入
function checkIncz(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(142,"财产性及转移性收入大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
function income_sum()
{
	if(incId1.value>0 && incId2.value>0 && incId3.value>0)
	{
		var v = parseFloat(incId1.value) + parseFloat(incId2.value) + parseFloat(incId3.value);
		in_total.innerHTML=v.toFixed(1);
		var rks = renkou.value;
		if(null==rks || rks==0){
			rks=1;
		}
		var rj = v/rks;
		rj_income.innerHTML=rj.toFixed(1);
	}
}


/******* 4、家庭年总纯收入 end ********/

/******* 8、得到帮扶资金 start ********/
//(1)省级扶贫资金
function checkVv1(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		bangfu_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(520,"省级扶贫资金大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
//(2)市、县级扶贫资金
function checkVv2(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		bangfu_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(520,"市、县级扶贫资金大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
function bangfu_sum()
{
	if(incId4.value>0 && incId5.value>0)
	{
		var v = parseFloat(incId4.value) + parseFloat(incId5.value);
		bf_total.innerHTML=v.toFixed(1);
	}
}
/******* 8、得到帮扶资金 end ********/

//////////////////////////////tip2分隔  ////////////////////////////////////
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
/******* 9、使用小额扶贫贷款数量 start ********/
//使用小额扶贫贷款数量
function checkXe(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip2();
		return true;
	}
	else
	{
		showBanfErrTip2(520,"使用小额扶贫贷款数量大于等于零，最多可以输入一位小数！");
		//obj.focus();
		return false;
	}
}
/******* 9、使用小额扶贫贷款数量 end ********/

/******* 7、享受扶贫项目支持情况 start ********/
//(1)产业发展项目
function selectFs1(obj)
{
	var fsbox1 = document.getElementById("fsbox1");
	if(obj.checked)
	{
		fsbox1.value=1;
	}
	else
	{
		fsbox1.value=0;
	}
	changechk_fs();
}
//(2)帮助就业项目
function selectFs2(obj)
{
	var fsbox2 = document.getElementById("fsbox2");
	if(obj.checked)
	{
		fsbox2.value=1;
	}
	else
	{
		fsbox2.value=0;
	}
	changechk_fs();
}
//(3)小额扶贫贷款项目
function selectFs3(obj)
{
	var fsbox3 = document.getElementById("fsbox3");
	if(obj.checked)
	{
		fsbox3.value=1;
	}
	else
	{
		fsbox3.value=0;
	}
	changechk_fs();
}
//(4)入股收益分红类项目
function selectFs4(obj)
{
	var fsbox4 = document.getElementById("fsbox4");
	if(obj.checked)
	{
		fsbox4.value=1;
	}
	else
	{
		fsbox4.value=0;
	}
	changechk_fs();
}
//(5)其它项目
function selectFs5(obj)
{
	var fsbox5 = document.getElementById("fsbox5");
	if(obj.checked)
	{
		fsbox5.value=1;
	}
	else
	{
		fsbox5.value=0;
	}
	changechk_fs();
}
function changechk_fs()
{
	var fs_name = document.getElementsByName("chk_fs_name");
	chk_fs.checked=false;
	for(var i=0; i<fs_name.length; i++)
	{
		if(fs_name[i].checked)
		{
			chk_fs.checked=true;
		}
	}
}
/******* 7、享受扶贫项目支持情况 end ********/

/******* 10、参加社会保障情况 start ********/
//(1)新农合
function selectBb1(obj)
{
	var bbox1 = document.getElementById("bbox1");
	if(obj.checked)
	{
		bbox1.value=1;
	}
	else
	{
		bbox1.value=0;
	}
	changechk_bb();
}
//(1)新农保
function selectBb2(obj)
{
	var bbox2 = document.getElementById("bbox2");
	if(obj.checked)
	{
		bbox2.value=1;
	}
	else
	{
		bbox2.value=0;
	}
	changechk_bb();
}
//(1)大病医疗救助
function selectBb3(obj)
{
	var bbox3 = document.getElementById("bbox3");
	if(obj.checked)
	{
		bbox3.value=1;
	}
	else
	{
		bbox3.value=0;
	}
	changechk_bb();
}
//(1)未参加或享受任何保障
function selectBb4(obj)
{
	var bbox4 = document.getElementById("bbox4");
	if(obj.checked)
	{
		bbox4.value=1;
	}
	else
	{
		bbox4.value=0;
	}
	changechk_bb();
}
function changechk_bb()
{
	var bb_name = document.getElementsByName("chk_bb_name");
	chk_bb.checked=false;
	for(var i=0; i<bb_name.length; i++)
	{
		if(bb_name[i].checked)
		{
			chk_bb.checked=true;
		}
	}
}
/******* 10、参加社会保障情况 start ********/

function saveIncomeBt()
{
	if(!checkInjy(document.all.incId1)) return;
	if(!checkInwork(document.all.incId2)) return;
	//if(!checkIncz(document.all.incId3)) return;
	if(!checkVv1(document.all.incId4)) return;
	if(!checkVv2(document.all.incId5)) return;
	if(!checkXe(document.all.incId6)) return;
	if(!checkZlbz(document.all.zlbz)) return;
	if(!checkLzzj(document.all.lzzj)) return;
	if(!checkIsv1(document.all.isv1)) return;
	if(!checkIsv2(document.all.isv2)) return;
	if(!checkIsv3(document.all.isv3)) return;
	if(!checkIsv4(document.all.isv4)) return;
	if(!checkIsv5(document.all.isv5)) return;
	
	
	document.form1.action="ybhManageAction_saveIncome.action";
	document.form1.submit();
}

//////////////////////////////////////////////////////////////////

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

//种粮补助
function checkZlbz(obj)
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
		showBanfErrTip3(142,"种粮补助大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//流转租金
function checkLzzj(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip3();
		$("#incId3").val(item);
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip3(520,"流转租金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//领取残疾补助金
function checkIsv1(obj)
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
		showBanfErrTip3(142,"领取残疾补助金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//领取新农合报销医疗费
function checkIsv2(obj)
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
		showBanfErrTip3(520,"领取新农合报销医疗费大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//领取养老金
function checkIsv3(obj)
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
		showBanfErrTip3(142,"领取养老金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//领取医疗救助金
function checkIsv4(obj)
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
		showBanfErrTip3(520,"领取医疗救助金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//领取其他补助金
function checkIsv5(obj)
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
		showBanfErrTip3(142,"领取其他补助金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
