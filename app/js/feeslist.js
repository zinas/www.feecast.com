(function ($) {

    var oTable = $('#fees-list').dataTable({
        bFilter: false,
        bInfo: false,
        bLengthChange: false,
        bPaginate: false
    });

    var doctors =
        '<div class="row">'+
            '<div class="col-sm-3"><strong>Dr. Nikos</strong></div>'+
            '<div class="col-sm-4"><span class="theme-prominent">$100</span></div>'+
        '</div>';

        $('#fees-list').on('click', 'tbody tr', function () {
              var nTr = $(this)[0];
              if ( oTable.fnIsOpen(nTr) )
              {
                  /* This row is already open - close it */
                  $(this).removeClass('opened');
                  oTable.fnClose( nTr );
              }
              else
              {
                  /* Open this row */
                  $(this).addClass('opened');
                  oTable.fnOpen( nTr, doctors + doctors + doctors, 'details' );
              }
          } );


    $('.my-slider').slider();
})(jQuery);