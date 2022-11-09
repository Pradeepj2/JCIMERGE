<!DOCTYPE html>
<html lang="en">
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="com.jci.model.PincodeModel"%>
<%@page import="com.jci.model.FarmerRegModel"%>
<%@page import="com.jci.model.StateList"%>
<%@page import="java.util.List"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width initial-scale=1.0">
<title>JCI | CMS</title>
<!-- GLOBAL MAINLY STYLES-->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="build/css/intlTelInput.css">
<link rel="stylesheet" href="build/css/demo.css">
<link
	href="<%=request.getContextPath()%>/resources/css/styleUserReg.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/resources/js/responsivevoice.js'></script>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/resources/js/custom.js'></script>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js'></script>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/resources/js/jquery.validate.min.js'></script>
<link href="./assets/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="./assets/vendors/themify-icons/css/themify-icons.css"
	rel="stylesheet" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- PLUGINS STYLES-->
<!-- THEME STYLES-->
<link href="assets/css/main.min.css" rel="stylesheet" />

<style>
.required:after {
	content: " *";
	color: red;
}
</style>
<!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">
	<div class="page-wrapper">
		<!-- START HEADER-->
		<%@ include file="header.jsp"%>
		<!-- END HEADER-->
		<!-- START SIDEBAR-->
		<%@ include file="sidebar.jsp"%>
		<!-- END SIDEBAR-->
		<div class="content-wrapper">
			<!-- START PAGE CONTENT-->
			<div class="page-heading">
				<h1 class="page-title">Farmer Registration</h1>
			</div>
			<%
				int userId = 0;
				if(session.getAttribute("userId")!=null){
					 userId = (int) (session.getAttribute("userId"));
				} 
			%>
			<div class="page-content fade-in-up">
				<div class="row">
					<div class="col-md-11">
						<div class="ibox">
							<div class="ibox-head">
								<!-- <div class="ibox-title">Basic form</div> -->
								<span>${msg}</span>
							</div>
							<div class="ibox-body">
								<form action="saveFarmerRegistrationMid.obj" method="POST"
									enctype="multipart/form-data" name="myForm"
									onsubmit="return validate()" autocomplete="off">
									<input type="hidden" name="accNoCheck" id="accNoCheck">
									<input type="hidden" name="aadharNoCheck" id="aadharNoCheck">
									<input type="hidden" name="dubMobile" id="dubMobile"> 
									<input type="hidden" name="F_REG_BY" id="F_REG_BY" value="<%=userId%>">
									
								<%
									FarmerRegModel farme = (FarmerRegModel) request.getAttribute("FarmerRegistration");
								%>
									<div class="row">
									
									
										<div class="col-sm-4 form-group">
											<label class="required">First Name of Farmer</label>
											&nbsp;&nbsp;&nbsp; <span id="errName" name="errName"
												class="text-danger"> </span> <input class="form-control"
												type="text" name="F_NAME" id="F_NAME"
												placeholder="First Name" value=""
												oninput="allow_alphabets(this)" onkeyup="deleteErrorMsg()">
										</div>
										<div class="col-sm-4 form-group">
											<label >Middle Name of Farmer</label>
											&nbsp;&nbsp;&nbsp; <input class="form-control"
												type="text" name="M_NAME" id="M_NAME"
												placeholder="Middle Name" value=""
												oninput="allow_alphabets(this)" >
										</div>
										<div class="col-sm-4 form-group">
											<label >Last Name of Farmer</label>
											&nbsp;&nbsp;&nbsp;  <input class="form-control"
												type="text" name="L_NAME" id="L_NAME"
												placeholder="Last Name" value=""
												oninput="allow_alphabets(this)" >
										</div>
										</div>
										<div class="row">
										<div class="col-sm-4 form-group">
											<label class="required">Caste</label> &nbsp;&nbsp;&nbsp; <span
												id="errCaste" name="errCaste" class="text-danger"> </span> 
										<select class="form-control" name="caste" type="text"placeholder="Caste" id="caste" onchange="deleteErrorMsg()">
												<option selected value="">-Select-</option>
												<option value="General">General</option>
												<option value="OBC">OBC</option>
												<option value="SC">SC</option>
												<option value="ST">ST</option>
											</select>
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Gender</label> &nbsp;&nbsp;&nbsp; <span
												id="errGender" name="errGender" class="text-danger"></span>
											<select class="form-control" name="gender" type="text"placeholder="Gender" id="gender" onchange="deleteErrorMsg()">
												<option id="default" value="" selected>-Select
													Gender-</option>
												<option id="Male" value="Male">Male</option>
												<option id="Female" value="Female">Female</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4 form-group">
											<label class="required">Address</label> &nbsp;&nbsp;&nbsp; <span
												id="errAdd" name="errAdd" class="text-danger"> </span> <input
												class="form-control" type="text" name="F_ADDRESS"
												placeholder="Farmer Address" id="F_ADDRESS"
												onkeyup="deleteErrorMsg()">
										</div>
										<!-- <div class="col-sm-4 form-group">
											<label class="required">Address 2</label> &nbsp;&nbsp;&nbsp;
											<span id="errAdds" name="errAdds" class="text-danger">
											</span> <input class="form-control" type="text" name="F_Address2"
												placeholder="Farmer Address" id="F_Address2"
												onkeyup="deleteErrorMsg()">
										</div> -->
										
										
										<div class="col-sm-4 form-group">
											<label class="required">State</label> &nbsp;&nbsp; <span
												id="errState" name="errState" class="text-danger"> </span>
											<%
												List<StateList> Liststate = (List<StateList>) request.getAttribute("Liststate");
											%>
											<select class="form-control" name="state" type="text"placeholder="State" id="ParentMenuID" onchange="deleteErrorMsg()">
												<option disabled selected value>-Select-</option>
												<%
													for (StateList stateLists : Liststate) {
												%>
												<option value="<%=stateLists.getId()%>"><%=stateLists.getState_name()%></option>
												<%
													}
												%>
											</select>
										</div>
									
									<div class="col-sm-4 form-group">
											<label class="required">District</label> 	
											<span id="errDistrict" name="errDistrict" class="text-danger"> </span>										 
											<select id="child" name="F_District" class="form-control" onchange="deleteErrorMsg()">
										   <option disabled selected value>-Select District-</option>
											</select>

										</div>
										
										<div class="col-sm-4 form-group">
											<label class="required">Block</label> &nbsp;&nbsp;&nbsp;
											<span id="errBlock" name="errBlock" class="text-danger"> </span>
											 <select class="form-control" name="F_Block" type="text"placeholder="Block" id="F_Block" onchange="deleteErrorMsg()">
											 <option selected value="">-Select-</option>
												
											</select>
										</div>
										
										<div class="col-sm-4 form-group">
											<label class="required">Police Station</label> &nbsp;
											<span id="errPoliceStation"name="errPoliceStation" class="text-danger"> </span>
										<select class="form-control" name="policestation" type="text" placeholder="policestation" id="PoliceStation" onchange="deleteErrorMsg()">
												<option selected value="">-Select-</option>
												
											</select>
										</div>
										
										
										
										<div class="col-sm-4 form-group">
											<label class="required">Pincode</label>
											<span id="errPincode" name="errPincode" class="text-danger">
											</span> <input type="number" min="0"  inputmode="numeric" pattern="[0-9]{6}" maxlength="6" class="form-control"  name="pincode" placeholder="Pin Code" id="pincode" onchange="deleteErrorMsg();" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" >										</div>
										
									</div>
									<div class="row">
										<div class="col-sm-4 form-group">
											<label class="required">Identity Type </label>&nbsp;&nbsp;&nbsp; 
											<span id="errIdtype" name="errIdtype"
												class="text-danger"></span> 
												<select  name="F_ID_PROF_TYPE" id="F_ID_PROF_TYPE" class="form-control onchange=" onchange="deleteErrorMsg()">
												<option id="default" value="">-Select-</option>
												<option id="AadharCard" value="Aadhar Card">Aadhar
													Card</option>
												<option id="VoterId" value="Voter Id">Voter Id</option>
											</select>
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Identity Proof No.</label>&nbsp;&nbsp;&nbsp;
											 <span id="errIdProfno" name="errIdProfno"class="text-danger"> </span> 
											 <input class="form-control"type="text" min="0" name="F_ID_PROF_No" placeholder="Identity Proof No." id="F_ID_PROF_No" onkeyup="validateAdhar()" onchange="deleteErrorMsg()"/>
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Whether I-CARE Registered</label>
											&nbsp;&nbsp;&nbsp; <span id="errIcare" name="errIcare"
												class="text-danger"> </span> <select
												name="F_I_CARE_REGISTERED" id="F_I_CARE_REGISTERED"
												placeholder="Whether I-CARE Registered" class="form-control"
												onchange="deleteErrorMsg()">
												<option id="default" value="" selected>-Select-</option>
												<option value="Yes">Yes</option>
												<option value="No">No</option>
											</select>
										</div>

									</div>
									<div class="row">

										<div class="col-sm-4 form-group">
											<label class="required">Land Holding (Bigha)</label> &nbsp;&nbsp;&nbsp;
									 <span id="errLand" name="errLand" class="text-danger"> </span>
									  <input class="form-control"  name="land_holding" type="number"placeholder="Land Holding (Bigha)" min=0 step="0.01" 
		             				 id="land_holding" onchange="deleteErrorMsg()">
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Mobile Number</label>&nbsp;&nbsp;&nbsp;
											<span id="errMob" name="errMob" class="text-danger"> </span>
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon1">+91</span>
												<input class="form-control" type="number" id="F_MOBILE" name="F_MOBILE" title="10 digit mobile number"
												onkeyup="validateMobile()" placeholder="Farmer Mobile" min="0" onchange="deleteErrorMsg()" oninput="javascript: if (this.value.length > 10) this.value = this.value.slice(0, 10);">
											</div>
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Bank A/C Type</label>&nbsp; <span
												id="errAccType" name="errAccType" class="text-danger">
											</span> <select name="bank_ac_type" id="bank_ac_type"
												class="form-control" onchange="deleteErrorMsg()"> 
												<option id="default" value="" selected disabled>-Select-</option>
												<option value="Saving">Saving</option>
												<option value="Current">Current</option>
											</select>
											<!-- <input class="form-control" name="bank_ac_type" type="text" placeholder="Bank Account Type"> -->
										</div>
									</div>
									<div class="row">

										<div class="col-sm-4 form-group">
											<label class="required">Bank A/C No.</label> &nbsp;  
											<span id="dubAcc" name="dubAcc" class="text-danger"></span> &nbsp;&nbsp;&nbsp;
											<span id="errAccNo" name="errAccNo"class="text-danger"> </span> 
											<input class="form-control" name="F_AC_NO" type="text"  placeholder="Farmer Bank Ac No." id="F_AC_NO" onkeypress="return onlyNumberKey(event)" onchange="deleteErrorMsg()" onkeyup="validateAccount()" minlength="6" maxlength="18">
										</div>
										
										<div class="col-sm-4 form-group">
											<label class="required">Bank IFSC</label>&nbsp;&nbsp;&nbsp; <span
												id="errIFSC" name="errIFSC" class="text-danger"> </span> 
										<input class="form-control" oninput="this.value = this.value.toUpperCase()" maxlength="11" name="F_BANK_IFSC" type="text"
												placeholder="IFSC Code" id="F_BANK_IFSC"
												onchange="deleteErrorMsg()">
										</div>
										
										<div class="col-sm-4 form-group">
											<label class="required">Bank Name</label>&nbsp;&nbsp;&nbsp; <span
												id="errbnkName" name="errbnkName" class="text-danger">
											</span> <input readonly class="form-control" name="F_BANK_NAME" type="text"
												placeholder="Bank Name" id="F_BANK_NAME"
												onchange="deleteErrorMsg()">
										</div>
									</div>
									<div class="row">

										<div class="col-sm-4 form-group">
											<label class="required">Bank Branch</label>&nbsp;&nbsp;&nbsp;
											<span id="errbnkBranch" name="errbnkBranch"
												class="text-danger"> </span> <input readonly class="form-control"
												name="F_BANK_BRANCH" type="text"
												placeholder="Farmer Bank Branch" id="F_BANK_BRANCH"
												onchange="deleteErrorMsg()">
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Bank Document (330kb-1MB)</label>&nbsp;
										 <span id="errBank" name="errBank"class="text-danger"> </span>
										<img id="imgPreviewwbank"  />
					<input class="form-control" name="F_BANK_DOC" type="file" oninput="validateBANKFileType()" accept=".jpg,.jpeg,.png" placeholder="Bank Document " id="F_BANK_DOC" onkeypress="deleteErrorMsg()">
										</div>
										<div class="col-sm-4 form-group">
											<label class="required">Identity Proof (330kb-1MB)</label>&nbsp; 
											<span id="errIdProof" name="errIdProof" class="text-danger"> </span>
												<img id="imgPreviewidentity"  />
										<input class="form-control" name="F_ID_PROF" type="file" oninput="validateIDFileType()"
											accept=".jpg,.jpeg,.png" placeholder="Identity Proof " id="F_ID_PROF" onkeypress="deleteErrorMsg()">
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4 form-group">
											<label class="required">Registration Form (330kb-1MB)</label>&nbsp; 
											<span id="errRegForm" name="errRegForm" class="text-danger"> </span>
									 <img id="imgPreview"  />
