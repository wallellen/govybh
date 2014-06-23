<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>电子菜单管理系统</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/layout.css"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/register.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
</head>
<body>
<div id="container">
	<!-- header -->
  	<div id="header">
  		<div class="title1"><s:property value="product"/></div>
  		<div class="title2"><s:property value="customer"/></div>
  		<div class="title3"><s:property value="provider"/></div>
    </div>
    <!-- nav -->
  	<div id="nav">
    	<div class="nav-left">
    		<div style="float:left">
    		<span>用户注册</span>
    		</div>
        </div>
    </div>
    <!-- register success -->
    <div id="regsuccess" class="tc01" style="display: none;">
    	<div class="tc_tit">
    		注册成功
			<div class="tc_close">
				<img onclick="regclose();" src="${pageContext.request.contextPath }/img/tc_close.png"></img>
			</div>
    	</div>
    	<div class="tc_con">
    		<div class="tc_l01">
    			<img src="${pageContext.request.contextPath }/img/right.jpg"></img>
    		</div>
    		<div class="tc_r01">
    			恭喜您注册成功！<br/><br/>
    			<button class="logon_btn" type="button" onclick="location.href='index.action'"></button>
    		</div>
    		<div class="cboth"></div>
    	</div>
    </div>
    <!-- register -->
    <div id="register">
    	<div class="con_tit">
    		注册电子菜单
    		<div class="con_tit_r"></div>
    	</div>
    	<div class="con_con">
    		<div class="login_con">
    				<div class="login_l">
    					<div class="iti">账号：</div>
						<div class="con">
						<input id="account" class="login_input" type="text" name="account" onblur="checkAccount()"></input>
						<span id="accountNote"></span>
						</div>
						<div class="result">
							<img id="tipaccimgerr" src="${pageContext.request.contextPath }/img/wrong.png" style="display:none;"></img>
							<img id="tipaccimg" src="${pageContext.request.contextPath }/img/right.png" style="display:none;"></img>
						</div>
						<div class="cboth"></div>
						
						<div class="iti">密码：</div>
						<div class="con">
						<input id="password" class="login_input" type="password" name="password" onblur="checkPassword()"></input>
						<span id="passwordNote"></span>
						</div>
						<div class="result">
							<img id="tippasimgerr" src="${pageContext.request.contextPath }/img/wrong.png" style="display:none;"></img>
							<img id="tippasimg" src="${pageContext.request.contextPath }/img/right.png" style="display:none;"></img>
						</div>
						<div class="cboth"></div>
						
						<div class="iti">注册码：</div>
						<div class="con">
						<input id="mac" class="login_input" type="text" name="mac"></input>
						<span id="macNote"></span>
						</div>
						<div class="result">
							<img id="tipimgerr" src="${pageContext.request.contextPath }/img/wrong.png" style="display:none;"></img>
							<img id="tipimg" src="${pageContext.request.contextPath }/img/right.png" style="display:none;"></img>
						</div>
						<div class="cboth"></div>
						
						
						<!--  
						<div class="iti">验证码：</div>
						<div class="con">
						<input id="securityCode" class="login_input" type="text" name="securityCode"></input>
						<span id="codeNote"></span>
						</div>
						<div class="yzm">
						<img id="vcodePic" class="form-vcode" onclick="switchImg()" src="http://www.uxin.com/captcha.html" style="cursor:pointer" alt="点击更换验证码"></img>
						</div>
						<div class="cboth"></div>
						-->
						
						<div class="iti"></div>
						<div class="con">
						<button id="zhuce_btn" class="zhuce_btn" type="button" onclick="checkForm()"></button>
						</div>
						<div class="cboth"></div>
    				</div>
	    		<div class="login_r">
	    			<div class="login_r_js">
	    			已有电子菜单帐号？ <br>
	    			<a href="index.action">立即登录</a>
	    			</div>
	    		</div>
				<div class="cboth"></div>
    		</div>
    	</div>
    	<div class="con_fot">
    	<div class="con_fot_r"></div>
    	</div>
    </div>
   
   	<!-- footer -->
  	<div id="footer">
        <p>
        <a href="#">设为首页</a>&nbsp;|&nbsp;
        <a href="#">收藏本站</a>&nbsp;|&nbsp;
        <a href="#">联系我们</a>&nbsp;|&nbsp;
        <a href="#">帮助中心</a>&nbsp;|&nbsp;
        <a href="#">常见问题</a>
        <!-- 记录js分页当前页码 -->
        <input type="hidden" id="globalCurPage"/>
        </p>
        <span>Copyright @ 2005-2014 All Rights Reserved 版权所有 · 南京威帝通讯科技有限公司&nbsp;&nbsp;V140531</span>
    </div>
