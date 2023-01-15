<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start();

	require_once("./config/dbconn.php");

	$prodId = trim($_POST["prodId"]);
	$quantity= trim($_POST["quantity"]);

	$sql = "insert into stock ";
	$sql.= " (prodId, quantity)";
	$sql.= " values( '$prodId', '$quantity')";

	$result = $conn->query($sql);

	echo("<script>
			alert('재고등록 완료');
			location.href='stock.php';
			</script>");
?>