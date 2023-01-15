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
        <h4><i class="fa fa-angle-right"></i> Sale Table</h4>
        <div class="row mb">
          <!-- page start-->
          <div class="col-sm-6">
            <div class="content-panel">
              <?
                  require_once("./config/dbconn.php");
                  $sql = "select * from product where 1";
                  $result = $conn->query($sql);
              ?>
              <div class="adv-table">  
                <table cellpadding="0" cellspacing="0" class="display table table-bordered" id="hidden-table-info">
                  <thead>
                    <tr>  
                      <th class="hidden-phone">상품번호</th>
                      <th class="hidden-phone">상품이름</th>
                      <th class="hidden-phone"><i class="fa fa-bookmark"></i> 상품가격</th>
                      <th class="hidden-phone"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <?
                      while($rows = mysqli_fetch_array($result)) {
                        $prodId = $rows['prodId'];
                        $prodName = $rows['prodName'];
                        $prodPrice = $rows['prodPrice'];
                    ?>
                    <tr>
                      <td class="hidden-phone"><?=$prodId?></td>
                      <td class="hidden-phone"><?=$prodName?></td>
                      <td class="hidden-phone"><?=$prodPrice?></td>                    
                      <td class="center hidden-phone">
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal" 
                          data-id="<?=$prodId?>" data-name="<?=$prodName?>" data-price="<?=$prodPrice?>">
                          <i class="fa fa-plus"></i>
                        </button>
                      </td>
                    </tr>
                    <? } ?>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">결제 수량 확인</h4>
                          </div>
                          <div class="modal-body">
                            <input type="text" class="form-control form-control-lg" name="saleName" id="saleName" disabled>
                            <input type="text" class="form-control form-control-lg" name="salePrice" id="salePrice" disabled>
                            <input type="text" class="form-control form-control-lg" name="saleNum" id="saleNum">
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                            <button id="btnAddRow" type="button" class="btn btn-primary">추가</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="col-sm-6">
            <form action="sale_cfInsert.php" method="post">
              <table id="tbl_input" class="display table table-bordered">
                <thead>
                  <tr>
                    <th class="col-sm-2">상품번호</th>
                    <th class="col-sm-3">상품이름</th>
                    <th class="col-sm-2">상품가격</th>
                    <th class="col-sm-2">수량</th>
                    <th class="col-sm-2">합계</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td colspan="2" class="text-center">총 상품 가격 : 
                    </td>
                    <td colspan="4" id="areaSum" class="text-center">
                    </td>
                  </tr>
                  <tr>
                    <td colspan="6">
                      <input type="radio" name="saleHow" value="0" checked> Cash
                      <input type="radio" name="saleHow" value="1"> Card
                      <input type="date" name="saleDate" id="saleDate"/>
                      <button tpye="submit" class="btn btn-theme02 center" id="btnChk">결제하기</button>
                    </td> 
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
          <!-- page end-->
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
      document.getElementById('saleDate').value = new Date().toISOString().substring(0, 10);;
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
      
      var id, name, price, num, modal
      var total = 0;

      $('#myModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        id = button.data('id')
        name = button.data('name')
        price = button.data('price')
        modal = $(this)

        modal.find('#saleId').val(id) 
        modal.find('#saleName').val(name)
        modal.find('#salePrice').val(price)
      });

      $('#btnAddRow').click(function(){
        
        num = modal.find('#saleNum').val()
        $('#tbl_input > thead').append('<tr>\n\
          <td>'+id+'</td>\n\
          <td>'+name+'</td>\n\
          <td>'+price+'</td>\n\
          <td>'+num+'</td>\n\
          <td class="sumArea">'+price*num+'</td>\n\
          <input type="hidden" name="prodId[]" value="'+id+'">\n\
          <input type="hidden" name="saleQuantity[]" value="'+num+'">\n\
          <input type="hidden" name="saleTotal[]" value="'+(price*num)+'">\n\
          <td><button id="btnRemoveRow" class="btn btn-danger btn-xs"><i class="fa fa-minus"></i></button></td>\n\
        </tr>');

        total += price*num;
        $("#areaSum").html(total);
        $("#saleTotal").val(price);
        $("#saleQuantity").val(num);
        $("#prodId").val(id);

        $('#myModal').modal("hide");          
      });

      $("#btnRemoveRow").on('click', function(){
        $(this).parent().parent().remove();
      });

    });
  </script>

</body>
</html>