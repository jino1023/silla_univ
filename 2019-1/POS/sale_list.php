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
  <link href="lib/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="lib/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="lib/advanced-datatable/css/DT_bootstrap.css" />
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
        <div class="row mt">
          <div class="col-sm-12">
            <div class="content-panel">
              <div class="adv-table">
            <? 
              require_once("./config/dbconn.php");
              $sql = "select sale.* , product.prodName, branchName from sale, product, branch 
              where sale.prodId = product.prodId and branch.branchId = sale.branchId";
              $result = $conn->query($sql);
            ?>
              <table cellpadding="0" cellspacing="0" class="display table table-bordered" id="hidden-table-info">
                <thead>
                  <tr>
                    <!-- <th class="hidden-phone">판매번호</th> -->
                    <th class="hidden-phone">상품번호</th>
                    <th class="hidden-phone">상품이름</th>
                    <th class="hidden-phone"><i class="fa fa-bookmark"></i> 지점번호</th>
                    <th class="hidden-phone"><i class="fa fa-bookmark"></i> 지점이름</th>
                    <th class="hidden-phone"><i class="fa fa-calendar"></i> 판매일자</th>
                    <th class="hidden-phone"><i class="fa fa-bullhorn"></i> 판매수량</th>
                    <th class="hidden-phone"><i class="fa fa-bullhorn"></i> 판매합계</th>
                    <th class="hidden-phone"><i class="fa fa-bullhorn"></i> 결제방법</th>
                  </tr>
                </thead>
                <tbody>
                <? 
                  while($rows = mysqli_fetch_array($result)) {
                    // $saleId = $rows['saleId'];
                    $prodId = $rows['prodId'];
                    $prodName = $rows['prodName'];
                    $branchId = $rows['branchId'];
                    $branchName = $rows['branchName'];
                    $saleDate = $rows['saleDate'];
                    $saleQuantity = $rows['saleQuantity'];
                    $saleTotal = $rows['saleTotal'];
                    $saleHow = $rows['saleHow'];
                ?>
                  <tr>
                    <!-- <td class="hidden-phone"><?=$saleId?></td> -->
                    <td class="hidden-phone"><?=$prodId?></td>
                    <td class="hidden-phone"><?=$prodName?></td>
                    <td class="hidden-phone"><?=$branchId?></td>
                    <td class="hidden-phone"><?=$branchName?></td>
                    <td class="hidden-phone"><?=$saleDate?></td>
                    <td class="hidden-phone"><?=$saleQuantity?></td>
                    <td class="hidden-phone"><?=$saleTotal?></td>
                    <td class="hidden-phone"> <?
                        if ($saleHow == '0') {
                      ?>
                        cash
                      <?
                        }
                        else if ($saleHow == '1') {
                      ?>
                        card
                      <?
                        }
                      ?>
                    </td>
                  </tr>
                <? } ?>
                </tbody>
              </table>
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
  <script type="text/javascript" language="javascript" src="lib/advanced-datatable/js/jquery.dataTables.js"></script>
  <script type="text/javascript" src="lib/advanced-datatable/js/DT_bootstrap.js"></script>

  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>

  <!--script for this page-->
  <script type="text/javascript">
    $(document).ready(function() {
      /*
       * Insert a 'details' column to the table
       */
      var nCloneTh = document.createElement('th');
      var nCloneTd = document.createElement('td');

      $('#hidden-table-info thead tr').each(function() {
        this.insertBefore(nCloneTh, this.childNodes[0]);
      });

      $('#hidden-table-info tbody tr').each(function() {
        this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
      });

      /*
       * Initialse DataTables, with no sorting on the 'details' column
      */
      var oTable = $('#hidden-table-info').dataTable({
        "aoColumnDefs": [{
          "bSortable": false,
          "aTargets": [0]
        }],
        "aaSorting": [
          [1, 'asc']
        ]
      });
    });
  </script>
</html>
