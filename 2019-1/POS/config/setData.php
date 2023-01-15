<?php
/*
 * 파일명: setData.php
 * 버전번호: 1.0.0
 * 작성자명: 박진오
 * 프로젝트명: PosService
 * 연관 페이지: show_chart
 * 기능설명: 월별, 품목별 매출통계를 조회하는 sql쿼리 결과를 
    차트를 만드는데 쓸 chartData라는 이름의 문자열에 입력
*/
    //db연결 설정을 하는 페이지
    include "dbconn.php";

    //차트를 만들 데이터 초기화
    $chartData = "";
    for ($i=1; $i <= 12 ; $i++) { 
        $chartData .= "{ y: '$i"."월', ";
        for($j=0; $j < 3 ; $j++){
            switch ($j) {
                case '0':
                    $cateName = "drink";
                    break;
                case '1':
                    $cateName = "snack";
                    break;
                case '2':
                    $cateName = "daily_needs";
                    break;
                default:
                    break;
                }
            //쿼리문 작성   
            $sql = "select MONTH(saleDate) as 'month', cateName, sum(saleTotal) as 'saleTotal'";
            $sql .= " from sale join product on (sale.prodId=product.prodId) join category on (product.cateId=category.cateId)";
            $sql .= " group by month, cateName";
            $sql .= " having month='$i' and cateName='$cateName'";
            $result = $conn->query($sql);
            $rows = mysqli_fetch_array($result);
            //값이 없을 경우 기본값 세팅
            if ($rows['month']=="" || $rows['saleTotal']=="" || $rows['cateName']=="") {
                $rows['month'] = "1";
                $rows['cateName'] = "$cateName";
                $rows['saleTotal'] = "0";
            }
            $chartData .= "$cateName: ".$rows['saleTotal'].",";
        }
        $chartData = substr($chartData, 0, -1);
        $chartData .= "},";
    }
?>