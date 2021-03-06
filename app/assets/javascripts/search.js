$(document).ready(function() {

  var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
      var matches, substringRegex;
      matches = [];
      substrRegex = new RegExp(q, 'i');
      $.each(strs, function(i, str) {
        if (substrRegex.test(str)) {
          matches.push(str);
        }
      });
      cb(matches);
    };
  };

  //
  // var data_new = JSON.parse($("#dataorgs").data('source'));
  // console.log('DATA_NEW', data_new)


  // console.log ($("#dataorgs").data)
  var data_matches = $('#orgscontainer').data('source');

  var possibles_matches_companies =
    ['Apple', 'A beautiful mess', 'Beyonce', 'Create + cultivate', 'Marie Forleo',  'Nora Ephron', 'She is fierce hq', 'Yellow Collective'];

  var possibles_matches_topics =
    ['Apple', 'Social Media', 'Instagram', 'Business', 'Twitter'];

  var possibles_matches_formats =
    ['Conference', 'Consulting', 'Online Course', 'Resources', 'Workshop' ];


  $('#site_search_company .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 0,
      },
    { name: 'data_matches',
      source: substringMatcher(data_matches),
      limit: '10'
  });


  $('#site_search_topic .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 0
      },
    { name: 'possibles_matches_topics',
      source: substringMatcher(possibles_matches_topics),
      limit: '10'
  });

  $('#site_search_format .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 0
      },
    { name: 'possibles_matches_formats',
      source: substringMatcher(possibles_matches_formats),
      limit: '10'
  });

});
