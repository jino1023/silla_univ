<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
   body{
      color: #fff;
      font-family: 'Roboto', sans-serif;
   }
    .form-control{
      height: 41px;
      background: #f2f2f2;
      box-shadow: none !important;
      border: none;
   }
   .form-control:focus{
      background: #e2e2e2;
   }
    .form-control, .btn{        
        border-radius: 3px;
    }
   .signup-form{
      width: 390px;
      margin: 30px auto;
   }
   .signup-form form{
      color: #999;
      border-radius: 3px;
       margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
   .signup-form h2 {
      color: #333;
      font-weight: bold;
        margin-top: 0;
    }
    .signup-form hr {
        margin: 0 -30px 20px;
    }    
   .signup-form .form-group{
      margin-bottom: 20px;
   }
   .signup-form input[type="checkbox"]{
      margin-top: 3px;
   }
   .signup-form .row div:first-child{
      padding-right: 10px;
   }
   .signup-form .row div:last-child{
      padding-left: 10px;
   }
    .signup-form .btn{        
        font-size: 16px;
        font-weight: bold;
      background: #3598dc;
      border: none;
      min-width: 140px;
    }
   .signup-form .btn:hover, .signup-form .btn:focus{
      background: #2389cd !important;
        outline: none;
   }
    .signup-form a{
      color: #fff;
      text-decoration: underline;
   }
   .signup-form a:hover{
      text-decoration: none;
   }
   .signup-form form a{
      color: #3598dc;
      text-decoration: none;
   }   
   .signup-form form a:hover{
      text-decoration: underline;
   }
    .signup-form .hint-text {
      padding-bottom: 15px;
      text-align: center;
    }
</style>
</head>
<body>
<jsp:include page="./nav.jsp"/>
<br><br><br>
<div class="signup-form">
    <form>
      <h2>회원가입</h2>
  
      <hr>
        <div class="form-group">
           <input type="text" class="form-control" id="memId" name="memId" placeholder="아이디" required="required" onfocusout="checkID()">
           <div id="success-message" class="text-success" style="display:none">사용할 수 있는 아이디입니다.</div>
           <div id="fail-message" class="text-danger" style="display:none">이미 존재하는 아이디입니다.</div>
        </div>
      <div class="form-group">
            <input type="password" class="form-control" id="memPwd" name="memPwd" placeholder="패스워드" required="required">
        </div>
      <div class="form-group">
            <input type="text" class="form-control" id="memName" name="memName" placeholder="이름" required="required">
        </div>
      <div class="form-group">
             <input type="radio" id="memGen" name="memGen" value="men"> 남
            <input type="radio" id="memGen" name="memGen" value="women"> 여<br>
        </div>
      <div class="form-group">
            <input type="text" class="form-control" id="memNum" name="memNum" placeholder="전화번호" required="required">
         </div>
      <div class="form-group">
            <button type="button" class="btn btn-primary btn-lg" onclick="signup()">회원가입완료</button>
        </div>
    </form>
   <div class="hint-text">Already have an account? <a href="#">Login here</a></div>
</div>
</body>
<script>
   function checkID() {
      $.ajax({
           type: "POST",
           url: "/yori/member/checKID",
           data: {
              memId: $("#memId").val()
           },
           success: function(result) {
              if (result == "SUCCESS") {
                 $("#success-message").css("none");
                 $("#fail-message").css("block");
              } else if (result == "FAIL") {
                 $("")
              }
           }   
      });
   }
   function signup() {
      $.ajax({
           type: "POST",
           url: "/yori/member/signup",
           data: {
              memId: $("#memId").val(),
              memPwd: $("#memPwd").val(),
              memName: $("#memName").val(),
              memNum: $("#memNum").val(),
              memGen: $("input:radio[name='memGen']:checked").val()
           },
           success: function(result) {
              if (result == "SUCCESS") {
                 alert("회원가입에 성공했습니다.");
                 location.href = "/yori/member/login";
              } else if (result == "FAIL"){
                 alert("회원가입에 실패하였습니다.");
                 //location.reload();
              }
           }   
      });
   }
</script>
</html>                            