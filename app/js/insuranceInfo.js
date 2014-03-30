(function ($) {
if (localStorage.getItem('cptCodes')) {
  var codes = eval('('+localStorage.getItem('cptCodes')+')');
  initCptSearch(codes);
} else {
  $.get('stubs/cpt-codes.json', function (data) {
    initCptSearch(data);
    localStorage.setItem('cptCodes', JSON.stringify(data));
  });
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
  }).on('typeahead:selected', function (event, suggestion) {
    var $need = $(needTemplate);
    $need.find('.task-title-sp').html(suggestion.CPT_SHORT_DESCRIPTION);
    $need.find('.bg-info').html(suggestion.CPT_CODE);
    $need.find('button').on('click', function (event) { event.preventDefault(); $need.remove(); });
    $('#selected-needs ul').append($need);
   $('#search-need').typeahead('val', '');
  });
  $('#search-need').attr("placeholder", "Enter keyword or CPT code to descibe need (e.g. Colonoscopy or 44388)");
}



var needTemplate =
    '<li class="list-primary">'+
        '<div class="task-title">'+
            '<span class="task-title-sp"></span>'+
            '<span class="badge bg-info"></span>'+
            '<div class="pull-right hidden-phone">'+
                '<button class="btn btn-danger btn-xs fa fa-trash-o"></button>'+
            '</div>'+
        '</div>'+
    '</li>';

})(jQuery);