<? session_start(); ?>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>편의점 관리</title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">

</head>
<body>
<?
    include "./config/header.php";
?>
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> Employee Table</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> Employee Insert</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" method="post" action="emp_cfInsert.php">
                  
                  <div class="form-group ">
                    <label for="empId" class="control-label col-lg-2">직원번호</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="empId" name="empId" type="text" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="empName" class="control-label col-lg-2">직원이름</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="empName" name="empName" type="text" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="empBirth" class="control-label col-lg-2">생년월일</label>
                    <span>yymmdd형식으로 입력하시면 됩니다.</span>
                    <div class="col-lg-10">
                      <input class="form-control" id="empBirth" name="empBirth" type="text" />
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="empCall" class="control-label col-lg-2">전화번호</label>
                    <div class="col-lg-10">
                      <input class="form-control" id="empCall" name="empCall" type="text" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="empDate" class="control-label col-lg-2">입사일자</label>
                    <div class="col-lg-10">
                      <input class="form-control " value='<? echo date("Y-m-d");?>' id="empDate" name="empDate" type="date" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="empClass" class="control-label col-lg-2">직원계급</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="empClass" name="empClass" type="text" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="branchId" class="control-label col-lg-2">지점번호</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="branchId" name="branchId" type="text" />
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme" type="submit">Save</button>
                      <button class="btn btn-theme04" type="button" onclick="back();">Cancel</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
    </section>
  </section>

  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="lib/common-scripts.js"></script>

  <script>
    function back() {
      history.back();
    }
  </script>

</html>
