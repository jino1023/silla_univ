<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start(); 

	require_once("./config/dbconn.php");

	$prodId = trim($_POST["prodId"]);
	$quantity = trim($_POST["quantity"]);

	$sql = "Update stock set quantity='$quantity' where prodId='$prodId'";
	$result = $conn->query($sql);

	echo("<script>
			alert('재고수정 완료');
			location.href='stock.php';
			</script>");
?>