</div> 
<script type="text/javascript">
	$(function(){
		$("#account").click(function(){$("#accountNote").html('');});
		$("#account").focus();
	});
	//关闭注册成功提示
	function regclose()
	{
	   $("#regsuccess").hide();
	}
	
	function switchImg() {
	    var date = new Date();
	    $("#vcodePic").attr("src","http://www.uxin.com/captcha/index.html?t=" + date.getTime());
	    $("#securityCode").focus();
	}  
	
	function checkAccount()
	{
		$("#accountNote").html('');
		var account = $.trim($("#account").val());
	    if(account=='')
	    {
	    	$("#tipaccimgerr").show();
	    	$("#tipaccimg").hide();
	        return false;
	    }
	    else
	    {
	    	$("#tipaccimgerr").hide();
	    	$("#tipaccimg").show();
	    	return true;
	    }
	}

	function checkPassword()
	{
		$("#passwordNote").html('');
		var password = $.trim($("#password").val());
	    if(password=='')
	    {
	    	$("#tippasimgerr").show();
	    	$("#tippasimg").hide();
	        return false;
	    }
	    else
	    {
	    	$("#tippasimgerr").hide();
	    	$("#tippasimg").show();
	    	return true;
	    }
	}
	    /*
	    var url = 'http://www.uxin.com/registerformobile/isreg'; 
	    $.post(url,{'phone':username},function(rs){
	        if(rs==1){
	        	$("#tipimg").show();
	        	$("#tipimgerr").hide(); 
	        }
	        else
	        {
	        	$("#tipimg").hide();
	        	$("#tipimgerr").show();
	        	$("#accountNote").html("该手机号已经注册,请选择 <a href='http://www.uxin.com/login.html'>登录</a> 或<a href='http://www.uxin.com/login/findpwd.html'> 找回密码</a>");
	        }
	    })  
	    */
	

	function checkForm()
	{
	    var account = $.trim($("#account").val());
	    var password = $.trim($("#password").val());
	    var mac = $.trim($("#mac").val());
	    
	    if(account=='')
	    {
	    	$("#accountNote").html('账号必须填写！');
	       	$("#account").focus();
	        return false;
	    }
	    if(password=='')
	    {
	    	$("#passwordNote").html('密码必须填写！');
	       	$("#password").focus();
	        return false;
	    }

		url= "userAction_registerInfo.action";
		var datajson = {"account":account, "password":password,"mac":mac};
		$.ajax({
	        type: "POST",
	        url: url,
	        dataType: "json",
	        data: datajson,
	        success: resRegister,
	        error: function () {
	            //alert(RES.REQUESTWRONG);
	        }
	    });
		
	    return false;
	}
	
	var resRegister = function(data, textStatus, jqXHR)
	{
		if(data.status=="-1")
		{
			alert("账号已存在")
		}
		else if(data.status=="-2")
		{
			alert("设备注册码错误");	
		}
		else
		{
			$("#regsuccess").show();
		}
	
	}
		
	/*
	function checkForm()
	{
	    var account = $.trim($("#account").val());
	    var password = $.trim($("#password").val());
	    
	    if(account=='')
	     {
	    	$("#accountNote").html('账号必须填写！');
	       	$("#account").focus();
	        return false;
	    }
	    if(password=='')
	     {
	    	$("#passwordNote").html('密码必须填写！');
	       	$("#password").focus();
	        return false;
	    }

		url= "userAction_registerInfo.action";
		$.post(url,{
	        "account":account,
	        "password":password
	        },
	        function(rs){
            	$("#regsuccess").show();	
				}
	        }
	    )
	    var checkcode = $.trim($("#securityCode").val());
	    var invitedby = $.trim($("#invitedby").val());	
	    var forgetpwd=$.trim($("#forgetpwd").val());
	    if($("#agree").attr("checked")==false)
	    {
	        $("#accountNote").html('注册前请先阅读服务条款！');
	        $("#agree").focus();
	        return false;
	    }
	    if(checkcode==''){
	        $("#codeNote").html('验证码必须填写！');
	        $("#securityCode").focus();
	        return false;
	    }
		
	    url = 'http://www.uxin.com/registerformobile.html';
	    $('#zhuce_btn').attr('disabled','disabled'); 
	    $.post(url,{
	        "username":username,
	        "checkcode":checkcode,
	        "invitedby":invitedby,
	        "forgetpwd":forgetpwd,
	        'act':"",
	        'mark':""
	        },
	        function(rs){
				
				if(rs=='markets')
				{
					window.location.href='http://www.uxin.com/act/gift.html?mark=market';
				}	
				else
				if(rs=='single')
				{
					window.location.href='http://www.uxin.com/act/single.html';
				}	
				else
				{
		            if(rs=='1')
			        {
		            	$("#regsuccess").show();	
		            }else{
		                alert(rs);
		                switchImg();
		            }
				}
	        }
	    )
	    return false;
	}
	*/
</script>
</body>
</html>
