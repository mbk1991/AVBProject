	function textareaCheck(thisText){
		$("#typingCount").text($(thisText).val().length);
		if($(thisText).val().length>298){
			$(thisText).val($(thisText).val().substring(0,298));
		}
	}
	
	function textCheck(thisText){
		if($(thisText).val().length>28){
			$(thisText).val($(thisText).val().substring(0,28));
		}
	}