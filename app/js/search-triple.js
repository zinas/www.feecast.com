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

var providersEngine = new Bloodhound({
  name: 'providersEngine',
  prefetch: {url: baseUrl+'/stubs/insurance-list.json'},
  datumTokenizer: function(d) {
    return Bloodhound.tokenizers.whitespace(d.CompanyName);
  },
  queryTokenizer:Bloodhound.tokenizers.whitespace
});
providersEngine.initialize(true);

$('#search-provider').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
}, {
  source: providersEngine.ttAdapter(),
  displayKey: function (suggestion) {
    return suggestion.CompanyName;
  }
});

if (localStorage.getItem('cptCodes')) {
  var codes = eval('('+localStorage.getItem('cptCodes')+')');
  initCptSearch(codes);
} else {
  $.get(baseUrl+'/stubs/cpt-codes.json', function (data) {
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
  });
  $('#search-need').attr("placeholder", "Enter keyword or CPT code to descibe need (e.g. Colonoscopy or 44388)");
}

})(jQuery);