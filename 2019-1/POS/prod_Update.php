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
        <h3><i class="fa fa-angle-right"></i> Product Table</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> Product Insert</h4>
            <? 
              require_once("./config/dbconn.php");
              $prodId = trim($_POST["id"]);
              $sql = "select * from product where prodId='$prodId'";
              $result = $conn->query($sql);

              while($rows = mysqli_fetch_array($result)) {
                $prodId = $rows['prodId'];
                $prodName = $rows['prodName'];
                $prodPrice = $rows['prodPrice'];
                $expirationDate = $rows['expirationDate'];
                $prodCompany = $rows['prodCompany'];
            ?>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" method="post" action="prod_cfUpdate.php">
                  <div class="form-group ">
                    <label for="prodName" class="control-label col-lg-2">Name</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="prodName" name="prodName" type="text" value="<?=$prodName?>" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="prodPrice" class="control-label col-lg-2">Price</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="prodPrice" name="prodPrice" type="text" value="<?=$prodPrice?>" />
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="expirationDate" class="control-label col-lg-2">Date</label>
                    <div class="col-lg-10">
                      <input class="form-control" value='<?=$expirationDate?>' name="expirationDate" type="date" value="<?=$expirationDate?>" />
                    </div>
                  </div>

                  <div class="form-group ">
                    <label for="prodCompany" class="control-label col-lg-2">Company</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="prodCompany" name="prodCompany" type="text" value="<?=$prodCompany?>" />
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button class="btn btn-theme" type="submit">Update</button>
                      <input type="hidden" name="prodId" value="<?=$prodId?>">
                      <button class="btn btn-theme04" type="button" onclick="back();">Cancel</button>
                    </div>
                  </div>
                </form>
              <? } ?>
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