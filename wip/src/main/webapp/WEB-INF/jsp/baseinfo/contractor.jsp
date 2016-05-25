<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!-- Page header -->
<div class="page-header">
	<div class="page-header-content">
		<div class="page-title">
			<h4>기준정보 관리</h4>

			<ul class="breadcrumb breadcrumb-caret position-right">
				<li><a href="#"><i class="icon-home2 position-left"></i>Home</a></li>
				<li><a href="#">기준정보 관리</a></li>
				<li class="active"><a href="#">발전 사업자 관리</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- /page header -->

<!-- Page container -->
<div class="page-container">

	<!-- Page content -->
	<div class="page-content"> 
		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Ajax sourced data -->
			<div class="panel panel-flat border-grey">
				<div class="panel-heading">
					<h5 class="panel-title">발전 사업자 관리</h5>
					<div class="heading-elements">
						<ul class="icons-list">
	                		<li><a data-action="collapse"></a></li>
	                		<li><a data-action="reload"></a></li>
	                		<li><a data-action="close"></a></li>
	                	</ul>
                	</div>
				</div>
				
				<div class="panel-body">
					
					<div class="text-right">
						<button type="button" id="add_btn" class="btn bg-primary" >추가</button>
						<button type="button" id="del_btn" class="btn bg-primary">삭제</button>		
					</div>
					
				</div>
			</div>
		</div>
		<!-- /main content -->
	</div>
	<!-- /page content -->	
</div>
<!-- /page container -->

<script type="text/javascript">

var Modal = function(title, div_id, type) {
	this.title = title;
	this.div_id = div_id;
	this.type = type;
};

Modal.prototype.open = function() { 
	switch( this.type ) {
	case "save":
		$("#add_action_btn").html("추가").data("type", "save");
		$("#" + this.div_id).modal();
		break;
	case "update":
		$("#add_action_btn").html("수정").data("type","update");
		$("#" + this.div_id).modal();
		break;
	default:
		break;
	}
};

Modal.prototype.setData = function(curDataSet) {
	$.each(curDataSet, function(key, value) {			
		$("#"+key).val(curDataSet[key]);
	});
	$("#tel1").select2("val", curDataSet["tel1"]);
};

Modal.prototype.clearFields = function() {
	$(".data-field").each(function() {
		$(this).val("");
		$("#tel1").select2("val", ""); 
	});
};

var myModal = new Modal("발전관리자", "", "");

var Btn = {	
	init: function() {
		this.addBtn();
		this.delBtn();
	},
	addBtn: function() {
		$("#add_btn").on("click", function() {
			myModal.div_id = "add_form_modal";
			myModal.type = "save";
			myModal.clearFields();
			myModal.open();
		});
	},
	delBtn: function() {
		$("#del_btn").on("click", function() {
			var selRowIds = $("#list").jqGrid('getGridParam', 'selarrrow');
			
			if(selRowIds.length != 0) {
				$.ajax({
					url: "${pageContext.request.contextPath}/baseinfo/contractor/delete/" + selRowIds,
					type:"POST",
					success: function() {
						$("#list").trigger("reloadGrid");
					},
					error: function(a) {
						alert(a.status);
					}
				});
			} else {
				alert("삭제 할 항목 선택 해주세요");
			}
		});
	}
};


$(document).ready(function() {
	$("<div>").load("${pageContext.request.contextPath}/modal/baseinfo/contractor", function() {
		//$(this).find("#add_form_modal").attr("id", "add_from_modal" + "_0");
		$(".page-content").append($(this).html());
	});
	
	$("<div>").load("${pageContext.request.contextPath}/grid/baseinfo/contractor", function() {
		//$(this).find("#add_form_modal").attr("id", "add_from_modal" + "_0");
		$(".panel-body").prepend($(this).html());
	});
			
    Btn.init();
});

</script>