var myOverlay = function(preferences, gamb, elem){
	
	this.currentOverlay = null;
	this.currentAlert = null;
	this.currentConfirm = null;
	this.currentContainer = null;
	
	//Overlay
	this.width = null;
	this.height = null;
	this.opacity = 0.6;
	this.speed = "normal";
	this.color = "black";
	this.zIndex = 200;
	this.completeOverlay = null;
	this.keyClose = 27;
	this.keyboardClosing = true;
	this.showClose = true;
	this.baseElement = window;
	this.bodyElement = this.baseElement.document.body
	
	//Alert
	this.alertWidth = null;
	this.alertHeight = null;
	this.alertHeading = "Atenção";
	this.completeAlert = null;
	this.callbackAlert = null;
	
	//Confirm
	this.confirmWidth = null;
	this.confirmHeight = null;
	this.confirmHeading = "Atenção";
	this.completeConfirm = null;
	this.callbackConfirm = null;
	this.callbackNoConfirm = null;
	
	//Container
	this.containerWidth = null;
	this.containerHeight = null;
	this.containerHeading = "";
	this.showHeadingContainer = true;
	
	//Bugs IE7-
	this.defaultWidth = 300;
	this.defaultHeight = null;
	
	this.config(preferences);
	
	this.getSizes();
	
	$(window).resize(this.resize);
}

myOverlay.count = 0;

myOverlay.prototype.getSizes = function(){
	var sizePg = this.getPageSize();
	
	this.width = this.bodyElement.scrollWidth;
	this.height = sizePg[1];
}



myOverlay.prototype.config = function(preferences){
	if (typeof preferences == "object") {
		for (atribute in preferences) {
			if (atribute in this) {
				this["" + atribute.toString() + ""] = preferences[atribute];
			}
		}
	}
}
myOverlay.prototype.callFunction = function(type){
	var attribute = type;
	var complete = this["" + attribute + ""];
	if (complete) {
		if (typeof complete == "object") {
			for (var i = 0; i < complete.length; i++) {
				if (typeof complete[i] == "function") {
					complete[i].apply(this);
				}
				else {
					//myAjax.handExceptions("DOM", "Função Inválida!");
				}
			}
		}
		else if (typeof complete == "function") {
			complete.call(this);
		}
		else {
			//myAjax.handExceptions("DOM", "Função Inválida!");
		}
	}
}

myOverlay.prototype.showOverlay = function(){
	var self = this;
	$(this.bodyElement).append("<div class='myOverlay'></div>");
	
	this.currentOverlay = $($(this.bodyElement).find(".myOverlay").get(myOverlay.count));
	this.currentOverlay.css({
		width: this.width + "px",
		height: this.height + "px",
		opacity: 0,
		position: "absolute",
		top: 0,
		left: 0,
		backgroundColor: this.color,
		zIndex: this.zIndex
	}).animate({
		opacity: this.opacity
	}, {
		duration: this.speed,
		complete: function(){
			self.callFunction("Overlay")
		}
	});
	
	if (this.keyboardClosing) {
		this.activateClose();
	}
	myOverlay.count++;
}

myOverlay.prototype.activateClose = function(){
	var self = this;
	$(document).keyup(function(event){
		if (event.keyCode == 27) {
			self.hideOverlay();
		}
	});
}

myOverlay.prototype.hideOverlay = function(){
	element = this.currentOverlay;
	if (this.currentAlert) element = element.add(this.currentAlert.get());
	if (this.currentConfirm) element = element.add(this.currentConfirm.get());
	if (this.currentContainer) element = element.add(this.currentContainer.get());
	
	setTimeout(function(){
		$(element).hide().remove();
	}, 3000);
	
	$(element).animate({
		opacity: 0
	}, {
		duration: this.speed,
		complete: function(){
		}
	}).queue(function(){
		$(element).remove();
		myOverlay.count--;
	});
	
}

