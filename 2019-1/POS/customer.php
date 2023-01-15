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
              <table cellpadding="0" cellspacing="0" class="display table table-bordered" id="hidden-table-info">
                <h4><i class="fa fa-angle-right"></i> Customer Table</h4>
                <button class="btn btn-success btn-xs col-md-1 col-md-offset-11" 
                        onclick="location.href='cus_Insert.php'"><i class="fa fa-plus"></i></button>
                <thead>
                  <tr>
                    <th>회원번호</th>
                    <th>회원이름</th>
                    <th><i class="fa fa-phone"></i> 전화번호</th>
                    <th><i class="fa fa-heart"></i> 적립포인트</th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <?
                  require_once("./config/dbconn.php");
                  $sql = "select * from customer where 1 order by customerId";
                  $result = $conn->query($sql);

                  while($rows = mysqli_fetch_array($result)) {
                    $customerId = $rows['customerId'];
                    $customerName = $rows['customerName'];
                    $customerCall = $rows['customerCall'];
                    $customerPoint = $rows['customerPoint'];
                ?>
                  <tr>
                    <td><?=$customerId?></td>
                    <td><?=$customerName?></td>
                    <td><?=$customerCall?></td>
                    <td><?=$customerPoint?></td>                     
                    <td>
                      <form action="cus_Update.php" method="post">
                        <button class="btn btn-primary btn-xs" name="id" value="<?=$customerId?>" type="submit">
                          <i class="fa fa-pencil"></i>
                        </button>
                      </form>
                    </td>
                    <td>
                      <form action="cus_cfDelete.php" method="post">
                        <button class="btn btn-danger btn-xs" name="id" value="<?=$customerId?>" type="submit">
                          <i class="fa fa-trash-o "></i>
                        </button> 
                      </form>     
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