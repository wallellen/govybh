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
		return true;
	}
	else
	{
		showBanfErrTip1(142,"家庭经营性收入大于等于零，最多可以输入一位小数！");
		obj.focus();
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
		return true;
	}
	else
	{
		showBanfErrTip1(142,"工资性收入大于等于零，最多可以输入一位小数！");
		obj.focus();
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
		return true;
	}
	else
	{
		showBanfErrTip1(142,"财产性及转移性收入大于等于零，最多可以输入一位小数！");
		obj.focus();
		return false;
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
		return true;
	}
	else
	{
		showBanfErrTip1(520,"省级扶贫资金大于等于零，最多可以输入一位小数！");
		obj.focus();
		return false;
	}
}
//(1)市、县级扶贫资金
function checkVv2(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		return true;
	}
	else
	{
		showBanfErrTip1(520,"市、县级扶贫资金大于等于零，最多可以输入一位小数！");
		obj.focus();
		return false;
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
		obj.focus();
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

//
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

function saveYearDataBt()
{
	if(!checkInjy(document.all.incId1)) return;
	if(!checkInwork(document.all.incId2)) return;
	if(!checkIncz(document.all.incId3)) return;
	if(!checkVv1(document.all.incId4)) return;
	if(!checkVv2(document.all.incId5)) return;
	if(!checkXe(document.all.incId6)) return;
	document.form1.action="yearDataAction_saveIncome.action";
	document.form1.submit();
}



