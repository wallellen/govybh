//选择县
function selectXian(){
	var c = document.getElementsByName("chkbox");
	var v_flag = false;
	for(var i=0; i<c.length; i++){   
		if(c[i].checked){
			v_flag = true;
	        break; 
		}            
	}   
	//获得选中的checkbox拼装成的batchItemCode字符串
	var batchItemCode = ''; 
	var batchProductName = '';
	if(v_flag==true){      
		//拼成批量要删除的编号itemCode
	    for(var i=0; i<c.length; i++){   
	    	if(c[i].checked){
	            batchItemCode += c[i].id+',';          
	            batchProductName += c[i].value+',';          
			}            
		}  
	}else{
		selxian.innerHTML='';
		return;
	}
	$("#xmlist").val(batchItemCode);
	$("#xmname").val(batchProductName);
	selxian.innerHTML=batchProductName;
}
//全省范围
function selectAllXian(obj)
{
	var xmlist = document.getElementById("xmlist");
	var axflag = document.getElementById("axflag");
	if(obj.checked)
	{
		xmlist.value=null;
		axflag.value=1;
	}
	else
	{
		axflag.value=0;	
	}
}