<!-- Start Footer --> 
<footer>
	<div class="container">
		<div class="row">
		<div class="footer_top">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="header_address">
					<div class="address"><i class="flaticon-placeholder" aria-hidden="true"></i><span><strong>Suite #405, Iscon Atria 1,</strong><br>Gotri Road, Vadodara 390021</span></div>
					<div class="address"><i class="flaticon-smartphone" aria-hidden="true"></i><span><strong>Call Us Now</strong><br><a href="tel:+91 265.298.3937">+91 265.298.EYES (3937)</a></span></div>
					<div class="address"><i class="flaticon-mail" aria-hidden="true"></i><span><strong>Send Us Email</strong><br><a href="mailto:info@theopeneyes.com">info@theopeneyes.com</a></span></div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="footer_bottom">
			<div class="col-md-6 col-sm-6 text-left footer-left">Copyrights &copy; 2019 <a href="http://theopeneyes.com/" target="_blank">OpenEyes Software Solutions Pvt. Ltd</a></div>
				<div class="col-md-6 col-sm-6 text-right footer-right">
					<ul class="social_links">
						<li><a href="https://twitter.com/OpenEyesTech" target="_blank"><i class="flaticon-twitter-logo-silhouette" aria-hidden="true"></i></a></li>
						<li><a href="https://www.linkedin.com/company/13243146/" target="_blank"><i class="flaticon-linkedin" aria-hidden="true"></i></a></li>
					</ul>
				</div>
		</div>
		</div>
	</div>
</footer>
<div class="clearfix"></div>
<!-- End Footer -->

<!-- Start Scripts -->

<script src="<?php echo base_url(); ?>assets/js/jquery-1.11.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/custom.js"></script>
<script src="<?php echo base_url(); ?>assets/js/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/dataTables.buttons.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/dataTables.responsive.min.js"></script>
<script type="<?php echo base_url(); ?>text/javascript" src="assets/js/jszip.min.js"></script>
<script type="<?php echo base_url(); ?>text/javascript" src="assets/js/buttons.html5.min.js"></script>
<script type="<?php echo base_url(); ?>text/javascript" src="assets/js/buttons.print.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/sweetalert2.min.js"></script>
<!-- End Scripts -->
<script>
setTimeout(function(){
			if ($("body").height() < $(window).height()) {  
				$('footer').addClass('footer_fixed');     
		}      
		else{  
				$('footer').removeClass('footer_fixed');    
		}
	  },100);
	  $('body').tooltip({
			selector: '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])',
			trigger: 'hover',
			container: 'body'
			}).on('click mousedown mouseup', '[data-toggle="tooltip"], [title]:not([data-toggle="popover"])', function () {
			$('[data-toggle="tooltip"], [title]:not([data-toggle="popover"])').tooltip('destroy');
			});
</script>
</body>
</html>