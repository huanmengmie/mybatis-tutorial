
$(function(){
	//全选和取消全选
	$('.new_div2_input').click(function(){
	  var is_check=$('.new_div2_input').is(':checked');
	  var info_check=document.getElementsByName('info_id');
	  if(is_check==true){

		for(var i=0;i<info_check.length;i++){
			info_check[i].checked=true;
		}
			  	   
	  }else{
	  	for(var i=0;i<info_check.length;i++){
		    info_check[i].checked=false;
		}
	  }
	});
	
	

});


//时间     - 年月日
function showLocale(){
	var date = new Date();
    var seperator1 = "-";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    
    var hh = date.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = date.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = date.getSeconds();
	if(ss<10) ss = '0' + ss;
	
	
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    
    return currentdate;
}

//时间  -时分秒
function hms(){
	var date = new Date();
	var hh = date.getHours();
	if(hh<10) hh = '0' + hh;
	var mm = date.getMinutes();
	if(mm<10) mm = '0' + mm;
	var ss = date.getSeconds();
	if(ss<10) ss = '0' + ss;
	
	var hms=hh+":"+mm+":"+ss;
	return hms;
}