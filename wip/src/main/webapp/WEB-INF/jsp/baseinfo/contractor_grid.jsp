<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">

var GridObj = {
	init: function(divId) {
		$("#contractor_grid").jqGrid({
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
			pager: "#contractor_pager",
			sortname: 'name',
			viewrecords: true,
			sortorder: "asc",
			autowidth:true,
			multiselect: true,
			search: false
		})
		.navGrid('#contractor_pager', {add: false, edit: false, del: false, search: false, refresh: true});
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

$(document).ready(function() {
	GridObj.init();

    resizeJqGridWidth("list", "panel-body");
});

</script>
    
<div class="mb-20">
	<table class="jqgrid_list" id="contractor_grid"><tr><td></td></tr></table> 
	<div id="contractor_pager"></div>
</div>