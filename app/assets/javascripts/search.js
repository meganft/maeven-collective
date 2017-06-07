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

  // var possibles_matches =  $("#the-basics").data("source");

  var possibles_matches =
    ['Beyonce', 'Nora Ephron', 'Marie Forleo', 'Create + cultivate', 'Test', 'Apple', 'She is fierce hq', 'A beautiful mess'];

  var possibles_matches_topics =
    ['Apple', 'Social Media', 'Instagram', 'Business', 'Twitter'];


  $('#site_search_company .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 1
      },
    { name: 'possibles_matches',
      source: substringMatcher(possibles_matches)
  });


  $('#site_search_topic .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 1
      },
    { name: 'possibles_matches_topics',
      source: substringMatcher(possibles_matches_topics)
  });

});
