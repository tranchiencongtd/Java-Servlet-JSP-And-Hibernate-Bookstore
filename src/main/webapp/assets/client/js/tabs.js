// const $ = document.querySelector.bind(document);
// const $$ = document.querySelectorAll.bind(document);
const tabs_item = document.querySelectorAll(".tab");
const tabs_content = document.querySelectorAll(".tab-content");
tabs_item.forEach((element, index) => {
    const tab_content = tabs_content[index];
    element.onclick = function () {
        document.querySelector(".tab.active").classList.remove("active");
        document.querySelector(".tab-content.active").classList.remove("active");
        this.classList.add("active");
        tab_content.classList.add("active");
    };
});