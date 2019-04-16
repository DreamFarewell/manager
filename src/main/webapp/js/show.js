/**
 * 
 */
function chk(){
    var all = document.getElementById("all");
    var mychk = document.getElementsByName("employee_id");
    if(all.checked==true){
        if(mychk.length){
            for(var i=0;i<mychk.length;i++){
            	mychk[i].checked = true;
            }
        }
        mychk.chcked=true;
    }else{
        if(mychk.length){
            for(var i=0;i<mychk.length;i++){
            	mychk[i].checked = false;
            }
        }
    }
}