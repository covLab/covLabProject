<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.slider {
  width: 1000px;
  height: 650px;
  position: relative;
}
.slide {
  width: 1000px;
  height: 550px;
  background-size: cover;
  border-radius: 10px;
  animation: fade 1.5s;
  display: none;
}
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  padding: 16px;
  color: black;
  font-size: 4rem;
  transition: 0.6s ease;
  border-radius: 5px;
}
.next {
  right: 0;
}
.prev:hover,
.next:hover {
  background-color: white;
  /*rgba(190, 190, 190, 0.5)*/
}

@keyframes fade {
  from {
    opacity: 0.4;
  }
  to {
    opacity: 1;
  }
}
</style>
</head>
<body>
  <div class="slider">
      <div class="slide" style="background-image: url(../../resources/images/info_coronic2.png);"></div>
      <div class="slide" style="background-image: url(../../resources/images/info_vaccine.PNG);"></div>
      <div class="slide" style="background-image: url(../../resources/images/maxresdefault.jpg);"></div>
      <a class="prev" onclick="button_click(-1)">&#10094</a>
      <a class="next" onclick="button_click(1)">&#10095</a>
    </div>
    
 <script>
let currSlide = 1;
showSlide(currSlide);

function button_click(num){
  showSlide((currSlide += num));
}
function showSlide(num){
  const slides = document.querySelectorAll(".slide");
  if(num>slides.length){
    currSlide =1;
  }if(num<1){
    currSlide = slides.length;
  }
  for(let i=0; i<slides.length; i++){
    slides[i].style.display="none";
  }slides[currSlide -1].style.display="block";
}
</script>
</body>
</html>