<input class="form-control" name="F_REG_FORM" type="file" oninput="validateREGFileType()" accept=".jpg,.jpeg,.png" placeholder="Registration Form" id="F_REG_FORM" onkeypress="deleteErrorMsg()">
										</div>
							
									</div>
									<div class="row">
										<div class="col-sm-4 form-group">
											<input type="submit" value="Submit" class="btn btn-primary">
											<!-- <input class="btn btn-primary" type="submit" id="enq_submit">Submit</button> -->
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTENT-->
			<%@ include file="footer.jsp"%>
		</div>
	</div>

	<div class="sidenav-backdrop backdrop"></div>
	
	<script>
	$(document).ready(function(){
		$("#F_MOBILE").keyup(function() {
			var value = $(this).val();
		
		  if(value.length < '10'  ){
			 
			  document.getElementById("errMob").innerHTML = "Mobile Number should be 10 digits!!";
			  $('#errMob').show();
		  }
		  else
		    $('#errMob').hide();
		   
		});
	});
	</script>
	
<script>
	$('#land_holding').on('change', function() {
		
	    var get_land_holding = document.getElementById('land_holding').value;
	    
	    var set_land_holding = parseFloat(get_land_holding).toFixed(2);
	     $('input[name=land_holding').val(set_land_holding);
	})
	</script>
	
	<script>
    function onlyNumberKey(evt) {
          
        // Only ASCII character in that range allowed
        var ASCIICode = (evt.which) ? evt.which : evt.keyCode
        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
            return false;
        return true;
    }
