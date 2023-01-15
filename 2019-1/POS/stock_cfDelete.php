<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start();

	require_once("./config/dbconn.php");

	$prodId = trim($_POST["id"]);

	$sql = "Delete from stock where prodId = '$prodId'";
	$result = $conn->query($sql);

	echo("<script>
			alert('제고삭제 완료');
			location.href='stock.php';
			</script>");
?>