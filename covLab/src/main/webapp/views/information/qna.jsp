@@ -0,0 +1,205 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>QnA</title>


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
</head>

<style>
 .btn {
  text-decoration: none;
  font-size:15pt;  
  background-color: navy;
  color: white;
  padding:10px 20px 10px 20px;
  margin:10px;
  display:inline-block;
  border-radius: 10px;
  transition:all 0.2s;
  text-shadow:0px -2px black;
 }
 .btn:active {
  transform:translateY(5px);
 }
 
 dl.faq button {
  margin: 0;
  padding: 0;
  margin-top: 1em;
  font-weight: bold;
  font-size: 110%;
  border: thin solid transparent;
  background-color: transparent;
  padding-left: 0.125em;
}

dl dd {
  margin: 0;
  padding: 0;
  margin-left: 1.5em;
}

dl.faq .desc {
  margin: 0;
  padding: 0.5em;
  font-size: 110%;
  display: none;
  background-color: #fffedb;
}

dl.faq button:hover,
dl.faq button:focus {
  background-color: #eee;
}

dl.faq button:focus {
  border-color: #630;
}

dl.faq button:hover {
  text-decoration: underline;
}

dl.faq button:active {
  background-color: #bbb;
}

dl.faq button[aria-expanded="false"]::before {
  content: url('../images/right-arrow-brown.png');
  padding-right: 0.35em;
}

dl.faq button[aria-expanded="true"]::before {
  content: url('../images/down-arrow-brown.png');
  padding-right: 0.35em;
}
 
</style>

<body>
<h4>QnA</h4>
<hr>

<a class="btn" href="#qna01">코로나란?</a>
<a class="btn" href="#qna02">코로나의 증상/검사</a>
<a class="btn" href="#qna03">임신과 출산</a>
<a class="btn" href="#qna04">치료 및 예방</a>
<a class="btn" href="#qna05">접촉자 및 확진환자</a>
<a class="btn" href="#qna06">격리 및 격리해제</a>
<a class="btn" href="#qna07">백신 관련</a>
<a class="btn" href="#qna08">백신의 안전성과 이상반응</a>
<a class="btn" href="#qna09">코로나19 예방접종 관련 피해보상</a>
<a class="btn" href="#qna10">인과성 불충분한 중증 환자 의료비 지원사업</a>
<a class="btn" href="#qna11">기타</a>
<hr>
<!-- 윗부분은 목록을 만들고 a 태그로 각 번호의 목록으로 이동하게 만듬 -->

<!-- 각 목록의 내용을 번호를 붙여서 작성 -->
<h5 id="qna01">1. 코로나란?</h5>
<dl class="faq">
  <dt>
    <button aria-expanded="false" aria-controls="faq1_desc">
      코로나 바이러스 감염증-19는 어떤 질병인가요?
    </button>
  </dt>
  <dd>
    <p id="faq1_desc" class="desc">
    	1. 코로나 바이러스 감염증-19(코로나19)는 과거에 발견되지 않았던 새로운 코로나 바이러스인 SARS-CoV-2에 의해 발생하는
    	호흡기 감염병으로, 이 바이러스에 감염되면 무증상부터 중증에 이르기까지 다양한 임상증상이 나타날 수 있습니다.  <br>
    	2. 이 새로운 바이러스와 질병은 2019년 12월 중국 우한에서 처음 보고되었고, 현재 전 세계에 확산되었습니다.
    </p>
  </dd>
   <dt>
    <button aria-expanded="false" aria-controls="faq2_desc">
      코로나 바이러스는 어떤 바이러스인가요?
    </button>
  </dt>
  <dd>
    <p id="faq2_desc" class="desc">
    	1. 코로나 바이러스는 동물 및 사람에게 전파될 수 있는 바이러스로 그 중 사람에게 전파가능 함 사람 코로나 바이러스는 기존에
    	6종이 알려져 있습니다.<br>
    	2. 이 중 4종은 감기와 같은 질병을 일으키는 바이러스이며, 나머지 2종은 각각 MERS-CoV와 SARS-CoV로 알려져있습니다.<br>
    	3. 이번 유행의 원인 바이러스는 코로나바이러스(SARS-CoV-2)로 공개된 염기서열 분석을 통해 코로나 19 바이러스가 박쥐유래
    	사스 유사 바이러스와 89.1% 일치하는 것을 확인하였습니다.
    </p>
  </dd>
  
  
  
  
  </dl>
<p><a href="#top">맨 위로 이동</a></p>
<hr>