</script>
	
	<script>
		/* $(document).ready(function() {
			$('#emailTosend').keyup(function(e) {
				if (e.keyCode == 8)
					//alert('backspace trapped')

			})
		}); */
	</script>
	<script src="build/js/intlTelInput.js"></script>
	<script>
		$('#emailTosend').keyup(function() {
			var str = this.value.replace(/(\w)[\s,]+(\w?)/g, '$1, $2');
			if (str != this.value)
				this.value = str;
		});

		$('#emailTosend').keyup(function() {
			var val = $("#emailTosend").val();
			let text = val;
			let result = text.indexOf(" ");
			if (result != -1) {
				alert(result);
			}

			/* var str = this.value.replace(/(\w)[\s,]+(\w?)/g, '$1, $2');
			 if (str!=this.value) this.value = str; */
		});
	</script>

	
<script>

function validateMobile() {
	var mobileno = document.getElementById("F_MOBILE").value;
	var flag = false;
	var molilelen = mobileno.length;
	if(molilelen==10){
		$("#F_MOBILE").prop("type", "text");
		$("#F_MOBILE").attr("maxlength", "10");
		$("#F_MOBILE").attr("minlength", "10");
		flag =  true;
		 $.ajax({
				type:"GET",
				url:"validateMobile.obj",
				data:{"mobileno":mobileno},
				success:function(result){
					document.getElementById("dubMobile").value = result;
					if(result === 'false'){
					document.getElementById("errMob").innerHTML = "Duplicate mobile number";
				}else{
					document.getElementById("errMob").innerHTML = "";
				}
			}
		  }); 
		}
	}
