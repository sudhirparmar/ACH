<?php include("header.php"); ?>
<link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css" />
  <link type="image/x-icon" rel="shortcut icon" href="assets/images/favicon.ico" />
  <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="assets/css/font-awesome.min.css" />
  <link type="text/css" rel="stylesheet" href="assets/css/flaticon.css" />
  <link type="text/css" rel="stylesheet" href="assets/css/style.css" />
  <link type="text/css" rel="stylesheet" href="assets/css/jquery.dataTables.min.css" />
  <link type="text/css" rel="stylesheet" href="assets/css/buttons.dataTables.min.css" />
  <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" />
  <link type="text/css" rel="stylesheet" href="assets/css/sweetalert2.min.css" />
  <link type="text/css" rel="stylesheet" href="assets/css/achlist.css" />



<div class="inner_content table-list">	
	<div class="container">
	
	

		<div class="row">
			<div class="col-md-12">
				<div class="page_content">
				<div id="page-wrapper">
					
					<h1 class="text-center">List of ACH forms</h1>
					
					<div class="btn btn-primary" id="newach_btn"><a id="back_btn" href="<?php echo base_url(); ?>AchForm">New Ach</a></div>
					<div class="separator text-center"><span class="dott"></span><span class="dott"></span><span class="dott"></span></div>
					<div class="btn-group pull-right add-right">
					</div>
					<div class="clearfix"></div>
					<!-- end  page header -->
					<!-- Advanced Tables -->
							<table class="table table-bordered" id="dataTables-example" style="width:100%">
							<thead>
							<tr>
							<!-- <th style="width:2%;">Sr. No.</th> -->
							<!-- <th>Sr No.</th> -->
							<th>Name</th>
							<th>Home Address</th>
							<th>Contact No.</th>
							<th>Email</th>
							<th>Bank Name</th>
							<th>Bank Address</th>
							<th>Bank Account Number</th>
							<th>IFSC Code</th>
							<th>Bank Phone</th>
							<th>Account Type</th>
							<th>PAN Card</th>
							<th>Address Proof</th>
							</tr>
							</thead>
							<tbody>

							<?php 
							$i=0; 
							foreach ($record->result() as $row)  
							{  $i++;
							?>
							<tr>  
							
							<td><?php echo $row->firstname." ".$row->lastname;?></td>  
							<td><?php echo $row->homeaddress;?></td>  
							<td><?php echo $row->phone;?></td>  
							<td><?php echo $row->email;?></td>  
							<td><?php echo $row->bankname;?></td>  
							<td><?php echo $row->bankaddress;?></td>  
							<td><?php echo $row->bankacno;?></td>  
							<td><?php echo $row->ifsc_code;?></td> 
							<td><?php echo $row->bank_phone;?></td>
							<td><?php echo $row->account_type;?></td>  
							
							<td>
							<a href="<?php  echo $row->pancard; ?>" Download>
								<img  alt="W3Schools" src="assets/images/download-icon.jpg" style="height:20px;widht:25px;margin-left:10px;">
							</a>
							</td> 
							<td>
							<a href="<?php echo $row->address_proof;?>" Download>
								<img  alt="W3Schools" src="assets/images/download-icon.jpg" style="height:20px;widht:25px;margin-left:10px;">
							</a>
							</td> 
							
							</tr>  
							<?php }  
							if($record->result()==null){
							?>  
							<tr>
							<td colspan="8" class="text-center">There is no record found</td>
							</tr>
							<?php
							}
							?>
							<!-- <td>
							<div class="inline_delbtn tooltip_inline" data-placement="bottom" title="Print HR Questionnaire Form">
							<button class="btn btn-suucess btn-rounded btn-sm edit-user-row-with-ajax-button" (click)="viewCandidate(candidate.CandidateId)"><i
							class="fa fa-print"></i></button>
							</div>
							</td> -->

							</tbody>
							</table>
						</div>
						<!--End Advanced Tables -->
						</div>
				</div>
				<!-- end page-wrapper -->
		</div>
	</div>
</div>

<?php include("footer.php"); ?>
<script type="text/javascript">
	$(document).ready(function() {
    $('#dataTables-example').dataTable({
        responsive: {
            details: {
                display: $.fn.dataTable.Responsive.display.childRowImmediate,
                type: ''
            }
        },
        scrollCollapse: true,
        dom: 'Bfrtip',
        buttons: [{
            extend: 'excel',
            title: 'ACH List',
            exportOptions: {
                columns: [0, 1, 2, 3, 4,7,8,9,10,11,12]
            }
        }]
    });
    $('.buttons-excel').attr('data-original-title', 'Export').tooltip();
    $('#dataTables-example_filter input').addClass('input-sm');

	
});
</script>