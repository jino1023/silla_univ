<? session_start(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?

	require_once("./config/dbconn.php");

	for($i = 0; $i<count($_POST["prodId"]); $i++) { 
		$prodId = $_POST['prodId'][$i];
		$branchId =0;
		$saleDate = $_POST['saleDate'];
		$saleQuantity = $_POST['saleQuantity'][$i];
		$saleTotal = $_POST['saleTotal'][$i];
		$saleHow = $_POST['saleHow'];
		
		$sql = "insert into sale ";
		$sql.= " (prodId, branchId, saleDate, saleQuantity, saleTotal, saleHow)";
		$sql.= " values( '$prodId', '$branchId', '$saleDate', '$saleQuantity','$saleTotal', '$saleHow')";

		$result = $conn->query($sql);
	}
	if ($result == 1) {
		echo("
			<script>
				alert('정상적으로 처리되었습니다.');
				location.href='sale.php';
			</script>"
		);
	}
	elseif ($result != 1) {
		echo("
			<script>
				alert('$result');
				location.href='sale.php';
			</script>"
		);
	}
	
?>