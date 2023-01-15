<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start(); 

	require_once("./config/dbconn.php");

	$prodId = trim($_POST["id"]);

	$sql = "Delete from product where prodId = '$prodId'";
	$result = $conn->query($sql);

	echo("<script>
			alert('정상적으로 처리되었습니다.');
			location.href='product.php';
			</script>");
?>