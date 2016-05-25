<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
$(document).ready(function() {
	$("#tel1").select2();
	
	$("#add_action_btn").on("click", function() {
		var type = $("#add_action_btn").data("type");

		switch (type) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
		case "save":			
			$.ajax({
				url: "${pageContext.request.contextPath}/baseinfo/contractor/save",
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
				url: "${pageContext.request.contextPath}/baseinfo/contractor/update",
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
});
</script>

<div id="add_form_modal" class="modal fade">
	<!-- modal -->
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-info-600">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title">발전 사업자 추가</h5>
			</div>
			
			<div class="modal-body">
				<div class="panel panel-flat">												
					<div class="panel-body">
						<form class="form-group" action="#">	
							<input type="hidden" id="id" name="id" class="data-field">
							<div class="row">
								<div class="col-md-6">												
									<div class="form-group">
										<label>발전 사업자명</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="icon-user"></i></span>
											<input id="name" name="name" type="text" class="form-control data-field" placeholder="발전 사업자명">
										</div>
									</div>
									<div class="form-group">
										<label>전화번호</label> 
										<div class="row">
											<div class="col-md-4 col-sm-4 col-xs-4">
												<select id="tel1" name="tel1" data-placeholder="지역번호" class="select data-field">
					                            	<option></option>
					                                <option value="02">02</option> 
					                                <option value="031">031</option> 
					                                <option value="032">032</option> 
					                                <option value="033">033</option>
					                                <option value="041">041</option> 
					                                <option value="042">042</option> 
					                                <option value="043">043</option>
					                                <option value="051">051</option>
					                                <option value="052">052</option>
					                                <option value="053">053</option>
					                                <option value="054">054</option>
					                                <option value="055">055</option>
					                                <option value="056">056</option>
					                                <option value="061">061</option>
					                                <option value="062">062</option>
					                                <option value="063">063</option>
					                                <option value="064">064</option>
					                            </select>
											</div>
																									
											<div class="col-md-4 col-sm-4 col-xs-4" style="margin-top:0;">
												<input id="tel2" type="text" name="tel2" class="form-control data-field" placeholder="">
											</div>
											<div class="col-md-4 col-sm-4 col-xs-4" style="margin-top:0;">
												<input id="tel3" type="text" name="tel3" class="form-control data-field" placeholder="">
											</div>											
										</div>
									</div>
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
								<div class="col-md-6">
									<div class="form-group"> 
										<label>비고</label>
										<input id="description" name="description" type="text" class="form-control data-field" placeholder="비고">												
									</div>											
									<div class="form-group">
										<label>Email</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="icon-mention"></i></span>
											<input id="email" name="email" type="text" class="form-control data-field" placeholder="Email">
										</div>
									</div>
									<div class="form-group"> 
										<label>담당자</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="icon-menu6"></i></span>
											<input id="manager" name="manager" type="text" class="form-control data-field" placeholder="담당자">												
										</div>
									</div>
								</div>
							</div>	
						</form>
					</div>
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
