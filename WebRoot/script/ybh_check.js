function gouXuan(obj,h)
{
	var o;
	if(obj.checked==true)
	{
		o=1;
	}
	else
	{
		o=0;
	}
	var datajson = {"hm":h, "opcode":o};
	var url = 'selectYbh.action';
	$.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        data: datajson,
        success: function(){},
        error: function (){alert("操作失败");}
    });
}