

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>KeuanganKu</b> Private System | Version 1.5
        </div>
        <strong>Copyright &copy; 2014-2015 <a href="<?php echo base_url() . 'transactionListing'; ?>">KeuanganKu</a>.</strong> All rights reserved.
    </footer>
    
    <script src="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/adminlte.min.js" type="text/javascript"></script>
    <!-- <script src="<?php echo base_url(); ?>assets/dist/js/pages/dashboard.js" type="text/javascript"></script> -->
    <script src="<?php echo base_url(); ?>assets/js/jquery.validate.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>assets/js/validation.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>assets/dist/js/bootstrap-datepicker.id.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var windowURL = window.location.href;
        pageURL = windowURL.substring(0, windowURL.lastIndexOf('/'));
        var x= $('a[href="'+pageURL+'"]');
            x.addClass('active');
            x.parent().addClass('active');
        var y= $('a[href="'+windowURL+'"]');
            y.addClass('active');
            y.parent().addClass('active');
        $('.datepicker').datepicker({
          format: 'yyyy-mm-dd',
          startDate: '-3d',
          todayHighlight: true,
          todayBtn: true,
          autoclose: true,
          endDate: '0d'
        });
    </script>
  </body>
</html>