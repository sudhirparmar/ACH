
<?php include("header.php");


?>

<!--<div class="inner_banner">
    <img src="assets/images/inner_banner.jpg" alt="" class="img-responsive" />
    <div class="innerbanner_text">Your information</div>
</div>
<div class="clearfix"></div>-->
<!-- End Inner Section -->
<!-- Inner Section -->

<!-- <link rel = "stylesheet" type = "text/css" 
   href = "assets/css/style.css">

   <link rel = "stylesheet" type = "text/css" 
   href = "assets/css/bootstrap.min.css"> -->

  
  

<?php
if($this->session->flashdata('record'))
{
  echo "  <div class='col-md-12 alert alert-success' id='success'>";

     echo $this->session->flashdata('record'); 

    echo "</div>";
}
?>
</div>

<style>
form .error {
  color: #ff0000;
}
</style>



<sript>

</script>
<div class="inner_content">
    <div class="container ">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
						   <div class="content-area">
	   <div id="main">

       <h1 class="text-center">ACH Information</h1>
      
    <hr>
	   <h2 class="text-center">Your Information</h2>
		<div class="separator text-center"><span class="dott"></span><span class="dott"></span><span class="dott"></span>
        </div>
                        <div class="clearfix"></div>
                        
                        <form method="post" name="achform" action="<?php echo base_url(); ?>AchForm/validate"  id="form-user" enctype="multipart/form-data">
                            <div class="ans_block">

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span" > *</span>  First Name</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="first_name" id="firstName" maxlength="50"  />
                                        <?php if(form_error('first_name')){echo form_error('first_name');}?>
                                </div>

                                </div>

                               

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span" >*</span> Last Name</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="last_name" id="last_name" maxlength="50" placeholder="" />
                                        <?php if(form_error('last_name')){echo form_error('last_name');}?>
                                    </div>
                                </div>
                               
                             

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Home Address</label>
                                </div>
                                 <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <textarea class="form-control" name="home_address" id="home_address" maxlength="500"></textarea>
                                        <?php if(form_error('home_address')){echo form_error('home_address');}?>
                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Phone Number</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="phone" id="phone" maxlength="10" />
                                        <?php if(form_error('phone')){echo form_error('phone');}?>
                                    </div>
                                </div>
                                

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Email Address</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="email" class="form-control" name="email" id="email"  />
                                        <?php if(form_error('email')){echo form_error('email');}?>

                                    </div>
                                </div>
                                

                                
                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Attach PAN Card</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="file" class="form-control" name="pan_card" accept="application/pdf,image/jpg,image/jpeg,image/png,image/jpeg" />
                                        <?php if(form_error('pan_card')){echo form_error('pan_card');}?>
                                        <h5>allowed format (.pdf .jpg .jpeg .png)</h5>
                                    </div>
                                </div>
                               


                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Attach Address Proof</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                    <input type="file"  class="form-control" name="address_proof" accept="application/pdf,image/jpg,image/jpeg,image/png,image/jpeg"/>
                                    <?php if(form_error('address_proof')){echo form_error('address_proof');}?>
                                    <h5>allowed format (.pdf .jpg .jpeg .png)</h5>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <hr>
                                
                                <h2 class="text-center">Bank  Information</h2>
                                <div class="separator text-center"><span class="dott"></span><span class="dott"></span><span class="dott"></span></div>
                                <div class="clearfix"></div>

                                 <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Bank Name</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="bank_name" id="bank_name" maxlength="50" />
                                        <?php if(form_error('bank_name')){echo form_error('bank_name');}?>
                                    </div>
                                </div>
                               
                                
                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Bank Address</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <textarea class="form-control" name="bank_address" id="bank_address" maxlength="500"></textarea>
                                        <?php if(form_error('bank_address')){echo form_error('bank_address');}?>
                                    </div>
                                </div>
                               

                                 <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Bank Account Number</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="number" class="form-control" name="bank_acno" id="bank_acno"/>
                                        <?php if(form_error('bank_acno')){echo form_error('bank_acno');}?>

                                    </div>
                                </div>
                                
                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>IFSC Code</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="ifsc_code" id="ifsc_code" />
                                        <?php if(form_error('ifsc_code')){echo form_error('ifsc_code');}?>
                                    </div>
                                </div>
                               

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right atp_title mt-5" style="text-align:right;"><span class="error_span">*</span>Account Type</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <div class="radio_box">
                                            <input type="radio" name="actype" value="Current" id="Current" checked="checked"/>
                                            <label for="Current">Current</label> 
                                            <input type="radio" name="actype" value="Saving" id="Saving"/>
                                             <label for="Saving" >Saving</label>  
                                            
                                        </div>
                                    </div>
                                    <span id="radio_error"></span>
                                </div>
                               

                                <div class="col-md-2 col-sm-3">
                                    <label class="pull-right mt-5"><span class="error_span">*</span>Bank Phone Number</label>
                                </div>
                                <div class="col-md-4 col-sm-9">
                                    <div class="form-group">
                                        <input type="number" class="form-control"  name="bank_phone" id="bank_phone" maxlength="50" />
                                       
                                       <?php if(form_error('bank_phone')) {echo  form_error('bank_phone');}?>
                                    </div>
                                </div>
                                
                               
                                
                                <div class="clearfix"></div>
                            </div>
                            <div class="col-md-4" id="error" style="color: red"></div>
                            <div class="clearfix"></div>
                            <div class="col-md-12">
                                <div class="form-btn">
                                    <button type="submit" class="lgn_btn margin_top"  id="btn"><span>Submit</span></button><img src="<?php echo base_url();?>assets/images/loader.gif" id="loader" width="30px" height="auto" style="margin-left:15px;display:none;">
                                    
                                    <a class="lgn_btn margin_top" href="Ach_List"><span>View List</span></a><img src="<?php echo base_url();?>assets/images/loader.gif" id="loader" width="30px" height="auto" style="margin-left:15px;display:none;">
                                </div>
                               
                            </div>
                            </form>
            </div>
			</div>
			</div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