</script>

<script>
 function validate() {
	 let F_NAME = document.forms["myForm"]["F_NAME"].value;
	// alert("after F_NAME");
	 let caste = document.forms["myForm"]["caste"].value;
	 //alert("after caste");
	 let gender = document.forms["myForm"]["gender"].value;
	 //alert("after gender");
	 let F_ADDRESS = document.forms["myForm"]["F_ADDRESS"].value;
	 let state = document.forms["myForm"]["state"].value;
	 let F_District = document.forms["myForm"]["F_District"].value;
	 let F_Block =document.forms["myForm"]["F_Block"].value;
	 let policestation =document.forms["myForm"]["policestation"].value;
	 let pincode = document.forms["myForm"]["pincode"].value;
	 //alert("after gender");
	 let F_ID_PROF_TYPE = document.forms["myForm"]["F_ID_PROF_TYPE"].value; 
	 //alert("after F_ID_PROF_TYPE");
	 let F_ID_PROF_No = document.forms["myForm"]["F_ID_PROF_No"].value;
	// alert("after F_ID_PROF_No");
	let F_I_CARE_REGISTERED = document.forms["myForm"]["F_I_CARE_REGISTERED"].value; 
	// alert("after F_I_CARE_REGISTERED");
	 let land_holding = document.forms["myForm"]["land_holding"].value; 
	// alert("after land_holding");
	let F_MOBILE = document.forms["myForm"]["F_MOBILE"].value;
	// alert("after F_MOBILE");
	 let bank_ac_type = document.forms["myForm"]["bank_ac_type"].value;
	// alert("after bank_ac_type");
	 let F_AC_NO = document.forms["myForm"]["F_AC_NO"].value;
	// alert("after F_AC_NO");
	let F_BANK_IFSC = document.forms["myForm"]["F_BANK_IFSC"].value; 
	// alert("after F_BANK_IFSC");
	 let F_BANK_NAME = document.forms["myForm"]["F_BANK_NAME"].value; 
	// alert("after F_BANK_NAME");
	 let F_BANK_BRANCH = document.forms["myForm"]["F_BANK_BRANCH"].value; 
	// alert("after F_BANK_BRANCH");
	 let F_BANK_DOC = document.forms["myForm"]["F_BANK_DOC"].value;  
	
	 let F_ID_PROF=document.forms["myForm"]["F_ID_PROF"].value; 
	 
	 let F_REG_FORM=document.forms["myForm"]["F_REG_FORM"].value; 

	 if (F_NAME == "") {
	    document.getElementById("errName").innerHTML = "Name can not be empty!";
	    document.forms["myForm"]["F_NAME"].focus();
	    return false;
	  }	 
	  else if(caste == ""){
		  document.getElementById("errCaste").innerHTML = "Caste can not be empty!";
		  document.forms["myForm"]["caste"].focus();
		  return false;
	  } else if(gender == ""){
		  document.getElementById("errGender").innerHTML = "Gender can not be empty!";
		  document.forms["myForm"]["gender"].focus();
		  return false;
	  }else if(F_ADDRESS == ""){
		  document.getElementById("errAdd").innerHTML = "Address can not be empty!";
	      document.forms["myForm"]["F_ADDRESS"].focus();
		  return false; 
	  }
	  else if(state == ""){
		  document.getElementById("errState").innerHTML = "State can not be empty!";
	      document.forms["myForm"]["state"].focus();
		  return false; 
	  }
	 else if(F_District == ""){
		  document.getElementById("errDistrict").innerHTML = "District can not be empty!";
	      document.forms["myForm"]["F_District"].focus();
		  return false; 
	  } 
	 else if(F_Block == ""){
		  document.getElementById("errBlock").innerHTML = "Block can not be empty!";
	      document.forms["myForm"]["F_Block"].focus();
		  return false; 
	  }  
	  else if(policestation == ""){
		  document.getElementById("errPoliceStation").innerHTML ="PoliceStation can not be empty!";
	      document.forms["myForm"]["policestation"].focus();
		  return false; 
	  }  
	  else if(pincode == ""){
		  document.getElementById("errPincode").innerHTML = "Pincode can not be empty!";
		  //alert("Address must be filled out");
		  document.forms["myForm"]["pincode"].focus();
		  return false;
	  }
	  else if(F_ID_PROF_TYPE == ""){
		  document.getElementById("errIdtype").innerHTML = "Id Type can not be empty!";
		  //alert("Identity Type must be filled out");
		  document.forms["myForm"]["F_ID_PROF_TYPE"].focus();
		  return false;
	  } 
	  else if(F_ID_PROF_No == ""){
		  document.getElementById("errIdProfno").innerHTML = "Id Proof can not be empty!";
		  //alert("Identity Proof No. must be filled out");
		  document.forms["myForm"]["F_ID_PROF_No"].focus();
		  return false;
	  }
	  else if(F_I_CARE_REGISTERED == ""){
		  document.getElementById("errIcare").innerHTML = " I CARE REGISTERED can not be empty!";
		  document.forms["myForm"]["F_I_CARE_REGISTERED"].focus();
		  return false;
	  }
	  else if(land_holding == ""){
		  document.getElementById("errLand").innerHTML = "land holding can not be empty!";
		  //alert("Land Holding (Bigha) must be filled out");
		  document.forms["myForm"]["land_holding"].focus();
		  return false;
	  }
	  else if(F_MOBILE == ""){
		  document.getElementById("errMob").innerHTML = "Mobile No. can not be empty!";
		  //alert("Mobile Number must be filled out");
		  document.forms["myForm"]["F_MOBILE"].focus();
		  return false;
	  }
	  else if(bank_ac_type == ""){
		  document.getElementById("errAccType").innerHTML = "Bank AC Type can not be empty!";
		  //alert("Bank A/C Type must be filled out");
		  document.forms["myForm"]["bank_ac_type"].focus();
		  return false;
	  }
	  else if(F_AC_NO == ""){
		  document.getElementById("errAccNo").innerHTML = "Bank AC NO can not be empty!";
		 //alert("Bank A/C No. must be filled out");
		  document.forms["myForm"]["F_AC_NO"].focus();
		  return false;
	  }
	  else if(F_BANK_IFSC == ""){
		  document.getElementById("errIFSC").innerHTML = "Bank IFSC can not be empty!";
		//alert("Bank IFSC must be filled out");
		  document.forms["myForm"]["F_BANK_IFSC"].focus();
		  return false;
	  }
	  else if(F_BANK_NAME == ""){
		  document.getElementById("errbnkName").innerHTML = "Bank Name can not be empty!";
		  //alert("Bank Name must be filled out");
		  document.forms["myForm"]["F_BANK_NAME"].focus();
		  return false;
	  }
	  else if(F_BANK_BRANCH == ""){
		  document.getElementById("errbnkBranch").innerHTML = "Bank Branch can not be empty!";
		  //alert("Bank Branch must be filled out");
		  document.forms["myForm"]["F_BANK_BRANCH"].focus();
		  return false;
	  }
	  else if(F_BANK_DOC == ""){
		  document.getElementById("errBank").innerHTML = "Bank Document can not be empty!";
		  //alert("Bank Document must be filled out");
		  document.forms["myForm"]["F_BANK_DOC"].focus(); 
		  return false;
	  } 
	  else if(F_ID_PROF == ""){
		  document.getElementById("errIdProof").innerHTML = "ID Prof document can not be empty!";
		  //alert("Bank Document must be filled out");
		  document.forms["myForm"]["F_ID_PROF"].focus();
		  return false;
	  } 
	 else if(F_REG_FORM == ""){
		  document.getElementById("errRegForm").innerHTML = "REG FORM can not be empty!";
		  //alert("Registration Form must be filled out");
		  document.forms["myForm"]["F_REG_FORM"].focus();
		  return false;
	  }

}

