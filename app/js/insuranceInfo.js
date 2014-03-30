(function ($) {
var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
  'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
  'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
  'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
  'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
  'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
  'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
  'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
  'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
];

var locationsEngine = new Bloodhound({
  name: 'locationsEngine',
  local: states,
  datumTokenizer: function(d) {
    return Bloodhound.tokenizers.whitespace(d);
  },
  queryTokenizer:Bloodhound.tokenizers.whitespace
});
locationsEngine.initialize(true);

$('#search-location').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'states',
  displayKey: function (suggestion) {
    return suggestion
  },
  source: locationsEngine.ttAdapter()
});

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
    $need.find('input').val(suggestion.CPT_SHORT_DESCRIPTION + " (" + suggestion.CPT_CODE + ")");
    $need.find('.bg-info').html(suggestion.CPT_CODE);
    $need.find('button').on('click', function (event) { event.preventDefault(); $need.remove(); });
    $('#selected-needs ul').append($need);
   $('#search-need').typeahead('val', '');
  });
  $('#search-need').attr("placeholder", "Enter keyword or CPT code to descibe need (e.g. Colonoscopy or 44388)");
}

var providersEngine = new Bloodhound({
  name: 'providersEngine',
  prefetch: {url: baseUrl+'/stubs/insurance-list.json'},
  datumTokenizer: function(d) {
    return Bloodhound.tokenizers.whitespace(d.CompanyName);
  },
  queryTokenizer:Bloodhound.tokenizers.whitespace
});
providersEngine.initialize(true);

$('#health-insurance-carrier').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
}, {
  source: providersEngine.ttAdapter(),
  displayKey: function (suggestion) {
    return suggestion.CompanyName;
  }
});

$('.tasks-widget').on('click', 'button.fa-trash-o', function (event) {
    event.preventDefault();
    $(this).parents('li').remove();
});

var needTemplate =
    '<li class="list-primary">'+
        '<div class="task-title">'+
            '<span class="task-title-sp"></span>'+
            '<input type="hidden" name="search-needs[]" value="">'+
            '<span class="badge bg-info"></span>'+
            '<div class="pull-right hidden-phone">'+
                '<button class="btn btn-danger btn-xs fa fa-trash-o"></button>'+
            '</div>'+
        '</div>'+
    '</li>';

var doctorTemplate =
    '<li class="list-warning">'+
        '<div class="task-title">'+
            '<span class="task-title-sp"></span>'+
            '<div class="pull-right hidden-phone">'+
                '<button class="btn btn-danger btn-xs fa fa-trash-o"></button>'+
            '</div>'+
        '</div>'+
    '</li>';

})(jQuery);