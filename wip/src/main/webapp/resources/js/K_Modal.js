var modalList = [];

var K_Modal = function(id, pid) {
	this.id = id;
	this.pid = pid;
	
};

K_Modal.prototype.init = function() {
	$("#" + this.id).modal();
	modalList.push({ id : this.id, pid: this.pid});
};

K_Modal.prototype.destroy = function() {
	console.log(_.findWhere(modalList, { pid : "0" }).id);
};

 