myOverlay.prototype.alert = function(msg, width, height){
	if ($(this.bodyElement).find("#myOverlayAlert").size() > 0) return false;
	
	var self = this;
	this.showOverlay();
	
	$(this.bodyElement).append("<div id='myOverlayAlert' class='overlay'></div>");
	
	this.currentAlert = $(this.bodyElement).find("#myOverlayAlert");
	
	if (width) this.alertWidth = width;
	if (height) this.alertHeight = height;
	
	this.currentAlert.css({
		position: "fixed",
		opacity: 0,
		zIndex: this.zIndex + 2
	}).animate({
		opacity: 1
	}, {
		duration: this.speed,
		complete: function(){
			self.callFunction("completeAlert");
		}
	});
	
	if (this.alertWidth) this.currentAlert.width(this.alertWidth);
	if (this.alertHeight) this.currentAlert.height(this.alertHeight);
	
	this.currentAlert.append("<h1 id='myOverlayAlertHeading' class='heading'><span class='left'></span>" + this.alertHeading + "<span class='right'></span></h1>");
	this.currentAlert.append("<div id='myOverlayAlertMsg' class='msg'>" + msg + "</div>");
	this.currentAlert.append("<input type='button' id='myOverlayBtOk' class='button' value='Ok'/>");
	
	if (this.showClose) {
		this.currentAlert.append("<input type='button' id='closeAlert' class='myOverlayBtClose' value=''/>");
		$(this.bodyElement).find(".myOverlayBtClose").click(function(){
			$(this.bodyElement).find("#myOverlayBtOk").click();
		});
	}
	
	$(this.bodyElement).find("#myOverlayBtOk").click(function(){
		self.callFunction("callbackAlert");
		self.hideOverlay();
	});
	
	this.fixBugs();
	
	this.centralize("#myOverlayAlert");
}

myOverlay.prototype.confirm = function(msg, width, height,id,n, type){
	var coisou = false;
	if ($(this.bodyElement).find("#myOverlayConfirm").size() > 0) return false;
	var self = this;
	this.showOverlay();
	
	$(this.bodyElement).append("<div id='myOverlayConfirm' class='overlay'></div>");
	this.currentConfirm = $(this.bodyElement).find("#myOverlayConfirm");
	
	if (width) this.confirmWidth = width;
	if (height) this.confirmHeight = height;
	
	this.currentConfirm.css({
		position: "fixed",
		opacity: 0,
		zIndex: this.zIndex + 2
	}).animate({
		opacity: 1
	}, {
		duration: this.speed,
		complete: function(){
			self.callFunction("completeConfirm");
		}
	});
	
	if (this.confirmWidth) $(this.bodyElement).find("#myOverlayConfirm").width(this.confirmWidth);
	if (this.confirmHeight) $(this.bodyElement).find("#myOverlayConfirm").height(this.confirmHeight);
	
	this.currentConfirm.append("<h1 id='myOverlayConfirmHeading' class='heading'><span class='left'></span>" + this.confirmHeading + "<span class='right'></span></h1>");
	this.currentConfirm.append("<div id='myOverlayConfirmMsg' class='msg'>" + msg + "</div>");
	this.currentConfirm.append("<input type='button' id='myOverlayBtNo' class='button' value='Não'/>");
	this.currentConfirm.append("<input type='button' id='myOverlayBtYes' class='button' value='Sim'/>");
	
	if (this.showClose) {
		this.currentConfirm.append("<input type='button' id='closeConfirm' class='myOverlayBtClose' value=''/>");
		$(this.bodyElement).find(".myOverlayBtClose").click(function(){
			$(this.bodyElement).find("#myOverlayBtNo").click();
			
		});
	}
	
	$(this.bodyElement).find("#myOverlayBtYes").click(function(){
		
		self.callFunction("callbackConfirm");
		self.hideOverlay();
		
		if (type == 'p')
					window.location.href = 'prontuario_paciente.php?at=' + id
							+ '&n=' + n;
				else if (type == 'a')
					window.location.href = 'acesso_aluno.php';
				else if (type == 'n')
					window.location.href = 'cadastro_paciente.php';
				else if (type == 'h')
					window.location.href = 'historico_paciente.php?pr=' + id
							+ '&n=' + n;
				else{
					document.getElementById('gamb').value = "true";
					document.getElementById('pront').submit();
				}
		
		
		return false;
	});
	
	$(this.bodyElement).find("#myOverlayBtNo").click(function(){
		self.callFunction("callbackNoConfirm");
		self.hideOverlay();
		
		return false;
	});
	
	this.fixBugs();
	
	this.centralize("#myOverlayConfirm");
	return coisou;
}

