(function ($) {

    var oTable = $('#fees-list').dataTable({
        bFilter: false,
        bInfo: false,
        bLengthChange: false,
        bPaginate: false
    });

  $('#fees-list.has-insurance-info').on('click', 'tbody tr.odd, tbody tr.even', function () {
        var nTr = $(this)[0],
            $tr = $(this),
            loaded = $(this).data('loaded')=="1"?true:false;
            $tr.physicians = null;

        if ( oTable.fnIsOpen(nTr) )
        {
            $(this).removeClass('opened');
            oTable.fnClose( nTr );
        }
        else
        {
            $(this).addClass('opened');
            if (!loaded) {
              oTable.fnOpen( nTr, '<div class="loader"></div>', 'details' );
              $.ajax({
                url: $tr.data('target-url'),
                data: {center_id:$tr.data('center-id'), cpt_id:$tr.data('cpt-id')},
                success: function (data) {
                  $tr.physicians=data;
                  $tr.data('physicians', data);
                  $tr.data('loaded', '1');
                  $tr.next('tr').find('.details').html(_renderPhysicians($tr.physicians));
                }
              });
            } else {
              oTable.fnOpen( nTr, _renderPhysicians($tr.data('physicians')), 'details' );
            }
        }
    } );

    $('.js-center-details').on('click', function (event) {
      event.stopPropagation();
    });

    function _renderPhysicians(physicians) {
      var result='', p, i, template =
          '<div class="hoverable">'+
          '<div class="row">'+
            '<div class="col-sm-4 radio">'+
              '<label>'+
                '<input type="radio" name="optionsRadios" value="__id__" checked>'+
                '<strong>__name__</strong>'+
              '</label>'+
            '</div>'+
              '<div class="col-sm-2"><span class="theme-prominent">__price__</span></div>'+
          '</div></div>';

      for (i=0; i<physicians.length; i++) {
        p = template
              .replace("__name__", physicians[i].physician)
              .replace("__id__", physicians[i].physicianId)
              .replace("__price__", physicians[i].price);

        result += p;
      }
      return result;
    }


    $('.my-slider').slider();
    $('.js-contact-provider').on('click', function (event) {
      event.stopPropagation();
      var $details, $tr, center, cpt, physician = null, url;

      $tr = $(this).parents('tr');
      url = $tr.data('contact-url')+'?center='+$tr.data('center-id')+'&cpt='+$tr.data('cpt-id');
      $details  = $tr.next('tr').find('.details');
      if ($details.length) {
        url += '&physician='+$details.find('[name="optionsRadios"]:checked').val();
      }

      window.location.href = url;
    });


    $('.insurance-carrier').on('change', function (event) {
      $('.insurance-options').addClass('hidden');
      $.ajax({
        url: $(this).data('target-url'),
        data: {"insurance-id":$(this).val()},
        success: function (html) {
          $('.plans-placeholder').html(html);
          $('.insurance-options').removeClass('hidden');
        }
      });
    });

})(jQuery);