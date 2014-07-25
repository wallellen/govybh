function checkDiqubm(obj)
{
	var dqbm = obj.value;
	var irbm = rbms.value;
	var reg = /^[0-9]*$/;
	var xmt = document.getElementById("xmTip");
	var bmStart = dqbm.indexOf(irbm);
	if(dqbm=="" || !reg.test(dqbm))
	{
		xmTip.innerHTML="请输入地区编码";
		xmt.className="xm_tip_err";
		return false;
	}
	else if(bmStart==-1){
		//地区编码不是以rbm开头
		xmTip.innerHTML="只能初始化["+irbm+"]下级地区编码的密码";
		xmt.className="xm_tip_err";
		return false;
	}
	else
	{
		xmTip.innerHTML="";
		xmt.className="xm_tip_ok";
		return true;
	}
	
}

function initPassword()
{
	if(!checkDiqubm(document.all.dqbm)) return;
	if(confirm("确定要初始化密码吗？")){
		var dqbm = $("#dqbm").val();
		var url = "initPassAction_initPassword.action";
		var datajson = {"dqbm":dqbm};
		$.ajax({
			type: "POST",
			url: url,
			dataType: "json",
			data: datajson,
			success: function(){
				alert("成功 ！");
		  	},
		  	error: function () {
		  		alert("失败 ！");
		  	}
	    });
	}
}