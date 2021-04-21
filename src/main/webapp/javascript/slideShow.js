/*javascript.js*/
 

window.onload=function(){
var slideIndex = 0;
showSlides(slideIndex);

var sec = 3000;
setInterval(function(){
slideIndex++;
showSlides(slideIndex);

}, sec);
}

function current(n) {
slideIndex = n;
showSlides(slideIndex);
}

function showSlides(n) {

var slides = document.getElementsByClassName("slide");
var dots = document.getElementsByClassName("dot");
var size = slides.length;

if ((n+1) > size) {
slideIndex = 0; n = 0;
}else if (n < 0) {
slideIndex = (size-1);
n = (size-1);
}

for (i = 0; i < slides.length; i++) {
	slides[i].style.display = "none";
}
for (i = 0; i < dots.length; i++) {
  dots[i].className = dots[i].className.replace(" active", "");
}

slides[n].style.display = "block";
dots[n].className += " active";
}

