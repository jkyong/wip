<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="add_form_modal" class="modal fade">
<!-- modal -->
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-info-600">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h5 class="modal-title">블레이드 추가</h5>
			</div>
			
			<div class="modal-body">
				<div class="panel panel-flat">												
					<div class="panel-body">
						<form class="form-group" action="#">	
							<input type="hidden" id="id" name="id" class="data-field">
							<div class="row">
								<div class="col-md-6">												
									<div class="form-group">
										<label>블레이드명</label>
										<div class="input-group">
											<span class="input-group-addon"><i class="icon-user"></i></span>
											<input id="name" name="name" type="text" class="form-control data-field" placeholder="블레이드명">
										</div>
									</div>
		
									<div class="form-group"> 
										<label>타입</label>
										<input id="type" name="type" type="text" class="form-control data-field" placeholder="타입">												
									</div>
									
									<div class="form-group"> 
										<label>비고</label>
										<input id="description" name="description" type="text" class="form-control data-field" placeholder="비고">												
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group"> 
										<label>제작사</label>
										<input id="manufacturer" name="manufacturer" type="text" class="form-control data-field" placeholder="제작사">												
									</div>
			
									<div class="form-group"> 
										<label>규격</label>
										<input id="standard" name="standard" type="text" class="form-control data-field" placeholder="규격">												
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
					<button type="button" id="testbtn" class="btn btn-primary">TEST</button>
				</div>
			</div>
			<!-- modal content -->
		</div>						
		<!-- modal dialog -->
	</div>
	<!-- /input group addons -->
</div>
