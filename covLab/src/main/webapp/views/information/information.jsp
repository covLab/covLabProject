<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, news.model.vo.News"%>
<% ArrayList<News> newsList = (ArrayList<News>) request.getAttribute("news"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>information</title>

    <!-- ================= Favicon ================== -->
    <!-- Standard -->
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <!-- Retina iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <!-- Retina iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <!-- Standard iPad Touch Icon-->
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <!-- Standard iPhone Touch Icon-->
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

    <!-- Styles -->
    <link href="/semi/resources/css/lib/font-awesome.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/themify-icons.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/menubar/sidebar.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="/semi/resources/css/lib/helper.css" rel="stylesheet">
    <link href="/semi/resources/css/style.css" rel="stylesheet">

<%@ include file="../common/sidebar.jsp"%>
<%@ include file="../common/topbar.jsp"%>
<style type="text/css">
	.slider {
  width: 1000px;
  height: 550px;
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
.imga {
  width: 1000px;
  height: 550px;
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
    

 /* ????????? ?????? ?????? */ 
 .btn {
  text-decoration: none;
  font-size:15pt;  
  background-color: #1E3269;
  color: white;
  padding:10px 20px 10px 20px;
  margin:10px;
  display:inline-block;
  border-radius: 10px;
  transition:all 0.2s;
 }
 .btn:active {
  transform:translateY(5px);
 }
 
 .btn:hover {
 	background:lightgray;
 	color:black;
 	transition:all 0.2s;
 }
 
 
 
</style>


</head>


<body>
    <div class="content-wrap">
        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 p-r-0 title-margin-right">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>?????? /  ?????? ??????</h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                   
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-title">
                                <!-- 1. ?????????/?????? ?????? (?????? ????????????) -->
                                    <!-- <h4>1. ?????????/??????/QnA</h4> -->
<!-- 2. ?????????/ ?????? ????????? ???????????? ?????? -->
 <h5>**?????? ??????**</h5> 
<a class="btn" href="coronaInfo.jsp">????????? ??????</a>
<a class="btn" href="vaccinInfo.jsp">??????/???????????? ??????</a>
<a class="btn" href="qna.jsp">QnA</a>
<!-- <a class="btn" href="test2.jsp">test2</a> -->
<hr>
<!-- ???????????? (????????? ??????, ???????????????) -->
<br>
  <div class="slider" >
      <!-- <div class="slide" style="background-image: url(/semi/resources/images/info_num.jpg);"></div>   -->
      <div class="slide" style="background-image: url(/semi/resources/images/info_num2.jpeg);">
      	<a href="coronaInfo.jsp"><img src="/semi/resources/images/info_num2.jpeg" class="imga"></a>
      </div>
      <div class="slide" style="background-image: url(/semi/resources/images/info_vac.gif);">
      	<a href="vaccinInfo.jsp"><img src="/semi/resources/images/info_vac.gif" class="imga"></a>
      </div>
      <div class="slide" style="background-image: url(/semi/resources/images/info_qna2.jpg);">
      	<a href="qna.jsp"><img src="/semi/resources/images/info_qna2.jpg" class="imga"></a>
      </div>
      <a class="prev" onclick="button_click(-1)">&#10094</a>
      <a class="next" onclick="button_click(1)">&#10095</a>
    </div>
<br>
<p><a href="#top">??? ?????? ??????</a></p>
<hr>

<!-- 3. ????????? ?????? -->
<h5>**?????? & ??????**</h5><br>
<%for (News news : newsList) {%>
	<a href=<%=news.getUrl()%>" class="new"><u><%=news.getTitle()%></u></a><br>
<%} %>

<br>
<br>
<p><a href="#top">??? ?????? ??????</a></p>
<hr>
  
                                </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /# card -->
                        </div>
                        <!-- /# column -->
                    </div>
                    <!-- /# row -->
                </section>
            </div>
<!-- ---------------------------------------------------------------------------------------- -->


    <!-- jquery vendor -->
    <script src="/semi/resources/js/lib/jquery.min.js"></script>
    <script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
    <script src="/semi/resources/js/lib/bootstrap.min.js"></script><script src="assets/js/scripts.js"></script>
    <!-- scripit init-->

<!-- ???????????? ????????? ???????????? -->
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
