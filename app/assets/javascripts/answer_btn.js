/* global $*/

$('input[type=checkbox]').change(function() {

	if($('input[type=checkbox]').is(':checked')){
	  $('#answer_btn').prop('disabled', false);
    $('#answer_btn').removeClass("btn-disabled");
    $('#answer_btn').addClass("btn-success");
	}else{
	  $('#answer_btn').prop('disabled', true);
    $('#answer_btn').addClass("btn-disabled");
    $('#answer_btn').removeClass("btn-success");
	}

});