myOverlay.prototype.container = function(width, height){
	if ($(this.bodyElement).find("#myOverlayContainer").size() > 0) return false;
	var self = this;
	this.showOverlay();
	
	$(this.bodyElement).append("<div id='myOverlayContainer' class='overlay'></div>");
	this.currentContainer = $(this.bodyElement).find("#myOverlayContainer");
	
	if (width) this.containerWidth = width;
	if (height) this.containerHeight = height;
	
	this.currentContainer.css({
		position: "fixed",
		opacity: 0,
		zIndex: this.zIndex + 1
	}).animate({
		opacity: 1
	}, {
		duration: this.speed,
		complete: function(){
			self.callFunction("completeContainer");
		}
	});
	
	if (this.containerWidth) $(this.bodyElement).find("#myOverlayContainer").width(this.containerWidth);
	if (this.containerHeight) $(this.bodyElement).find("#myOverlayContainer").height(this.containerHeight);
	
	if (this.showHeadingContainer) {
		$(this.bodyElement).find("#myOverlayContainer").append("<h1 id='myOverlayContainerHeading' class='heading'><span class='left'></span>" + this.containerHeading + "<span class='right'></span></h1>");
	}
	if (this.showClose) {
		this.currentContainer.append("<input type='button' id='closeContainer' class='myOverlayBtClose' value=''/>");
		$(this.bodyElement).find(".myOverlayBtClose").click(function(){
			self.hideOverlay();
		});
	}
	
	this.currentContainer.append("<div id='myOverlayContainerContent'");
	
	this.centralize("#myOverlayContainer");
}

myOverlay.prototype.centralize = function(element){
	this.baseElement.scrollTo(0, 0);
	var height = $(this.bodyElement).find(element).innerHeight();
	var width = $(this.bodyElement).find(element).innerWidth();
	var newMargin = "-" + Math.round(height / 2).toString() + "px 0 0 " + "-" + Math.round(width / 2).toString() + "px"
	$(this.bodyElement).find(element).css({
		top: "50%",
		left: "50%",
		margin: newMargin
	});
}

myOverlay.prototype.resize = function(){
	var sizePg = myOverlay.getPageSize();
	this.height = sizePg[1];
	this.width = document.body.offsetWidth;
	
	$(this.bodyElement).find(".myOverlay").css({
		width: this.width + "px",
		height: this.height + "px"
	});
}

myOverlay.prototype.fixBugs = function(){
	if ($.browser.msie) {
		if ($.browser.version == "6.0") {
			$(this.bodyElement).find("#myOverlayAlert").css({
				position: "absolute"
			});
			$(this.bodyElement).find("#myOverlayConfirm").css({
				position: "absolute"
			});
		}
		
		if ($.browser.msie) {
			if ($.browser.version.match(/(6|7\.0)/)) {
				if (this.defaultWidth) $(this.bodyElement).find("#myOverlayAlert").width(this.defaultWidth + "px");
				if (this.defaultHeight) $(this.bodyElement).find("#myOverlayAlert").height(this.defaultHeight + "px");
			}
		}
	}
}

myOverlay.prototype.getPageSize = function(){

	var xScroll, yScroll;
	if (window.innerHeight && window.scrollMaxY) {
		xScroll = this.bodyElement.scrollWidth;
		yScroll = this.baseElement.innerHeight + this.baseElement.scrollMaxY;
	}
	else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
		xScroll = this.bodyElement.scrollWidth;
		yScroll = this.bodyElement.scrollHeight;
	}
	else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = this.bodyElement.offsetWidth;
		yScroll = this.bodyElement.offsetHeight;
	}
	
	
	var windowWidth, windowHeight;
	if (this.baseElement.innerHeight) { // all except Explorer
		windowWidth = this.baseElement.innerWidth;
		windowHeight = this.baseElement.innerHeight;
	}
	else if (this.bodyElement.documentElement && this.bodyElement.documentElement.clientHeight) { // Explorer 6 Strict Mode
		windowWidth = this.baseElement.document.documentElement.clientWidth;
		windowHeight = this.baseElement.document.documentElement.clientHeight;
	}
	else if (this.baseElement) { // other Explorers
		windowWidth = this.bodyElement.clientWidth;
		windowHeight = this.bodyElement.clientHeight;
	}
	
	// for small pages with total height less then height of the viewport
	if (yScroll < windowHeight) {
		pageHeight = windowHeight;
	}
	else {
		pageHeight = yScroll;
	}
	
	// for small pages with total width less then width of the viewport
	if (xScroll < windowWidth) {
		pageWidth = windowWidth;
	}
	else {
		pageWidth = xScroll;
	}
	
	arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight)
	return arrayPageSize;
}
