document.addEventListener("DOMContentLoaded", function(){
    let tel = document.getElementById("tel");
    let check = document.getElementById('check');
    let phoneNumberPattern = /^0\d{2}[-\s]?\d{3}[-\s]?\d{4}$/;
    let error = document.getElementById("error");
    let border = document.querySelector(".input");
    var text_error;
    check.onclick = function(){
        if(tel.value === ""){
            text_error = "Số điện thoại không được để trống";
            border.style.borderBottom = "1px solid red";
        }
        else if (phoneNumberPattern.test(tel.value) === false || tel.value.charAt(1) === 0) {
            text_error = "Số điện thoại không hợp lệ";
            border.style.borderBottom = "1px solid red";
        }
        else{
            text_error = "";
            border.style.borderBottom = "none";
        }
        error.innerHTML = text_error;
    }
    console.log(border);
    
}, false)
