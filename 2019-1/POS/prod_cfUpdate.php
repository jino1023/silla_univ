<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start();

	require_once("./config/dbconn.php");

	$prodId = trim($_POST["prodId"]);
	$prodName = trim($_POST["prodName"]);
	$prodPrice = trim($_POST["prodPrice"]);
	$expirationDate = $_POST["expirationDate"];
	$prodCompany = trim($_POST["prodCompany"]);

	$sql = "Update product set prodName='$prodName', prodPrice='$prodPrice', 
	expirationDate='$expirationDate', prodCompany='$prodCompany' where prodId='$prodId'";
	$result = $conn->query($sql);

	echo("<script>
			alert('정상적으로 처리되었습니다.');
			location.href='product.php';
			</script>");

?>