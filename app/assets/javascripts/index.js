$(document).ready(function() {
	$('#myCarousel').carousel({
	interval: 10000
	})
    $('#myCarousel').on('slid.bs.carousel', function() {
	});

  $(function() {
    $('.toggle-input-topic').click(function(e){
      e.preventDefault();
      $('.topic-search-input-container').toggleClass('hidden');
      $('.company-search-input-container').toggleClass('hidden');
      $('.toggle-input-topic').toggleClass('hidden');
      $('.toggle-input-company').toggleClass('hidden');
    });
  });

  $(function() {
    $('.toggle-input-company').click(function(e){
      e.preventDefault();
      $('.topic-search-input-container').toggleClass('hidden');
      $('.company-search-input-container').toggleClass('hidden');
      $('.toggle-input-topic').toggleClass('hidden');
      $('.toggle-input-company').toggleClass('hidden');
    });
  });

});
