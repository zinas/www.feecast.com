(function ($) {
var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        // the typeahead jQuery plugin expects suggestions to a
        // JavaScript object, refer to typeahead docs for more info
        matches.push({ value: str });
      }
    });

    cb(matches);
  };
};

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

$('#search-location').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'states',
  displayKey: 'value',
  source: substringMatcher(states)
});

var providersEngine = new Bloodhound({
  name: 'providersEngine',
  prefetch: {url: 'stubs/insurance-list.json'},
  datumTokenizer: function(d) {
    return Bloodhound.tokenizers.whitespace(d.CompanyName);
  },
  queryTokenizer:Bloodhound.tokenizers.whitespace
});
providersEngine.initialize(true);

$('#search-provider').typeahead({
  minLength: 2
}, {
  source: providersEngine.ttAdapter(),
  displayKey: function (suggestion) {
    return suggestion.CompanyName;
  }
});

$.get('stubs/cpt-codes.json', function (data) {
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
      highlight: true
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
});

})(jQuery);