</script>

<script>
function deleteErrorMsg(){
	//alert('Hi');
        
 var F_NAME = document.forms["myForm"]["F_NAME"].value;
        if(F_NAME.length>1)
        {
             $("#errName").hide();
        }
var caste = document.forms["myForm"]["caste"].value;
        if(caste.length>1)
        {
               $("#errCaste").hide();
        }
var gender = document.forms["myForm"]["gender"].value;
        if(gender.length>1){
            $("#errGender").hide();
       }
var F_ADDRESS = document.forms["myForm"]["F_ADDRESS"].value;
        if(F_ADDRESS.length>1){
               $("#errAdd").hide();
        }

var state = document.forms["myForm"]["state"].value;
        if(state.length>1){
            $("#errState").hide();
        }
var F_District = document.forms["myForm"]["F_District"].value;
        if(F_District.length>1){
               $("#errDistrict").hide();
        } 
 var F_Block = document.forms["myForm"]["F_Block"].value;
        if(F_Block.length>1){
               $("#errBlock").hide();
        } 
var policestation = document.forms["myForm"]["policestation"].value;
        if(policestation.length>1){
               $("#errPoliceStation").hide();
        }
var pincode = document.forms["myForm"]["pincode"].value;
        if(pincode.length>1){
            $("#errPincode").hide();
        }
 
var F_ID_PROF_TYPE = document.forms["myForm"]["F_ID_PROF_TYPE"].value;
        if(F_ID_PROF_TYPE.length>1){
        	//alert('sheetal');
            $("#errIdtype").hide();
        } 
var F_ID_PROF_No = document.forms["myForm"]["F_ID_PROF_No"].value;
        if(F_ID_PROF_No.length>1){
            $("#errIdProfno").hide();
        }
 var F_I_CARE_REGISTERED = document.forms["myForm"]["F_I_CARE_REGISTERED"].value; 
        if(F_I_CARE_REGISTERED.length>1){
            $("#errIcare").hide();
        }
var land_holding = document.forms["myForm"]["land_holding"].value; 
        if(land_holding.length>1){
            $("#errLand").hide();
        }
var F_MOBILE = document.forms["myForm"]["F_MOBILE"].value;
        if(F_MOBILE.length>1){
            $("#errMob").hide();
        }
var bank_ac_type = document.forms["myForm"]["bank_ac_type"].value;
         if(bank_ac_type.length>1){
        	    $("#errAccType").hide();
        	}
 var F_AC_NO = document.forms["myForm"]["F_AC_NO"].value;
         if(F_AC_NO.length>1){
        	    $("#errAccNo").hide();
        	}
var F_BANK_IFSC = document.forms["myForm"]["F_BANK_IFSC"].value; 
         if(F_BANK_IFSC.length>1){
        	    $("#errIFSC").hide();
        	}
var F_BANK_NAME = document.forms["myForm"]["F_BANK_NAME"].value; 
         if(F_BANK_NAME.length>1){
        	    $("#errbnkName").hide();
        	}
var F_BANK_BRANCH = document.forms["myForm"]["F_BANK_BRANCH"].value; 
         if(F_BANK_BRANCH.length>1){
        	    $("#errbnkBranch").hide();
        	}
var F_BANK_DOC = document.forms["myForm"]["F_BANK_DOC"].value; 
         if(F_BANK_DOC.length>1){
        	    $("#errBank").hide();
        	}
var F_ID_PROF = document.forms["myForm"]["F_ID_PROF"].value; 
         if(F_ID_PROF.length>1){
        	    $("#errIdProof").hide();
        	}
var F_REG_FORM = document.forms["myForm"]["F_REG_FORM"].value; 
         if(F_REG_FORM.length>1){
        	    $("#errRegForm").hide();
        	}
 
}
        
