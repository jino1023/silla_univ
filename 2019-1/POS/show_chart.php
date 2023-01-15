<? session_start();
/*
 * 파일명: show_chart.php
 * 버전번호: 1.0.0
 * 작성자명: 박진오
 * 프로젝트명: PosService
 * 연관 페이지: index, sale_list
 * 기능설명: 판매목록 데이터를 바탕으로 월별, 품목별 통계를 시각화하여 보여줌
*/
?>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta name="viewport" content="width=month-width, initial-scale=1.0">
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
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
</head>
<body>
<?php
  include "./config/header.php";
  include "./config/setData.php";

  $data_setting = "";
  for ($i=1; $i <= 12 ; $i++) { 
    $sql = "select MONTH(saleDate) as 'month', sum(saleTotal) as 'saleTotal'";
    $sql .= " from sale";
    $sql .= " group by month having month='$i'";
    $result = $conn->query($sql);
    $rows = mysqli_fetch_array($result);
    if ($rows['month']=="" || $rows['saleTotal']=="") {
      $rows['month'] = "1";
      $rows['saleTotal'] = "0";
    }
    $data_setting .= "{ y: '".$rows['month']."월', a: ".$rows['saleTotal']."},";
  }
  $data_setting = substr($data_setting, 0, -1);
?>
    
    <section id="main-content">
      <section class="wrapper">
        <button type="button" id="btnH1" class="btn btn-info">월별1 숨기기</button>
        <button type="button" id="btnS1" class="btn btn-info">월별1 보이기</button>
        <button type="button" id="btnH2" class="btn btn-info">월별2 숨기기</button>
        <button type="button" id="btnS2" class="btn btn-info">월별2 보이기</button>
        <button type="button" id="btnH3" class="btn btn-info">품목별1 숨기기</button>
        <button type="button" id="btnS3" class="btn btn-info">품목별1 보이기</button>
        <button type="button" id="btnH4" class="btn btn-info">품목별2 숨기기</button>
        <button type="button" id="btnS4" class="btn btn-info">품목별2 보이기</button>
        <div class="row mt">
          <div class="col-sm-6">
            <div class="content-panel" id="mypanel1">
                <h4><i class="fa fa-angle-right"></i> 월별1</h4>
                <div class="panel-body">
                  <div id="myGraph"></div>
                </div> 
            </div>
          </div>
          <div class="col-sm-6">
            <div class="content-panel" id="mypanel2">
                <h4><i class="fa fa-angle-right"></i> 월별2</h4>
                <div class="panel-body">
                  <div id="myBar"></div>
                </div> 
            </div>
          </div>
        </div>
        <div class="row mt">
          <div class="col-sm-6">
            <div class="content-panel" id="mypanel3">
                <h4><i class="fa fa-angle-right"></i> 품목별1</h4>
                <div class="panel-body">
                  <div id="myArea"></div>
                </div> 
            </div>
          </div>
          <div class="col-sm-6">
            <div class="content-panel" id="mypanel4">
                <h4><i class="fa fa-angle-right"></i> 품목별2</h4>
                <div class="panel-body">
                  <div id="myGraph2"></div>
                </div> 
            </div>
          </div>
        </div>
      </section>
    </section>
  </section>

  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>

  <script>
    new Morris.Line({
      element: 'myGraph',
      data: [<?php echo $data_setting; ?>],
      xkey: 'y',
      ykeys: ['a'],
      labels: ['판매량'],
      lineColors: ['#6799FF'],
      hideHover: 'auto'
    });

    new Morris.Bar({
      element: 'myBar',
      data: [<?php echo $data_setting; ?>],
      xkey: 'y',
      ykeys: ['a'],
      labels: ['판매량'],
      barColors: ['#F15F5F'],
      hideHover: 'auto'
    });

    new Morris.Line({
        element: 'myGraph2',
        data: [<?php echo $chartData; ?>],
        xkey: 'y',
        ykeys: ['drink', 'snack', 'daily_needs'],
        labels: ['Drink', 'Snack', 'Daily_needs'],
        lineColors:['#4ECDC4','#ed5565','#a9d86e'],
        hideHover: 'auto'
    });

    new  Morris.Area({
        element: 'myArea',
        data: [<?php echo $chartData; ?>],
        xkey: 'y',
        ykeys: ['drink', 'snack', 'daily_needs'],
        labels: ['Drink', 'Snack', 'Daily_needs'],
        hideHover: 'auto',
        lineWidth: 1,
        pointSize: 5,
        lineColors: ['#4a8bc2','#ff6c60','#a9d86e'],
        fillOpacity: 0.5,
        smooth: true
    });
  </script>
  <script>
    $(document).ready(function() {
      $('#btnS1').hide(); $('#btnS2').hide(); $('#btnS3').hide(); $('#btnS4').hide();

      $('#btnH1').click(function(){
        $('#mypanel1').hide(); 
        $('#btnS1').show();      
        $('#btnH1').hide(); 
      });

      $('#btnH2').click(function(){
        $('#mypanel2').hide();    
        $('#btnS2').show();      
        $('#btnH2').hide();     
      });

      $('#btnS1').click(function(){
        $('#mypanel1').show();
        $('#btnS1').hide();
        $('#btnH1').show();       
      });

      $('#btnS2').click(function(){
        $('#mypanel2').show();   
        $('#btnS2').hide();      
        $('#btnH2').show();      
      });
      
      $('#btnH3').click(function(){
        $('#mypanel3').hide(); 
        $('#btnS3').show();      
        $('#btnH3').hide(); 
      });

      $('#btnH4').click(function(){
        $('#mypanel4').hide();    
        $('#btnS4').show();      
        $('#btnH4').hide();     
      });

      $('#btnS3').click(function(){
        $('#mypanel3').show();
        $('#btnS3').hide();
        $('#btnH3').show();       
      });

      $('#btnS4').click(function(){
        $('#mypanel4').show();   
        $('#btnS4').hide();      
        $('#btnH4').show();      
      });
    });
  </script>

</body>
</html>
