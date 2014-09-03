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
		showBanfErrTip1(100,"生产经营性收入大于等于零，最多可以输入一位小数！");
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
		showBanfErrTip1(100,"工资性收入大于等于零，最多可以输入一位小数！");
		return false;
	}
}
/** 计算家庭年总纯收入 */
function income_sum()
{
	var v1=$("#incId1").val();		//生产经营性收入
	var v2=$("#incId2").val();		//工资性收入
	var v12=$("#incId12").val();	//流转耕地租金
	var v4=$("#incId4")[0].innerHTML;	//各类补贴性收入
	
	if(v1>=0 && v2>=0 && v4>=0 && v12>=0)
	{
		var v = parseFloat(v1)+parseFloat(v2)+parseFloat(v4)+parseFloat(v12);
		in_total.innerHTML=v.toFixed(1);
		var rks = renkou.value;
		if(null==rks || rks==0){
			rks=1;
		}
		var rj = v/rks;
		$("#rj_income")[0].innerHTML=rj.toFixed(1);
	}
}


/** 计算各类补贴性收入其中的总数 */
function income_inbz(){
	var vt;
	var v5=$("#incId5").val();
	var v6=$("#incId6").val();
	var v7=$("#incId7").val();
	var v8=$("#incId8").val();
	var v9=$("#incId9").val();
	var v10=$("#incId10").val();
	var v11=$("#incId11").val();
	
	if(v5>=0 && v6>=0 && v7>=0 && v8>=0 && v9>=0 && v10>=0 && v11>=0){
		vt = parseFloat(v5)+parseFloat(v6)+parseFloat(v7)+parseFloat(v8)+parseFloat(v9)+parseFloat(v10)+parseFloat(v11);
	}else{
		vt = 0;
	}
	return vt;
}

/** 计算各类补贴性收入 */
function income_inbz_total(){
	$("#incId4")[0].innerHTML=income_inbz();	//各类补贴性收入
}

//种粮补助
function checkZlbz(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"种粮补助大于等于零，最多可以输入一位小数！");
		return false;
	}
}

//领取低保、五保金
function checkDibao(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"领取低保、五保金大于等于零，最多可以输入一位小数！");
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
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"领取残疾补助金大于等于零，最多可以输入一位小数！");
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
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"领取新农合报销医疗费大于等于零，最多可以输入一位小数！");
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
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"领取养老金大于等于零，最多可以输入一位小数！");
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
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"领取医疗救助金大于等于零，最多可以输入一位小数！");
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
		hideBanfErrTip1();
		income_inbz_total();
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"领取其他补助金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
//(3)流转耕地租金
function checkLiuzhuan(obj)
{
	var reg = /^[0-9]+([.]{1}[0-9]{1})?$/;
	var item = obj.value;
	if(reg.test(item))
	{
		hideBanfErrTip1();
		//获取财产性收入
		$("#incId3")[0].innerHTML=item;
		income_sum();
		return true;
	}
	else
	{
		showBanfErrTip1(100,"流转耕地租金大于等于零，最多可以输入一位小数！");
		return false;
	}
}



/******* 4、家庭年总纯收入 end ********/
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
		showBanfErrTip1(500,"省级扶贫资金大于等于零，最多可以输入一位小数！");
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
		showBanfErrTip1(500,"市、县级扶贫资金大于等于零，最多可以输入一位小数！");
		return false;
	}
}
function bangfu_sum()
{
	if(incId13.value>0 && incId14.value>0)
	{
		var v = parseFloat(incId13.value) + parseFloat(incId14.value);
		bf_total.innerHTML=v.toFixed(1);
	}
}
/******* 8、得到帮扶资金 end ********/


/******* 9、使用小额扶贫贷款数量 start ********/
//使用小额扶贫贷款数量
function checkXe(obj)
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
		showBanfErrTip1(500,"使用小额扶贫贷款数量大于等于零，最多可以输入一位小数！");
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
//(8)其它项目
function selectFs8(obj)
{
	var fsbox8 = document.getElementById("fsbox8");
	if(obj.checked)
	{
		fsbox8.value=1;
	}
	else
	{
		fsbox8.value=0;
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
	if(!checkZlbz(document.all.incId5)) return;
	if(!checkDibao(document.all.incId6)) return;
	if(!checkIsv1(document.all.incId7)) return;
	if(!checkIsv2(document.all.incId8)) return;
	if(!checkIsv3(document.all.incId9)) return;
	if(!checkIsv4(document.all.incId10)) return;
	if(!checkIsv5(document.all.incId11)) return;
	if(!checkLiuzhuan(document.all.incId12)) return;
	if(!checkVv1(document.all.incId13)) return;
	if(!checkVv2(document.all.incId14)) return;
	if(!checkXe(document.all.incId15)) return;
	
	
	document.form1.action="ybhManageAction_saveIncome.action";
	document.form1.submit();
}

//////////////////////////////////////////////////////////////////
