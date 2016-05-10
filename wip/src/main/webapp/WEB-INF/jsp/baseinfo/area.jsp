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
				<li class="active"><a href="#">발전단지 관리</a></li>
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
					<h5 class="panel-title">발전단지 관리</h5>
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
			
			
			<div id="add_form_modal" class="modal fade">
			<!-- modal -->
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header bg-info-600">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h5 class="modal-title">발전단지 추가</h5>
						</div>
						
						<div class="modal-body">
							<div class="panel panel-flat">												
								<div class="panel-body">
									<form class="form-group" action="#">	
										<input type="hidden" id="id" name="id" class="data-field">
										<div class="row">
											<div class="col-md-6">												
												<div class="form-group">
													<label>발전단지명</label>
													<div class="input-group">
														<span class="input-group-addon"><i class="icon-user"></i></span>
														<input id="name" name="name" type="text" class="form-control data-field" placeholder="발전단지명">
													</div>
												</div>
					
												<div class="form-group"> 
													<label>용량</label>
													<input id="capacity" name="capacity" type="text" class="form-control data-field" placeholder="용량">												
												</div>
						
												<div class="form-group"> 
													<label>비고</label>
													<input id="description" name="description" type="text" class="form-control data-field" placeholder="비고">												
												</div>			
												
											</div>
											
											<div class="col-md-6">
														
												<div class="form-group">
													<label>우편번호</label>
													<div class="row mb-15">
														<div class="col-md-8">
															<input id="postcode" type="text" class="form-control data-field" readonly="readonly" name="postcode" placeholder="우편번호">
														</div>
														<div class="col-md-4">
															<input type="button" class="btn btn-warning postCodeSearch" value="우편번호 검색">
														</div>			
													</div>
												</div>
												
												<div class="form-group">
													<label>주소</label>
													<input id="address" type="text" class="form-control mb-5 data-field" readonly="readonly" name="address" placeholder="주소1">
													<input id="addressDetail" type="text" class="form-control data-field" name="addressDetail" placeholder="주소2">
												</div>							
											</div>		
										</div>
									</form>
								</div>
							</div>
							<!-- modal body -->
							<div class="modal-footer">
								<button type="button" id="add_modal_btn" class="btn btn-link" data-dismiss="modal">닫기</button>
								<button type="submit" id="add_action_btn" class="btn btn-primary"></button>
							</div>
						</div>
						<!-- modal content -->
					</div>						
					<!-- modal dialog -->
				</div>
				<!-- /input group addons -->
			</div>
		</div>
		<!-- /main content -->
	</div>
	<!-- /page content -->	
</div>
<!-- /page container -->

<script type="text/javascript">
$(document).ready(function() {
	$("#add_action_btn").on("click", function() {
		var type = $("#add_action_btn").data("type");
		
		console.log(JSON.stringify($("form").serializeArray()));
		
		switch (type) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
		case "save":			
			$.ajax({
				url: "${pageContext.request.contextPath}/baseinfo/area/save",
				type: "POST",
				data: $( "form" ).serializeArray(),
				success: function(result) {
					$('#add_form_modal').modal('toggle');
					$("#list").trigger("reloadGrid");
				}, 
				error: function(a) {
					alert("save "+ a.status);
				}
			}); 
			
			break;
		case "update":
			$.ajax({
				url: "${pageContext.request.contextPath}/baseinfo/area/update",
				type: "POST",
				data: $( "form" ).serializeArray(),
				success: function(result) {
					$('#add_form_modal').modal('toggle');
					$("#list").trigger("reloadGrid");
				}, 
				error: function(a) {
					alert(a.status);
				}
			}); 
			
			break;
		default:
			break;
		}
	});
	
	$.extend($.jgrid.defaults, { 
    	autowidth:true
    });
	
    $("#list").jqGrid({
    	url:"${pageContext.request.contextPath}/baseinfo/area/jqgrid",    	
		datatype : "json",		
		colNames:['id', '발전단지명', '우편번호', '주소', '용량', '비고', 'address', 'addressDetail'],
		colModel:[
		          {name:'id',index:'id', hidden: true, viewable: true,editrules:{edithidden:true} },
		          {name:'name',index:'name', width:50, align:'center', editable:false},
		          {name:'postcode',index:'postcode', width:50, align:'center', editable:false},
		          {name:'addedAddress',index:'addedAddress', width:120, align:'center', editable:true},
		          {name:'capacity',index:'capacity', width:50, align:'center', editable:true},
		          {name:'description',index:'description', width:160, align:'center'},
		          {name:'address', index:'address', hidden: true, viewable: true,editrules:{edithidden:true} },
		          {name:'addressDetail', index:'addressDetail', hidden: true, viewable: true,editrules:{edithidden:true} }
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
			Modal.open("add_form_modal", "update");
			Modal.setData($(this).getRowData(rowId));
		},
		loadComplete: function(data) {
			
		},
		onPaging: function(action){     //paging 부분의 버튼 액션 처리  first, prev, next, last, records
			if(action == 'next'){				
				//uf_getData(g_gubun,currPage);
			}
	    },
		//recordtext: "View {0} - {1} of {2}",
        //emptyrecords: "No records to view",
		//loadtext: "Loading...",
		//pgtext : "Page {0} of {1}",
		//shrinkToFit:true,
		height:280, 
		rowNum:10,
		rowList:[10,20,30],
		pager: "#pager",
		sortname: 'name',
		viewrecords: true,
		sortorder: "asc",
		editurl:"/jqGridModel?model=Wine",
		autowidth:true,
		multiselect: true,
		search: false
	})
	.navGrid('#pager', {add: false, edit: false, del: false, search: false, refresh: true})
    /* .navButtonAdd('#pager',{
   	   caption:"추가", 
   	   buttonicon:"ui-icon-plus", 
   	   onClickButton: function(){ 
   	     alert("Adding Row");
   	   }, 
   	   position:"last"
   	})
   	.navButtonAdd('#pager',{
   	   caption:"삭제", 
   	   buttonicon:"ui-icon-trash", 
   	   onClickButton: function(){ 
   	      alert("Deleting Row");
   	   }, 
   	   position:"last"
   	}) */
   	;
    resizeJqGridWidth("list", "panel-body");
    Btn.addBtn();
    Btn.delBtn();
});

var Modal = {
	
	open: function(id, type) {		
		switch (type) {
		case "save":
			$(".modal-title").html("발전단지 추가");
			$("#add_action_btn").html("추가");
			$("#add_action_btn").data("type", "save");
			break;
		case "update":
			$(".modal-title").html("발전단지 수정");
			$("#add_action_btn").html("수정"); 
			$("#add_action_btn").data("type","update");
			break;
		default:
			break;
		}
		$("#" + id).modal();
	},
	setData: function(curDataSet) {
		$.each(curDataSet, function(key, value) {			
			$("#"+key).val(curDataSet[key]);
		});
		$("#tel1").select2("val", curDataSet["tel1"]);
	},
	clearFields: function() {
		$(".data-field").each(function() {
			$(this).val("");
			$("#tel1").select2("val", "");
		});
	}
};

var Btn = {
	addBtn: function() {
		$("#add_btn").on("click", function() {
			Modal.clearFields();
			Modal.open("add_form_modal","save");
		});
	},
	delBtn: function() {
		$("#del_btn").on("click", function() {
			var selRowIds = $("#list").jqGrid('getGridParam', 'selarrrow');
			
			if(selRowIds.length != 0) {
				$.ajax({
					url: "${pageContext.request.contextPath}/baseinfo/area/delete/" + selRowIds,
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