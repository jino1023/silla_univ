<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<? session_start(); 

	require_once("./config/dbconn.php");

	$empId = trim($_POST["empId"]);
	$empName = trim($_POST["empName"]);
	$empBirth = trim($_POST["empBirth"]);
	$empCall = trim($_POST["empCall"]);
	$empDate = $_POST["empDate"];
	$empClass = trim($_POST["empClass"]);
	$branchId = trim($_POST["branchId"]);

	$sql = "Update employee set empId='$empId', empName='$empName', empBirth='$empBirth', 
	empCall='$empCall', empDate='$empDate', empClass='$empClass', branchId='$branchId' where empId='$empId'";

	$result = $conn->query($sql);

	echo("<script>
			alert('정상적으로 처리되었습니다.');
			location.href='employee.php';
			</script>");

?>