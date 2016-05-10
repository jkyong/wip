<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Main navbar -->
	<div class="navbar navbar-inverse bg-blue-600">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }">
				<span>블레이드 영상진단 시스템 <span class="label label-inline position-right bg-success-400">v 0.1</span></span>
			</a>

			<ul class="nav navbar-nav pull-right visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
				<li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li>
					<a class="sidebar-control sidebar-main-toggle hidden-xs" data-popup="tooltip" title="Collapse main" data-placement="bottom" data-container="body">
						<i class="icon-paragraph-justify3"></i>
					</a>
				</li>
			</ul>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown dropdown-user">
					<a class="dropdown-toggle" data-toggle="dropdown">
						<img src="${pageContext.request.contextPath }/resources/assets/images/placeholder.jpg" alt="">
						<span>김성훈</span>
						<i class="caret"></i>
					</a>

					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="#"><i class="icon-user-plus"></i> My profile</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-switch2"></i> Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->

	<!-- Second navbar -->
	<div class="navbar navbar-default" id="navbar-second">
		<ul class="nav navbar-nav no-border visible-xs-block">
			<li><a class="text-center collapsed" data-toggle="collapse" data-target="#navbar-second-toggle"><i class="icon-menu7"></i></a></li>
		</ul>

		<div class="navbar-collapse collapse" id="navbar-second-toggle">
			<ul class="nav navbar-nav">
				<!-- <li><a href="index.html"><i class="icon-display4 position-left"></i> Dashboard</a></li> -->

				<li class="dropdown mega-menu mega-menu-wide">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-puzzle4 position-left"></i> 기준정보 관리 <span class="caret"></span></a>

					<div class="dropdown-menu dropdown-content">
						<div class="dropdown-content-body">
							<div class="row">
								<div class="col-md-3">									
									<span class="menu-heading underlined"><b>기준정보 관리</b></span>
									<ul class="menu-list"> 
										<li>
											<a href="${pageContext.request.contextPath }/baseinfo/contractor"><i class="icon-primitive-dot text-size-8px"></i> 발전 사업자 관리</a>											
										</li> 
										<li>
											<a href="${pageContext.request.contextPath }/baseinfo/area"><i class="icon-primitive-dot text-size-8px"></i> 발전 단지 관리</a>											
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/baseinfo/generator"><i class="icon-primitive-dot text-size-8px"></i> 발전기 관리</a>											
										</li>
										<li>
											<a href="${pageContext.request.contextPath }/baseinfo/blade"><i class="icon-primitive-dot text-size-8px"></i> 블레이드 관리</a>											
										</li>
										<li>
											<a href="#"><i class="icon-primitive-dot text-size-8px"></i> 손상 카테고리 관리</a>											
										</li>
										<li>
											<a href="#"><i class="icon-primitive-dot text-size-8px"></i> 손상 클래스 관리</a>											
										</li>										
									</ul>
								</div>			
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- /second navbar -->