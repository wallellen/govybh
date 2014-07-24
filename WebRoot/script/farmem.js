
//初始化fancybox控件页面的checkbox
function initFancyCheckbox()
{
	var c = document.getElementsByName("chkbox");
	var xmlist = document.getElementById("xmlist");
	var xmValue = xmlist.value;
	xmValue=xmValue.split(",");
	if(xmValue.length>0)
	{
		for(var i=0; i<xmValue.length; i++)
		{
			for(var j=0; j<c.length; j++){ 
				if(c[j].id == xmValue[i]){
					c[j].checked=true;  
				}
			}
		}
	}
}

//选择县
function selectXian(){
	var c = document.getElementsByName("chkbox");
	var xmlist = document.getElementById("xmlist");
	var closeBt = "<label id='closeBtn' class='dis_sel_xian'>&nbsp;</label>";
	selxian.innerHTML='';
	var xmListCode = ''; 
	var xmListName = '';
	for(var i=0; i<c.length; i++){ 
		if(c[i].checked){
			xmListCode += c[i].id+',';          
			xmListName += c[i].value+',';  
		}
	}
	$("#xmlist").val(xmListCode);
	var xnameCloseBt = "<label class='sel_xian_list'>["+xmListName+"]</label>"+closeBt;
	$("#xmname").val(xnameCloseBt);
	if(xmListName.length>0)
	{
		selxian.innerHTML="<label class='sel_xian_list'>["+xmListName+"]</label>"+closeBt;
	}
	else
	{
		selxian.innerHTML="[全省]";
		$("#xmname").val("[全省]");
		xmlist.value=null;
	}
}
//反选
function disSelectXian()
{
	var c = document.getElementsByName("chkbox");
	for(var i=0; i<c.length; i++){   
		c[i].checked=false;
	}   
	selxian.innerHTML="[全省]";
	$("#xmname").val("[全省]");
	xmlist.value=null;
}


