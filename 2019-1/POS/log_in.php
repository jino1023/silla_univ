<? session_start();
/*
 * 파일명: log_in.php
 * 버전번호: 1.0.0
 * 작성자명: 박진오
 * 프로젝트명: PosService
 * 연관 페이지: index, log_out
 * 기능설명: index페이지의 모달창에서 넘어온 아이디와 패스워드 값으로 
	관리자인지 확인하고 세션변수 ss_logged에 logged_in값을 할당시킴(로그인 확인용)
*/
?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<?
	//미리 해둔 DB연결 설정을 불러옴
	include "./config/dbconn.php";
	
	//해당 변수에 앞페이지에서 넘긴 값을 할당함
	$user_name = $_POST['username'];
    $user_pw = $_POST['userpw'];
	
	//넘겨받은 아이디와 패스워드로 해당 관리자가 있는지 확인하는 sql쿼리
	$sql = " select * from root ";
	$sql .= " where rootId='$user_name' and rootPw='$user_pw' ";
	$sql .= " limit 1";
	
	//dbconn.php에서 해둔 연결설정으로 쿼리 실행
	$result = $conn->query($sql);

	//쿼리 결과가 있는경우
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		//사용자가 입력한 패스워드와 db의 패스워드를 비교
		//같을시
		if($user_pw == $row['rootPw']){
			//세션변수를 활성화하고 index페이지로 전환
			$_SESSION['ss_logged'] = 'logged_in';
			?>
            <script>
			location.replace('/index.php');
			</script>
            <?
		}
		//다를시
		else{
			//오류를 보여주고 이전페이지로 돌아감
			echo('<script>
				alert("비밀번호 오류");
				history.back();
				</script>'
			);
		}
	}
	//쿼리 결과가 없는경우 => 오류를 보여주고 이전페이지로 돌아감
	else{
		echo('<script>
			alert("아이디 오류");
			history.back();
			</script>'
		);
		session_destroy();
	}
	//연결종료
	$conn->close();
?>
