<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start();

	require_once("./config/dbconn.php");

	$customerId = trim($_POST["customerId"]);
	$customerName = trim($_POST["customerName"]);
	$customerCall = trim($_POST["customerCall"]);
	$customerPoint = trim($_POST["customerPoint"]);

	$sql = "insert into customer ";
	$sql.= " (customerId, customerName, customerCall, customerPoint)";
	$sql.= " values( '$customerId', '$customerName', '$customerCall', '$customerPoint')";
	
	$result = $conn->query($sql);

	echo("<script>
			alert('정상적으로 처리되었습니다.');
			location.href='customer.php';
			</script>");

?>