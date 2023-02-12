$(function(){
    $("#show").click(function(){
        $("#more").show();
        $(".zoom-out").show();
        $(this).hide();
        $("#hidden").show();
        $(".section-more .hide").show();
    })
    $("#hidden").click(function(){
        $("#more").hide();
        $("#show").show();
        $(this).hide();
        $(".section-more .hide").hide();
    })
})
document.addEventListener("DOMContentLoaded", function(){
    let dlt = document.getElementsByClassName("delete");
    let hide = document.getElementsByClassName("hide");
    let more = document.getElementById("more")
    let more_small = document.querySelectorAll(".section-more .hide");
    // console.log(more_small);
    for(let k = 0; k < more_small.length; k++){
        more_small[k].style.display = "none";
    }
    for(let i = 0; i < dlt.length; i++){
        dlt[i].onclick = function(){
            for(let j = 0; j < hide.length; j++){
                hide[i].style.display = "none";
                more.style.display = "block";
            }
            for(let k = 0; k < more_small.length; k++){
                more_small[i].style.display = "inline-block";
                more_small[i].style.display = "flex";
            }
        }
    }
    let search_auto_show = document.getElementById("search-auto-show");
    let search_auto = document.getElementById("search-auto");
    let bg_dark = document.getElementById("bg-dark");
    let header = document.getElementById("header");
    let form_search = document.getElementById("form-search");
    form_search.onclick = function(e){
        e.stopPropagation();
    };
    search_auto_show.onclick = function(e){
        search_auto.style.display = "block";
        bg_dark.style.display = "block";
        e.stopPropagation();
    }
    bg_dark.onclick = function(e){
        search_auto.style.display = "none";
        bg_dark.style.display = "none";
    }
    header.onclick = function(e){
        search_auto.style.display = "none";
        bg_dark.style.display = "none";
    }
    let log_in = document.getElementById("log-in");
    let register = document.getElementById("register");
    let modal_box = document.querySelector(".modal-box");
    let btn_close = document.getElementById("btn-close");
    let modal_container = document.getElementById("modal-container");
    let cart_item_content = document.getElementById("cart-item-content")
    log_in.onclick = function(e){
        modal_box.style.display = "block";
    }
    register.onclick = function(){
        modal_box.style.display = "block";
    }
    btn_close.onclick = function(e){
        modal_box.style.display = "none";
    }
    modal_box.onclick = function(e){
        modal_box.style.display = "none"
    }
    modal_container.onclick = function(e){
        e.stopPropagation();
    }
    cart_item_content.onclick = function(){
        modal_box.style.display = "block";
    }

}, false)