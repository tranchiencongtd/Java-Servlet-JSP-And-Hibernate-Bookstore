document.addEventListener("DOMContentLoaded", function(){
    let header_scroll = document.getElementById("header-scroll");
    let heigth = header_scroll.offsetTop + 250;
    // Lấy chiều cao khi cuộn chuột
    let sticky_content = document.getElementById("sticky-content");
    let search_auto = document.getElementById("search-auto");
    let bg_dark = document.getElementById("bg-dark");
    let footer_container = document.getElementById("footer-container");
    // console.log(footer_container.offsetTop);
    // console.log(search_auto);
    window.addEventListener("scroll", function(){
        search_auto.style.display = "none";
        bg_dark.style.display = "none";
        if(window.pageYOffset >= heigth){
            header_scroll.classList.add("sticky");
            sticky_content.classList.add("mt-150")
        }   
        else{
            header_scroll.classList.remove("sticky");
            sticky_content.classList.remove("mt-150");
        }
        if(window.pageYOffset >= footer_container.offsetTop - 100){
            header_scroll.classList.add("mt-50");
        }
        else{
            header_scroll.classList.remove("mt-50");
        }
    })
}, false)