</script>

<script>
    function allow_alphabets(element){
        let textInput = element.value;
        textInput = textInput.replace(/[^A-Za-z ]*$/gm, ""); 
        element.value = textInput;
    }
</script>
	<script>
    
function phoneno(){          
 $('#phone').keypress(function(e) {
     var a = [];
     var k = e.which;
     for (i = 48; i < 58; i++)
         a.push(i);
     if (!(a.indexOf(k)>=0))
         e.preventDefault();
 });
}

</script>
	<script>
function validateAccount(){
	var accNo = document.getElementById("F_AC_NO").value;
	var accLen = accNo.length;
	  if(accLen > 5){
		  $.ajax({
				type:"GET",
				url:"validateAccount.obj",
				data:{"accNo":accNo},
				success:function(result){
					document.getElementById("accNoCheck").value = result;
					if(result === 'false'){
						document.getElementById("dubAcc").innerHTML = "Duplicate account number";
					}else{
						document.getElementById("dubAcc").hide();
					}
				}	
		  });
	 }  
}
</script>

	<script>
            /* this function is called when we
            click on the submit button*/
            function numberValidation() {
                /*get the value of the textfield using a 
                combination of name and id*/
                //form is the name of the form coded below
                //numbers are the name of the inputfield
                /*value is used to fetch the value written 
                in that particular field*/
                var n = document.form.numbers.value;  
			/* isNan() function check whether passed variable 
			   is number or not*/
                if (isNaN(n)) {
				/*numberText is the ID of span that print "Please enter 
				Numeric value" if the value of inputfield is not a number*/
                    document.getElementById(
                      "numberText").innerHTML =
                      "Please enter Numeric value";
                    return false;
                } else {
                  /*numberText is the ID of span that print 
			      "Numeric value" if the value of inputfield is a number*/
                    document.getElementById(
                      "numberText").innerHTML = 
                      "Numeric value is: " + n;
                    return true;
                }
            }
        </script>
<script>
 $('#F_BANK_DOC').on('change', function() {
        	
            var size = (this.files[0].size/ 1024 / 1024).toFixed(2);
            if (size > 1 || size < .33) {
            	 $("#F_BANK_DOC").val("");
            	document.getElementById("errBank").innerHTML = "File must be between the size of 330KB-1 MB";
            } else {
            	if(size < 1 && size > .33) {
            		size = size * 1024;
            		
            		 $("#errBank").html('<span style="color:green">size: ' + size + "KB</span>");
            	 }
            	else{
                $("#errBank").html('<p style="color:green">size:' + size + "MB</p>");
              }
            }
        });