<?php include("footer.php"); ?>
<!-- End Inner Section -->
<style>
</style>

<script>
//  function onlyAlphabet(value,id)
//  {
//     // alert(value);
//      if(/^[a-zA-Z0-9- ]*$/.test(value) == false) 
// 	 {
//         //alert("value ="+value);
//        // alert("id ="+id);
        
//         //alert('Special character not allow in lastname');
// 		return false;
// 	 }
//  }



$(document).ready(function(){

$("form[name='achform']").validate({
       
        rules: {
     
      first_name: "required",
      last_name: "required",
      home_address:"required",
      phone:{
        required:true,
        minlength:10,
        maxlength:10
    },
      email: {
        required: true,
        email: true
      },
      pan_card: {
                required: true,
              
            },
    address_proof:{
        required:true
    },
            bank_name:"required",
            bank_address:"required",
            actype:"required",
            bank_phone:"required",

    bank_acno:{
        required:true,
        minlength:9,
        maxlength:18
    },
    ifsc_code:{
        required:true,
        minlength:11,
        maxlength:11
    },
    bank_phone:{
        required:true,
        minlength:10,
        maxlength:10
    },
    
    
 
    },
    // Specify validation error messages
    messages: {
      first_name: "Please enter your firstname",
      last_name: "Please enter your lastname",
      home_address:"Please enter your home address",
      phone:{
            required:"Please enter your phone number",
            minlength:"Please enter valid  phone number",
            maxlength:"Please enter valid phone number",
        },
      email: {
        required: "Please enter your email",
        email: "Please enter valid email"},
        pan_card:{
            required:"Please attach PAN card",
        },

        address_proof:{
            required:"Please attach address proof",
        },
        bank_acno:{
            required:"Please enter  your bank account number",
            minlength:"Please enter valid bank account number",
            maxlength:"Please enter valid bank account number",
        },
        bank_name:"Please enter your bank name",
        bank_address:"Please enter your bank address",
    
        
        ifsc_code:{ 
            required:"Please enter IFSC number",
            minlength:"Please enter valid IFSC number",
            maxlength:"Please enter valid IFSC number",
        },
        bank_phone:{
            required:"Please enter your  phone number",
            minlength:"Please enter valid bank phone number",
            maxlength:"Please enter valid bank phone number",
        },
       

        
    },

  
    // Make sure the form is submitted to the destination defined
    // in the "action" attribute of the form when valid
    submitHandler: function(form) {
       form.submit();
    }

    });
     

});


    
</script>