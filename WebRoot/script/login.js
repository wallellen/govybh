function login(){
	var account = $("#account").val();
	var password = $("#password").val();
	var vercode = $("#vercode").val();
	if(account=="")
	{
		alert("账号不能为空");
		Form1.account.focus();
		return false;
	}
	if(password=="")
	{
		alert("密码不能为空");
		Form1.password.focus();
		return false;
	}
	if(vercode=="")
	{
		alert("请输入验证码");
		Form1.vercode.focus();
		return false;
	}
	var datajson = {"account":account, "password":password,"vercode":vercode};
	var url = 'ajaxlogin.action';
	$.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: datajson,
        success: responseLogin,
        error: function () {
            //alert(RES.REQUESTWRONG);
        }
    });
}

var responseLogin = function(data, textStatus, jqXHR)
{
	if(data.status=="ok")
	{
		if($("#rememberPass").attr("checked")==true)
		{
			Cookie.setCookie("accountybh",$("#account").val());
			Cookie.setCookie("passwordybh",$("#password").val());
		}
		else
		{
			Cookie.clearCookie("accountybh");	
			Cookie.clearCookie("passwordybh");	
		}
		window.location.href="userAction_home.action";
	}
	else if(data.status=="vercodeerror")
	{
		alert("验证码错误,请重新输入!");
		Form1.vercode.focus();
	}
	else
	{
		alert("账号或密码错误");
	}
	verImg.src = "verCode?"+Math.random();
}

//register
function register()
{
	document.Form2.action="userAction_register.action";
	document.Form2.submit();
}