<h5 id="qna02">2. 코로나19 예방접종 사업</h5>
<p>예방접종 하면 좋겠죠.. 건강할거에요.. 그럴거에요...</p>
<p>예방접종 하면 좋겠죠.. 건강할거에요.. 그럴거에요...</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna03">3. 백신 관련</h5>
<p>백신이 점점 업그레이드 좀 됐으면 좋겠어요.</p>
<p>백신이 점점 업그레이드 좀 됐으면 좋겠어요.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna04">4. 백신의 안전성과 이상반응</h5>
<p>백신은 안전하지 않은것 같지만.. 괜찮아지길 바래요.. 이상있음 병원가야 합니다...</p>
<p>백신은 안전하지 않은것 같지만.. 괜찮아지길 바래요.. 이상있음 병원가야 합니다...</p>
<p>백신은 안전하지 않은것 같지만.. 괜찮아지길 바래요.. 이상있음 병원가야 합니다...</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna05">5. 코로나19 예방접종 관련 피해보상</h5>
<p>코로나로 피해를 받으셨으면 보상을 받으세요. 보상해줍니다.</p>
<p>코로나로 피해를 받으셨으면 보상을 받으세요. 보상해줍니다.</p>
<p>코로나로 피해를 받으셨으면 보상을 받으세요. 보상해줍니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna06">6. 인과성 불충분한 중증 환자 의료비 지원사업</h5>
<p>인과성 자료가 부족해도 보상 받을 수 있습니다.</p>
<p>인과성 자료가 부족해도 보상 받을 수 있습니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna07">7. 75세 이상 어르신 및 노인시설 예방접종</h5>
<p>어르신들께서 건강하시길 바랍니다.</p>
<p>어르신들께서 건강하시길 바랍니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>
<h5 id="qna08">8. 시스템및 예방접종 기록</h5>
<p>예방접종 하면 기록이 생깁니다.</p>
<p>예방접종 하면 기록이 생깁니다.</p>
<p><a href="#top">맨 위로 이동</a></p>
<hr>

                <!-- /# row -->
                <section id="main-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="extra-area-chart"></div>
                            <div id="morris-line-chart"></div>
                            <div class="footer">
                                <p>2018 © Admin Board. -
                                    <a href="#">example.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
  
    <!-- jquery vendor -->
    <script src="/semi/resources/js/lib/jquery.min.js"></script>
    <script src="/semi/resources/js/lib/jquery.nanoscroller.min.js"></script>
    <!-- nano scroller -->
    <script src="/semi/resources/js/lib/menubar/sidebar.js"></script>
    <script src="/semi/resources/js/lib/preloader/pace.min.js"></script>
    <!-- sidebar -->
    
    <!-- bootstrap -->


    <script src="/semi/resources/js/lib/bootstrap.min.js"></script><script src="assets/js/scripts.js"></script>
    <!-- scripit init-->

<script>
/*
*   This content is licensed according to the W3C Software License at
*   https://www.w3.org/Consortium/Legal/2015/copyright-software-and-document
*
*   File:   ButtonExpand.js
*
*   Desc:   Checkbox widget that implements ARIA Authoring Practices
*           for a menu of links
*/

/*
*   @constructor ButtonExpand
*
*
*/
var ButtonExpand = function (domNode) {

  this.domNode = domNode;

  this.keyCode = Object.freeze({
    'RETURN': 13
  });
};

ButtonExpand.prototype.init = function () {

  this.controlledNode = false;

  var id = this.domNode.getAttribute('aria-controls');

  if (id) {
    this.controlledNode = document.getElementById(id);
  }

  this.domNode.setAttribute('aria-expanded', 'false');
  this.hideContent();

  this.domNode.addEventListener('keydown',    this.handleKeydown.bind(this));
  this.domNode.addEventListener('click',      this.handleClick.bind(this));
  this.domNode.addEventListener('focus',      this.handleFocus.bind(this));
  this.domNode.addEventListener('blur',       this.handleBlur.bind(this));

};

ButtonExpand.prototype.showContent = function () {

  if (this.controlledNode) {
    this.controlledNode.style.display = 'block';
  }

};

ButtonExpand.prototype.hideContent = function () {

  if (this.controlledNode) {
    this.controlledNode.style.display = 'none';
  }

};

ButtonExpand.prototype.toggleExpand = function () {

  if (this.domNode.getAttribute('aria-expanded') === 'true') {
    this.domNode.setAttribute('aria-expanded', 'false');
    this.hideContent();
  }
  else {
    this.domNode.setAttribute('aria-expanded', 'true');
    this.showContent();
  }

};

/* EVENT HANDLERS */

ButtonExpand.prototype.handleKeydown = function (event) {

  console.log('[keydown]');

  switch (event.keyCode) {

    case this.keyCode.RETURN:

      this.toggleExpand();

      event.stopPropagation();
      event.preventDefault();
      break;

    default:
      break;
  }

};

ButtonExpand.prototype.handleClick = function (event) {
  this.toggleExpand();
};

ButtonExpand.prototype.handleFocus = function (event) {
  this.domNode.classList.add('focus');
};

ButtonExpand.prototype.handleBlur = function (event) {
  this.domNode.classList.remove('focus');
};

/* Initialize Hide/Show Buttons */

window.addEventListener('load', function (event) {

  var buttons =  document.querySelectorAll('button[aria-expanded][aria-controls]');

  for (var i = 0; i < buttons.length; i++) {
    var be = new ButtonExpand(buttons[i]);
    be.init();
  }

}, false);
</script>


</body>

</html>