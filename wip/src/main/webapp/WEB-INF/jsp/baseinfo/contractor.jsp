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
					<div class="mb-20">
						<table class="jqgrid_list" id="list"><tr><td></td></tr></table> 
    					<div id="pager"></div>
					</div>
					
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

var GridObj = {
	init: function(divId) {
		$("#list").jqGrid({
	    	url:"${pageContext.request.contextPath}/baseinfo/contractor/jqgrid",    	
			datatype : "json",		
			colNames:['발전사업자명', '전화번호', 'Email', '우편번호', '담당자', '주소', '비고','id', 'address','tel1','tel2','tel3','addressDetail'],
			colModel:[
			          {name:'name',index:'name', width:80, align:'center', editable:false},
			          {name:'tel',index:'tel', width:100, align:'center', editable:false, editoptions:{readonly:true,size:10}},
			          {name:'email',index:'email', width:100, align:'center', editable:true},
			          {name:'postcode',index:'postcode', width:80, align:'center', editable:true},
			          {name:'manager',index:'manager', width:80, align:'center', editable:true},
			          {name:'addedAddress',index:'address', align:'left', editable:true}, 
			          {name:'description',index:'description', width:60, align:'center'}, 
			          {name:'id',index:'id', hidden: true, viewable: true,editrules:{edithidden:true} },
			          {name:'address', index:'address', hidden: true, viewable: true,editrules:{edithidden:true} },
			          {name:'addressDetail', index:'addressDetail', hidden: true, viewable: true,editrules:{edithidden:true} },
			          {name:'tel1', index:'tel1', hidden: true, viewable: true,editrules:{edithidden:true} },
			          {name:'tel2', index:'tel2', hidden: true, viewable: true,editrules:{edithidden:true} },
			          {name:'tel3', index:'tel3', hidden: true, viewable: true,editrules:{edithidden:true} }
			     ],
			jsonReader : {
				/* default */
				root:"rows",
		        page: "page",
		        total: "total",
				records: "records",
				/* default */
			    repeatitems:false
			},
			ondblClickRow: function(rowId) {
				myModal.open("add_form_modal", "update");
				myModal.setData($(this).getRowData(rowId));
			},
			loadComplete: function(data) {
				
			},
			height:280, 
			rowNum:10,
			rowList:[10,20,30],
			pager: "#pager",
			sortname: 'name',
			viewrecords: true,
			sortorder: "asc",
			autowidth:true,
			multiselect: true,
			search: false
		})
		.navGrid('#pager', {add: false, edit: false, del: false, search: false, refresh: true});
	}
};

$(document).ready(function() {
	
	myModal
	
	$("<div>").load("${pageContext.request.contextPath}/modal/baseinfo/contractor", function() {
		$(this).find("#add_form_modal").attr("id", "add_from_modal" + "_0");
		$(".page-content").append($(this).html());
	});
			
    resizeJqGridWidth("list", "panel-body");
    Btn.addBtn();
    Btn.delBtn();
    GridObj.init();
});



function resizeJqGridWidth(grid_id, div_id) {
    // window에 resize 이벤트를 바인딩 한다.
    $(window).bind('resize', function() {
        // 그리드의 width 초기화
		$('#' + grid_id).setGridWidth(0, false);
        // 그리드의 width를 div 에 맞춰서 적용
		$('#' + grid_id).setGridWidth($('.' + div_id).width() , true); //Resized to new width as per window
	}).trigger('resize');
}
</script>