</script>
	
 	<script>
        $('#F_ID_PROF').on('change', function() {
       var size =(this.files[0].size/ 1024 / 1024).toFixed(2);
            if (size > 1 || size < .33) {
             $("#F_ID_PROF").val("");
        document.getElementById("errIdProof").innerHTML = "File must be between the size of 330KB-1 MB";
            	 //alert("hgdfhgf");
            } else {
            	if(size < 1 && size > .33) {
            		size = size * 1024;
            		
            		 $("#errIdProof").html('<span style="color:green">size: ' + size + "KB</span>");
            		
            	}
            	else{
                	$("#errIdProof").html('<p style="color:green">size:' + size + "MB</p>");
         	    }
            }
        });
    </script>
    
	<script>
        $('#F_REG_FORM').on('change', function() {
            var size =
               (this.files[0].size/ 1024 / 1024).toFixed(2);
            if (size > 1 || size < .33) {
            	 $("#F_REG_FORM").val("");
            	document.getElementById("errRegForm").innerHTML = "File must be between the size of 330KB-1 MB";
            } else {
            	if(size < 1 && size > .33) {
            		size = size * 1024;
            		 $("#errRegForm").html('<span style="color:green">size: ' + size + "KB</span>");
            	}
            	else{
                	$("#errRegForm").html('<p style="color:green">size:' + size + "MB</p>");
          	  }
            }
        });
    </script>
    <script>
    $('#F_ID_PROF_TYPE').on('change', function() {
    	var  idProofType = $("#F_ID_PROF_TYPE").find(':selected').val();
 
    	if(idProofType == "Aadhar Card"){
    	//	alert("in adhar");
    		$("#F_ID_PROF_No").prop("type", "number");
    	    
    		  $("#F_ID_PROF_No").keyup(function() {
    			 var inputVal = ($(this).val());
    			 var len = inputVal.toString().length;
    			 if(len==12){
    				 $("#F_ID_PROF_No").prop("type", "text");
    				 $("#F_ID_PROF_No").attr("maxlength", "12");
    			 }
    		});  
    	}else{
    	//	alert("in voter");
    		$("#F_ID_PROF_No").prop("type", "text");
    		$("#F_ID_PROF_No").attr("maxlength", "10");
    	}
    });
    </script>
	<script>
