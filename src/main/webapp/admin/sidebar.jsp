
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${pageContext.request.contextPath}/admin/">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			BookStore <sup>r</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin/">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Chức năng</div>
	<!-- Nav Item  -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list_users"> <i
			class="fas fa-fw fa-chart-area"></i> <span>Tài khoản</span></a></li>

	<!-- Nav Item  -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list_category"> <i
			class="fas fa-fw fa-table"></i> <span>Danh mục</span></a></li>
			
	<!-- Nav Item  -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list_books"> <i
			class="fas fa-fw fa-table"></i> <span>Quản lý sách</span></a></li>
			
	<!-- Nav Item  -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list_customer"> <i
			class="fas fa-fw fa-table"></i> <span>Quản lý khách hàng</span></a></li>
	
	<!-- Nav Item  -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list_review"> <i
			class="fas fa-fw fa-table"></i> <span>Quản lý Review</span></a></li>
			
	<!-- Nav Item  -->
	<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list_order"> <i
			class="fas fa-fw fa-table"></i> <span>Quản lý đơn hàng</span></a></li>				

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>



</ul>
<!-- End of Sidebar -->