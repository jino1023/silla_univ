<? session_start();
/*
 * 파일명: log_out.php
 * 버전번호: 1.0.0
 * 작성자명: 박진오
 * 프로젝트명: PosService
 * 연관 페이지: index, log_in
 * 기능설명: 세션을 종료시켜 로그인정보를 초기화함
*/
	session_destroy();
?>
<script>
	location.replace('/index.php');
</script>