
$(document).ready( function() {

	$("#new_job").on("submit", function(e) {
		date_valid = $("#date_valid").val();
		var regex = /\d{2}.\d{2}.\d{4}/;
		return (regex.test(date_valid) && date_validation(date_valid));
	});

});

//Date validation
function date_validation(date) {
	var temp_arr = date.split('.');
	var day = parseInt(temp_arr[0]);
	var month = parseInt(temp_arr[1]);
	var year = parseInt(temp_arr[2]);
	var MAX_DAY = 31;
	var MAX_MONTH = 12;
	var MIN_YEAR = 2015;

	if (day > 31 || month > 12 || year < MIN_YEAR)
		return false;
	else
		return true;
}