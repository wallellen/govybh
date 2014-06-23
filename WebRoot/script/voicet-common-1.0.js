
/**
 * 鼠标经过显示全部内容，鼠标离开恢复
 * o:obj
 * v:value
 */
function showTitle(o, v){
	o.title=v;
}

/** 校验整型 */
function checkIntInput(o){  
    o.value = o.value.replace(/[^\d]/g,"");
}
/**
 * 校验整数,范围限制
 * o:object
 * s:min
 * l:max
 * x:len
 */
function checkIntWithRangeInput(o,x,s,l){  
    o.value = o.value.replace(/[^\d]/g,"");
    if(o.value.length>=x)
    {
    o.value = o.value>l ? l : o.value;
    o.value = o.value<s ? s : o.value;
    }
    
}
/** 校验百分比 */
function checkPercentInput(o){  
    o.value = o.value.replace(/[^\d]/g,"");  
    o.value = o.value>100 ? 100 : o.value;
    o.value = o.value<0 ? 0 : o.value;
}
/** 校验浮点数 */
function checkFloatInput(o){
	//得到第一个字符是否为负号  
    var t = o.value.charAt(0);    
    //先把非数字的都替换掉，除了数字和.     
    o.value = o.value.replace(/[^\d.]/g,"");     
    //必须保证第一个为数字而不是.     
    o.value = o.value.replace(/^\./g,"");     
    //保证只有出现一个.而没有多个.     
    o.value = o.value.replace(/\.{2,}/g,".");     
    //保证.只出现一次，而不能出现两次以上     
    o.value = o.value.replace(".","$#{1}quot;").replace(/\./g,"").replace("$#{1}quot;",".");  
    //如果第一位是负号，则允许添加  
    if(t == '-'){  
    	o.value = '-'+o.value;  
    }    
}
/**
 * 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
 */
function checkCardNo(o){
	 o.value = o.value.replace(/[^\d{17}(\d|X)$]/,"");
	//o.value = o.value.replace(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,""); 
}
/**
 * 数字加逗号
 */
function checkNumComma(o){
	//得到第一个字符是否为逗号  
    var t = o.value.charAt(0);
    //如果第一位是逗号，则不允许添加  
    if(t == ','){  
    	o.value = '';  
    }
	o.value = o.value.replace(/[^\d|,]+$/g,"");
}



