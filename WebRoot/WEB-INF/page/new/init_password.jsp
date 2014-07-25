<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/global_cn.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/init_pass.js?v=1"></script>
</head>
<body style="background:#E0EEFB;">
	<h3 class="jiangbu-title">下级密码初始化</h3>
	<div style="margin:0 auto; width:490px; height:300px; padding-top:10px;">
		<p>
			
		</p>
		<form name="farmerForm" action="" method="post">
		<input type="hidden" id="rbms" value="<s:property value='#session.vts.rbm'/>"/> 
		<p>&nbsp;</p> 
		<p>地区编码：<input type="text" id="dqbm" name="dqbm" value="<s:property value='dqbm'/>" class="input_w160" maxlength="15" onblur="checkDiqubm(this)"/>
		<label id="xmTip"></label>
		</p>
		<p>&nbsp;</p> 
		<p>初始化密码：123456</p>
		<p>&nbsp;</p> 
        <p>
        	<input type="button" value="密码初始化" class="btn_w70" onclick="initPassword()">
        </p>
        <p>&nbsp;</p> 
      </form>
	</div>
</body>
</html>