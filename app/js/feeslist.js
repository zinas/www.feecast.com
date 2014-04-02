(function ($) {

    var oTable = $('#fees-list').dataTable({
        bFilter: false,
        bInfo: false,
        bLengthChange: false,
        bPaginate: false
    });

    var doctors =
        '<div class="hoverable">'+
        '<div class="row">'+
          '<div class="col-sm-4 radio">'+
            '<label>'+
              '<input type="radio" name="optionsRadios" value="option1" checked>'+
              '<strong>&nbsp;&nbsp;Dr. Nikos</strong>'+
            '</label>'+
          '</div>'+
            '<div class="col-sm-2"><span class="theme-prominent">$100</span></div>'+
        '</div></div>';

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
        // $('#fees-list').on('click', 'tbody tr [data-toggle="modal"]', function (e) {
        //     e.stopPropagation();
        //     $(this).modal('open')
        // });

    $('.my-slider').slider();
    $('.contact').on('click', function (event) { event.stopPropagation(); });

})(jQuery);