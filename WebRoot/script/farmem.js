//选择县

function selectXian(){
	//
	var xmlist = document.getElementById("xmlist");
	
	var c = document.getElementsByName("chkbox");
	var v_flag = false;
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
	$("#xmname").val(batchProductName);
	if(batchProductName.length>0)
	{
		selxian.innerHTML="["+batchProductName+"]"+"&nbsp;<label onclick='disSelectXian()' class='dis_sel_xian'></label>";
	}
	else
	{
		selxian.innerHTML="[全省]";
		$("#xmname").val("全省");
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
	$("#xmname").val("全省");
	xmlist.value=null;
}

