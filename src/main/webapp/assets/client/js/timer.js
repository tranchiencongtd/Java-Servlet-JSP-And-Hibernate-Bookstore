setInterval(myfunction, 1);

function myfunction() {
    var countDownDate = new Date("dec 30, 2021 15:27:00").getTime();

    var now = new Date().getTime();
    var distance = countDownDate - now;

    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    var hour = 0;
    if (hours < 10) {
        hour = "0" + hours;
    } else {
        hour = hours;
    }
    var minute = 0;
    if (minutes < 10) {
        minute = "0" + minutes;
    } else {
        minute = minutes;
    }
    var second = 0;
    if (seconds < 10) {
        second = "0" + seconds;
    } else {
        second = seconds;
    }
    document.getElementById("hour").innerHTML = hour;
    document.getElementById("minute").innerHTML = minute;
    document.getElementById("second").innerHTML = second;
    if (distance < 0) {
        let x = "Khuyến mãi kết thúc";
        document.getElementById("navigation").innerHTML = x;
    }
}