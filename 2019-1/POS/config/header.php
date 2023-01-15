<?
/*
 * 파일명: header.php
 * 버전번호: 1.0.0
 * 작성자명: 박진오
 * 프로젝트명: PosService
 * 연관 페이지: 모든 페이지
 * 기능설명: index페이지의 모달창에서 넘어온 아이디와 패스워드 값으로 
    관리자인지 확인하고 세션변수 ss_logged에 logged_in값을 할당시킴(로그인 확인용)
*/
?>
<section id="container">
    <!-- 페이지 상단에 위치할 내용 -->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <a href="index.php" class="logo"><b>POS<span>System</span></b></a>
        <div class="top-menu">
        <ul class="nav pull-right top-menu">
            <!-- 세션변수를 통해 로그인하지 않은 상태의 경우 Login이 보이고, 
                로그인 한 상태일 경우 Logout이 보이도록 설정 -->
            <li>
            <?
                if($_SESSION['ss_logged'] != 'logged_in'){
            ?>
                <a href="#loginModal" data-toggle="modal" class="logout">Login</a>
            <?
            }
            ?>
            <?
                if($_SESSION['ss_logged'] == 'logged_in'){ 
            ?>
                <a href="/log_out.php" class="logout">Logout</a>
            <?
                }
            ?>
            </li>
        </ul>
        </div>
    </header>
    <!-- 페이지 좌측에 위치할 슬라이드바 -->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <ul class="sidebar-menu" id="nav-accordion">
                <!-- 슬라이드바를 클릭하면 나오는 서브메뉴 -->
                <li class="sub-menu">
                    <a href="javascript:;">
                    <i class="fa fa-tasks"></i>
                    <span>Product</span>
                    </a>
                    <ul class="sub">
                    <li>
                    <!-- 상품을 관리할 수 있는 페이지 -->
                        <a href="product.php" onclick="return checkAdmin();">Product Management</a>
                    </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                    <i class="fa fa-th"></i>
                    <span>Stock</span>
                    </a>
                    <ul class="sub">
                    <li>
                    <!-- 재고를 확인하고 관리 할 페이지 -->
                        <a href="stock.php" onclick="return checkAdmin();">Stock Management</a>
                    </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                    <i class="fa fa-user"></i>
                    <span>Employee</span>
                    </a>
                    <ul class="sub">
                    <li>
                    <!-- 직원을 관리할 수 있는 페이지 -->
                        <a href="employee.php" onclick="return checkAdmin();">Employee Management</a>
                    </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                    <i class="fa fa-users"></i>
                    <span>Customer</span>
                    </a>
                    <ul class="sub">
                    <li>
                    <!-- 고객을 관리할 수 있는 페이지 -->
                        <a href="customer.php" onclick="return checkAdmin();">Customer Management</a>
                    </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                    <i class="fa fa-money"></i>
                    <span>Sale</span>
                    </a>
                    <ul class="sub">
                        <li>
                        <!-- 상품을 선택, 수량을 입력하여 결제처리를 할 수 있는 페이지 -->
                            <a href="sale.php" onclick="return checkAdmin();">Sale Management</a>
                        </li>
                        <li>
                        <!-- 결제처리를 한 목록을 불러와 볼 수 있는 페이지 -->
                            <a href="sale_list.php" onclick="return checkAdmin();">Show Sale_List</a>
                        </li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                    <i class="fa fa-bar-chart"></i>
                    <span>Stats</span>
                    </a>
                    <ul class="sub">
                        <li>
                        <!-- 결제목록을 바탕으로 월별, 품목별 매출 통계를 그래프로 확인할 수 있는 페이지 -->
                            <a href="show_chart.php" onclick="return checkAdmin();">Show Stats</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </aside>