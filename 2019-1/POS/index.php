<? session_start();
/*
 * 파일명: index.php
 * 버전번호: 1.0.0
 * 작성자명: 박진오
 * 프로젝트명: PosService
 * 연관 페이지: show_chart, emp_update, ...
 * 기능설명: 편의점관리 서비스의 메인 페이지로 상품관리, 판매목록보기 등의 
    이 서비스에서 제공하는 모든 페이지로 이동할 수 있다.
*/
?>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>편의점 관리</title>
  <!-- Favicons- -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Bootstrap CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- 외부 css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this page -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet"> 
</head>
<body>
<?
/* 페이지 상단좌측의 로고, 상단우측의 로그인버튼, 
  페이지 좌측의 슬라이드 메뉴를 생성하는 php파일
  (페이지마다 중복이되는 부분을 따로 만든후 include로 포함함)
*/
  include "./config/header.php";
?>
  <!-- 로그인 버튼을 누르면 실행되는 모달창, 입력값을 검사후 로그인 기능을 수행함 -->
  <div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3>Login</h3>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <form class="login_form" action="/log_in.php" method="POST">
          <div class="modal-body">
            <div class="form-group">
                <label>이름</label>
                <input type="text" class="form-control form-control-lg" name="username" id="uname" required="">
            </div>
            <div class="form-group">
                <label>암호</label>
                <input type="password" class="form-control form-control-lg" name="userpw" id="upw" required="">
            </div>
          </div>
          <div class="modal-footer">
              <!--캔슬버튼은 실행된 모달창을 종료하고 index페이지로 돌아가게 함 -->
              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
              <!--해당 버튼을 누르면 위의 두 input 태그에서 받은 아이디값과 패스워드값으로
              로그인 기능 수행 -->
              <button type="submit" class="btn btn-primary" id="btnLogin">Login</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- 해당페이지에서 사용하는 script들 jquery, bootstrap등 -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="lib/common-scripts.js"></script>
  <script>
    $(document).ready(function(){
      /* login_form(로그인버튼을 누르면 실행되는 모달창)에서 
      submit이벤트가 발생할때 loginForm함수 실행 */
      $("login_form").submit(function(event){
        loginForm();
        return false;
      });
    });
    /* loginForm의 정보를 직렬화하여 로그인 기능을 수행하는 login_in.php페이지로 넘김 */
    function loginForm() {
      $.ajax({
        type: "POST",
        url: "log_in.php",
        cache: false,
        data: $('form#login_form').serialize(),
        success: function(response){
          $("#contact").html(response)
          $("#contact-modal").modal('hide');
        },
        error: function(){
          alert("Error!");
        }
      });
    }
    /* 로그인 하지 않은 상태에서 사이드메뉴의 페이지를 요청할때 세션을 통해 
    로그인 상태를 확인한후 로그인이 되어있는 경우는 정상적으로 페이지를 넘기고
    로그인이 되어있지 않은경우는 로그인을 요청하는 메세지를 보냄 */
    function checkAdmin(){
<?
      if($_SESSION['ss_logged'] != 'logged_in'){
?>
        alert("로그인이 필요합니다.");
        return false;
<?
      }
?>
    }
  </script>
</html>