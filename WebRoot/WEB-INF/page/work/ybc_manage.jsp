<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/style/style-b.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery-1.5.1.min.js"></script>
	<style type="text/css">
		#Tab{margin:0 auto;width:866px;}
		.Menubox{height:28px;border-bottom:1px solid #64B8E4;background:#E4F2FB;}
		.Menubox ul{list-style:none;margin:0px 2px;padding:0;position:absolute;}
		.Menubox ul li{float:left;background:#64B8E4;line-height:27px;display:block;cursor:pointer;text-align:center;color:#fff;font-weight:bold;border-top:1px solid #64B8E4;border-left:1px solid #64B8E4;border-right:1px solid #64B8E4; margin-right:2px;}
		.Menubox ul li.hover{background:#fff;border-bottom:1px solid #fff;color:#147AB8;}
		.Contentbox{clear:both;margin-top:0px;border-top:none;height:181px;padding-top:8px;height:100%;text-align:center; line-height:22px;}
		.Contentbox ul{list-style:none;margin:7px;padding:0;}
		.Contentbox ul li{line-height:24px; width:158px; float:left; margin-right:5px;}	
		
		.Contentbox table{text-align:center; line-height:20px; border-right:1px solid #3B9FFF; border-bottom:1px solid #3B9FFF; margin-top:2px;}
		.Contentbox table td{border-top:1px solid #3B9FFF; border-left:1px solid #3B9FFF; empty-cells:show;}
		
	</style>
    <script type="text/javascript">
		function setTab(name,cursel,n){
			for(i=1;i<=n;i++){
				var menu=document.getElementById(name+i);
				var con=document.getElementById("con_"+name+"_"+i);
				menu.className=i==cursel?"hover":"";
				con.style.display=i==cursel?"block":"none";
			}
		}
	</script>
</head>
<body style="background:#E0EEFB;">
<s:property value="#request.h" escape="false"/>
</body>
</html>