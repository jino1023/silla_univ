<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start();

	require_once("./config/dbconn.php");

	$customerId = trim($_POST["customerId"]);
	$customerName = trim($_POST["customerName"]);
	$customerCall = trim($_POST["customerCall"]);
	$customerPoint = trim($_POST["customerPoint"]);

	$sql = "Update customer set customerId='$customerId', customerName='$customerName', 
	customerCall='$customerCall', customerPoint='$customerPoint' where customerId='$customerId'";

	$result = $conn->query($sql);

	echo("<script>
	alert('정상적으로 처리되었습니다.');
	location.href='customer.php';
	</script>");
	
?>