document.addEventListener(
"DOMContentLoaded",
    function () {
        let slick_next = document.querySelector(".slick-next");
        let slick_prev = document.querySelector(".slick-prev");
        let slick_list = document.querySelector(".slick-list");
        slick_next.onclick = function () {
            slick_list.style.transform = "translateX(-1240px)";
            this.style.display = "none";
            slick_prev.style.display = "block";
        };
        slick_prev.onclick = function () {
            slick_list.style.transform = "translateX(0)";
            this.style.display = "none";
            slick_next.style.display = "block";
        };
    },
    false
);