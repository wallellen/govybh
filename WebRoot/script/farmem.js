//选择县
function selectXian(){
	var c = document.getElementsByName("chkbox");
	var xmlist = document.getElementById("xmlist");
	var closeBt = "&nbsp;<label onclick='disSelectXian()' class='dis_sel_xian'></label>";
	selxian.innerHTML='';
	var batchItemCode = ''; 
	var batchProductName = '';
	for(var i=0; i<c.length; i++){ 
		if(c[i].checked){
			batchItemCode += c[i].id+',';          
            batchProductName += c[i].value+',';  
		}
	}
	$("#xmlist").val(batchItemCode);
	var xnameCloseBt = "<label class='sel_xian_list'>["+batchProductName+"]</label>"+closeBt;
	$("#xmname").val(xnameCloseBt);
	if(batchProductName.length>0)
	{
		selxian.innerHTML="<label class='sel_xian_list'>["+batchProductName+"]</label>"+closeBt;
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

//查询之后回显已选中查询参数
function checkCHK()
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

