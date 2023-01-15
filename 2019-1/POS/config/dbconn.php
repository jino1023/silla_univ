<?php
/*
* 파일명: dbconn.php
* 버전번호: 1.0.0
* 작성자명: 박진오
* 프로젝트명: PosService
* 연관 페이지: db에 연결하는 모든 페이지
* 기능설명: db연결 설정을 바탕으로 db에 연결을 시도함
*/
$servername = "localhost";
$username = "root";
$password = "1234";
$dbName = 'project';
// 해당설정으로 DB에 연결함
$conn = new mysqli($servername, $username, $password, $dbName);
mysqli_set_charset($conn, "utf8");
// 연결을 확인함, 연결에 실패한 경우 에러를 보여줌
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
// echo "Connected successfully";
?>