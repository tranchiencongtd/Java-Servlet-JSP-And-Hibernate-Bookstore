document.addEventListener("DOMContentLoaded", function(){
    let icon_prev = document.getElementById("icon-prev");
    let icon_next = document.getElementById("icon-next");
    let content = document.getElementById("content");
    // console.log(icon_prev, content, icon_next);
    icon_next.onclick = function(){
        content.style.transform = "translateX(-980px)";
        icon_prev.style.display = "flex";
        this.style.display = "none";
    }
    icon_prev.onclick = function(){
        content.style.transform = "translateX(0)";
        icon_next.style.display = "flex";
        this.style.display = "none";
    }
}, false)