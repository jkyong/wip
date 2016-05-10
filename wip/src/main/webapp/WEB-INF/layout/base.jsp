<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>WIP</title>

	<link rel="icon" href="https://svn.apache.org/repos/asf/lucene.net/tags/Lucene.Net_2_9_4_RC3/branding/logo/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="https://svn.apache.org/repos/asf/lucene.net/tags/Lucene.Net_2_9_4_RC3/branding/logo/favicon.ico" type="image/x-icon"> 

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/assets/css/minified/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/assets/css/minified/core.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/assets/css/minified/components.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/assets/css/minified/colors.min.css" rel="stylesheet" type="text/css">
	
	<link href="${pageContext.request.contextPath }/resources/css/jqGrid/ui.jqgrid.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/jqueryui/jquery-ui.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/loaders/blockui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/ui/nicescroll.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/ui/drilldown.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/forms/selects/bootstrap_select.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/ui/prism.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/forms/selects/select2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/forms/styling/uniform.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/tables/datatables/datatables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/tables/datatables/datatables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/tables/datatables/extensions/col_vis.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/plugins/tables/datatables/extensions/tools.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/core/app.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/pages/form_layouts.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/pages/form_bootstrap_select.js"></script> --%>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/pages/datatables_data_sources.js"></script> --%>
	
	<!-- /theme JS files -->
	
	<!-- daum post code search -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
	<script src="${pageContext.request.contextPath }/resources/js/post_code.js" type="text/javascript" ></script>
	
	<!-- jqGrid -->
	<script src="${pageContext.request.contextPath }/resources/js/jqGrid/i18n/grid.locale-kr.js" type="text/javascript" ></script>
	<script src="${pageContext.request.contextPath }/resources/js/jqGrid/jquery.jqGrid.min.js" type="text/javascript" ></script>
		
	<link href="${pageContext.request.contextPath }/resources/css/default.css" rel="stylesheet" type="text/css">
	
</head>
<body>
 
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="body" />
	
	<tiles:insertAttribute name="footer" />
	
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".postCodeSearch").on("click", function() {
			var postCode = new PostCode();
			postCode.open();
		});
	});

</script>
</body>
</html>