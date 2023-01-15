<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start();

	require_once("./config/dbconn.php");

	$customerId = trim($_POST["id"]);

	$sql = "Delete from customer where customerId = '$customerId'";
	$result = $conn->query($sql);

	echo("<script>
			alert('정상적으로 처리되었습니다.');
			location.href='customer.php';
			</script>");

?>