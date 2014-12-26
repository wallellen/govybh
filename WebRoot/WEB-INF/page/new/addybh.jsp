<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/global_cn.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<style type="text/css">
				
		/** form table */
		
		.lab_ipt_item{height:28px; line-height:28px; margin:8px 0px;}
		.lab100{width:100px; height:28px; padding-right:4px; text-align:right; float:left;}
		.lab120{width:120px; height:28px; padding-right:4px; text-align:right; float:left;}
		.lab150{width:150px; height:28px; padding-right:4px; text-align:right; float:left;}
		.ipt-box{color: #000; height: 28px; float:left;}
		.ipt-box-hei{color:#000; width:260px; overflow-y:auto; max-height:100px;}
		.ipt_text_w150{padding:4px 2px; width:150px; height:18px; line-height:18px;border: 1px solid #B8B8B8; background: none repeat scroll 0% 0% #FFF;  color:#000; font-size:12px; margin-right:10px;}
		.ipt_text_w180{padding:4px 2px; width:180px; height:18px; line-height:18px;border: 1px solid #B8B8B8; background: none repeat scroll 0% 0% #FFF;  color:#000; font-size:12px; margin-right:10px;}
		.asterisk{color:#F00;}
		.ipt_textarea_w300{width:300px; height:122px; overflow:hidden; resize:none;}
		
		
		
		/* db */
		#dbCon{width:866px; height:669px; border:0px solid #3B9FFF; margin-top:1px;}
		.db-info{width:420px; height:320px; margin:5px 0 0 200px;; line-height:30px; padding:0px 0 0 40px;  border-radius:3px; border:1px solid #3B9FFF;}
		.db-info table{width:360px; line-height:20px; text-align:center; border-right:1px solid #3B9FFF; border-bottom:1px solid #3B9FFF;}
		.db-info table td{border-left:1px solid #3B9FFF; border-top:1px solid #3B9FFF;}
		.db-info .tabtr1{background:url(../images/tab-head.jpg) repeat-x; height:20px;}
		.db-info .tabtd1{border-right:0px solid red;}
		
		.db-index{width:400px; height:40px; line-height:40px;}
		.db-index li{float:left; margin-right:5px;}
		
		.sys_init_info{width:420px; height:400px; margin:5px 0 0 200px;; line-height:30px; padding:0px 0 0 40px; border-radius:3px; border:1px solid #3B9FFF;}
		.sys_param_info{width:420px; height:140px; margin:5px 0 0 200px;; line-height:30px; padding:0px 0 0 40px; border-radius:3px; border:1px solid #3B9FFF;}
		
		/* h */
		.h3_title{width:100%; height:26px; line-height:26px; text-align:center; color:#8F2629; font-size:14px; font-weight:bold;}
		.h3_title span{float:right; width:180px; font-size:12px; color:#000; font-weight:normal;}
		.h3_title a{color:#00f;}
				
	</style>
</head>
<body style="background:#E0EEFB;">
	<div id="dbCon">
		<h3 class="h3_title" style="margin-top:60px;">添加样本户</h3>
		<div class="sys_param_info">
	        <div class="lab_ipt_item">
		    	<span class="lab120">农户编码：</span>
		        <div class="ipt-box">
		        	<input type="text" id="hmx" name="hm" maxlength="15" class="ipt_text_w150 inputDefault" />
		            <span class="asterisk"></span>
		        </div>
		    </div>
		    <div class="lab_ipt_item">
		    	<span class="lab120">姓名：</span>
		        <div class="ipt-box">
		        	<input type="text" id="hnamex" name="hname" maxlength="20" class="ipt_text_w150 inputDefault" />
		            <span class="asterisk"></span>
		        </div>
		    </div>
		    <div style="height:2px;"></div>
			<div class="lab_ipt_item">
				<span class="lab120"></span>
				<div class="ipt-box"><input type="button" class="button4" value="确定" onclick="saveYbhBtn()"/></div>
			</div>
	    </div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#hmx").bind("blur",checkHM);
		});
		function checkHM()
		{
			var hm = $("#hmx").val();
			if(!hm || hm.length!=15)
			{
				$(".asterisk")[0].innerHTML="请输入合理的户码";
				return false;
			}
			else
			{
				$(".asterisk")[0].innerHTML="";
				return true;
			}
		}
		
		function saveYbhBtn()
		{
			if(!checkHM()) return;
			var hm = $("#hmx").val();
			var hname = $("#hnamex").val();
			//ajax提交
			$.ajax({
				cache:false,
				async:false,
				type:"post",
				data:{hm:hm,hname:hname},
				url:"ybhManageAction_addYbh.action",
				success: function(data) {
					if(data=="0")
					{
						alert("添加成功!");
					}
					else if(data=="1")
					{
						alert("户码已存在，不可重复添加！");
					}
					else
					{
						alert("添加失败！");
					}
				}
			});
		}
	</script>
</body>
</html>