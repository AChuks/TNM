var initialLoad = true;
$(document).ready(function(){

	var owl = $(".owl-carousel");
	if (initialLoad == true){
		owl.html(owl.find('.owl-wrapper').html());
	}
	owl.owlCarousel({
    	autoPlay: true
    });
   initialLoad = false;
});