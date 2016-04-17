
$(document).ready( function() {

	//Validate date in new_job form
	validateDateInForm("#new_job");

	//Validate date in edit_job form
	validateDateInForm("#edit_job");
	
	//Validate email in new_user form
	validateEmailInForm("#new_user");

	//Validate email in edit_user form
	validateEmailInForm("#edit_user");

});

function validateDateInForm(form_id) {
	$(form_id).on("submit", function(e) {
		var error_element = '<div class="error">' +
								'<p> </p>' +
							'</div>';
		var dateInputId = form_id + "_date";
		var date_valid = $(dateInputId).val();
		var regex = /\d{2}.\d{2}.\d{4}/;
		if (regex.test(date_valid) == false || dateValidation(date_valid) == false) {
			clearErrorMsg();
			$(this).before(error_element);
			dispplayErrorMsg("Invalid Date Format or Value")
			return false;
		}
		else {
			clearErrorMsg();
			return true;
		}
	});
}


//Date validation
function dateValidation(date) {
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


// Function validate email
function validateEmailInForm(form_id) {
	$(form_id).on("submit", function(e) {
		var error_element = '<div class="error">' +
								'<p> </p>' +
							'</div>';

		var emailInputId = form_id + "_email";
		var emailInput = $(emailInputId).val();
		var regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		if (regex.test(emailInput) == false) {
			clearErrorMsg();
			$(this).before(error_element);
			dispplayErrorMsg("Invalid Email Format")
			return false;
		}
		else {
			clearErrorMsg();
			return true;
		}
	});
}



//Display error message
function dispplayErrorMsg(msg) {
	$error = $(".error > p");
	$error.text(msg);
}

//Clear error message
function clearErrorMsg() {
	$error = $(".error");
	if ($error.length) {
		$error.remove();
	}

}