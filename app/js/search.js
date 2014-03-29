(function ($) {
if (localStorage.getItem('cptCodes')) {
  var codes = $.parseJSON(localStorage.getItem('cptCodes'));
  initCptSearch(codes);
} else {
  $.get('stubs/cpt-codes.json', function (data) {
    initCptSearch(data);
    localStorage.setItem('cptCodes', JSON.stringify(data));
  }, "json");
}

function initCptSearch(data) {
  var cptEngine = new Bloodhound({
    name: 'cptEngine',
    local: data,
    datumTokenizer: function(d) {
      return Bloodhound.tokenizers.whitespace(d.CPT_CODE + ' ' + d.CPT_LONG_DESCRIPTION + ' ' + d.CPT_SHORT_DESCRIPTION);
    },
    queryTokenizer:Bloodhound.tokenizers.whitespace
  });
  cptEngine.initialize(true);
  $('#search-need').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  }, {
    source: cptEngine.ttAdapter(),
    displayKey: function (suggestion) {
      return suggestion.CPT_SHORT_DESCRIPTION + ' (' + suggestion.CPT_CODE + ')';
    },
    templates: {
      suggestion : function (suggestion) {
        tpl =
          '<div class="tt-single-suggestion">'+
              '<div class="tt-main">'+suggestion.CPT_SHORT_DESCRIPTION + ' (' + suggestion.CPT_CODE + ')</div>'+
              '<div class="tt-secondary">'+suggestion.CPT_LONG_DESCRIPTION + '</div>'+
          '</div>';
        return tpl;
      }
    }
  });
  $('#search-need').attr("placeholder", "Enter keyword or CPT code to descibe need (e.g. Colonoscopy or 44388)");
}

$('.body-point').on('click', function () {
  var form = $(
    '<form method="post" action="'+baseUrl+'/fees/list">'+
      '<input type="text" name="search-need" value="'+$(this).data('cpt')+'">'+
    '</form>'
  );

  form.submit();
});

})(jQuery);