function validateAdhar(){
	var adharNo = document.getElementById("F_ID_PROF_No").value;
	var flag = false;
	var adharLen = adharNo.length;
	var  idProofType = $("#F_ID_PROF_TYPE").find(':selected').val();
	if(idProofType == "Aadhar Card")
		{
		if(adharLen == 12){
			  $.ajax({
					type:"GET",
					url:"validateAdhar.obj",
					data:{"adharNo":adharNo},
					success:function(result){
						document.getElementById("aadharNoCheck").value = result;
						if(result == 'false'){
							document.getElementById("errIdProfno").innerHTML = " Adhar Number Already Exists!";
						}
						else{
							document.getElementById("errIdProfno").innerHTML = "";
						}
					}
			  });
		 }
		  else
			  document.getElementById("errIdProfno").innerHTML = "Enter Valid Adhar no";
		
		}
	else if (idProofType == "Voter Id")
		{
		if(adharLen == 12){
			  $.ajax({
					type:"GET",
					url:"validateAdhar.obj",
					data:{"adharNo":adharNo},
					success:function(result){
						document.getElementById("aadharNoCheck").value = result;
						if(result == 'false'){
							document.getElementById("errIdProfno").innerHTML = " Voter Id Already Exists!";
						}
						else{
							document.getElementById("errIdProfno").innerHTML = "";
						}
					}
			  });
		 }
		  else
			  document.getElementById("errIdProfno").innerHTML = "Enter Valid Voter Id";
		}
	else
		{
		 document.getElementById("errIdProfno").innerHTML = "Please Select Identity Type";
		}
	  
}
</script>
<script>
$(document).ready(function(){
  $("#F_BANK_IFSC").blur(function(){
	  var F_BANK_IFSC = document.forms["myForm"]["F_BANK_IFSC"].value;
	  var len=F_BANK_IFSC.length;
	  if(len==11){
		  $.ajax({
	          type: "GET",
	          url: "https://ifsc.razorpay.com/"+F_BANK_IFSC,
	          dataType: "json",
	          processData: false,
	          success: function (data) {
	        	  // console.log(JSON.stringify(data.BRANCH));
	        	  $("#F_BANK_BRANCH").val(JSON.stringify(data.BRANCH).replace(/\"/g, ""));
	        	  $("#F_BANK_NAME").val(JSON.stringify(data.BANK).replace(/\"/g, ""));
	          },
	          error: function (jqXHR, exception) {
	        	 alert("Enter valid IFSC!!!"); 
	          }
	      });
	  }else if(len>11){
		  alert('IFSC Code cannot be more then 11 characters');
	  }	 
  }); 
});
</script>
<script>
$("#ParentMenuID").change(function(){
	var val=$(this).val();	
	//alert(val);
	if(val!="")
	{
		$.ajax({
			type:"GET",
			url:"pIcon.obj",
			data:{"F_District":val},
			success:function(result){
 				if(result.length>0){
 					var result = JSON.parse(result);
 					var s = "<option disabled selected value>-Select-</option>";
 					for(var i = 0; i < result.length; i++) {
 						s += '<option value="' + result[i] + '">' + result[i] + '</option>';
 					}
 					$('#child').html(s);
				}
 				else
 				{
 					document.getElementById("child").style.display="none";
 					document.getElementById("selectedArea").value="";
 					//document.getElementById("selectedAreaDiv").style.display="none";
 					//alert("No Record Found!");
 				}			
			}			
		});			
	}
});	
</script>

<script type="text/javascript">

$(document).ready(()=>{
    $('#F_REG_FORM').change(function(){
      const file = this.files[0];
      console.log(file);
      if (file){
        let reader = new FileReader();
        reader.onload = function(event){
          console.log(event.target.result);
          $('#imgPreview').attr('src', event.target.result);
          $('#imgPreview').attr('width', "150px");
        }
        reader.readAsDataURL(file);
      }
    });
  });
  </script>

  <script>
 $(document).ready(()=>{
 $('#F_ID_PROF').change(function(){
      const file = this.files[0];
      console.log(file);
      if (file){
        let reader = new FileReader();
        reader.onload = function(event){
          console.log(event.target.result);
          $('#imgPreviewidentity').attr('src', event.target.result);
          $('#imgPreviewidentity').attr('width', "150px");
        }
        reader.readAsDataURL(file);
      }
      
      
    });
  });
  </script>
 
  
<script>
$(document).ready(()=>{
    $('#F_BANK_DOC').change(function(){
      const file = this.files[0];
      console.log(file);
      if (file){
        let reader = new FileReader();
        reader.onload = function(event){
          console.log(event.target.result);
          $('#imgPreviewwbank').attr('src', event.target.result);
          $('#imgPreviewwbank').attr('width', "150px");
        }
        reader.readAsDataURL(file);
      }
    });
  });
</script>

<script>
$("#child").change(function(){
	//alert("hello");
	var val = $(this).val();	
	//alert(val);
 	if(val!="")
	{
 		//alert("sjbgsgd");
 		$.ajax({
			type:"GET",
			url:"findVByBlock.obj",
			data:{"F_Block":val},
			success:function(result){
				
			//	alert(result);
 				if(result.length>0){
 					var result = JSON.parse(result);
 					var s = "<option disabled selected value>-Select-</option>";
 					for(var i = 0; i < result.length; i++) {
 						s += '<option value="' + result[i] + '">' + result[i] + '</option>';
 					}
 					$('#F_Block').html(s);
				}
 				else
 				{
 					document.getElementById("F_Block").style.display="none";
 					document.getElementById("selectedArea").value="";
 					//document.getElementById("selectedAreaDiv").style.display="none";
 					alert("No Record Found!");
 				} 			
			}			
		});	 	
	}
 });	
</script>

<script>
$("#F_Block").change(function(){
	//alert("hello");
	var val = $(this).val();	
	//alert(val);
	if(val!="")
	{
 		//alert("sjbgsgd");
 		$.ajax({
			type:"GET",
			url:"findByPoliceStation.obj",
			data:{"PoliceStation":val},
			success:function(result){
				//alert(result);
 				if(result.length>0){
 					var result = JSON.parse(result);
 					var s = "<option disabled selected value>-Select-</option>";
 					//var html = "<option disabled selected value>-Select-</option>";
 					for(var i = 0; i < result.length; i++) {
 						s += '<option value="' + result[i] + '">' + result[i] + '</option>';
 					}
 					$('#PoliceStation').html(s);
				}
 				else
 				{
 					document.getElementById("PoliceStation").style.display="none";
 					document.getElementById("selectedArea").value="";
 					//document.getElementById("selectedAreaDiv").style.display="none";
 					alert("No Record Found!");
 				} 			
			}			
		});	 	
	}
 });	
</script>


<script>
    function validateBANKFileType(){
        var F_BANK_DOC = document.getElementById("F_BANK_DOC").value;
        var idxDot = F_BANK_DOC.lastIndexOf(".") + 1;
        var extFile = F_BANK_DOC.substr(idxDot, F_BANK_DOC.length).toLowerCase();
         if (extFile=="jpg" || extFile=="jpeg" || extFile=="png")
        {
            
        }else{
            alert("Only jpg/jpeg and png files are allowed!");
        }   
    }
</script>
<script>
    function validateIDFileType(){
    	
        var F_ID_PROF = document.getElementById("F_ID_PROF").value;
        var idxDot = F_ID_PROF.lastIndexOf(".") + 1;
        var extFile = F_ID_PROF.substr(idxDot, F_ID_PROF.length).toLowerCase();
        
        if (extFile=="jpg" || extFile=="jpeg" || extFile=="png")
        {
        	
            
        }else{
            alert("Only jpg/jpeg and png files are allowed!");
        }   
    }
</script>
<script>
    function validateREGFileType(){
     var F_REG_FORM = document.getElementById("F_REG_FORM").value;
        var idxDot = F_REG_FORM.lastIndexOf(".") + 1;
        var extFile = F_REG_FORM.substr(idxDot, F_REG_FORM.length).toLowerCase();
        if (extFile=="jpg" || extFile=="jpeg" || extFile=="png")
        {
            
        }else{
            alert("Only jpg/jpeg and png files are allowed!");
        }   
    }
</script>

	<!-- END PAGA BACKDROPS-->
	<!-- CORE PLUGINS-->
	<script src="./assets/vendors/jquery/dist/jquery.min.js"
		type="text/javascript"></script>
		<script src=
"https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
        </script>
	<script src="./assets/vendors/popper.js/dist/umd/popper.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/bootstrap/dist/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script src="./assets/vendors/metisMenu/dist/metisMenu.min.js"
		type="text/javascript"></script>
	<script
		src="./assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"
		rel="stylesheet" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<!-- PAGE LEVEL PLUGINS-->
	<!-- CORE SCRIPTS-->
	<script src="assets/js/app.min.js" type="text/javascript"></script>
</body>
 
</html>