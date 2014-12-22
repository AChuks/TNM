//Medioworks Tuber Social Video Theme Framework 1.0.1
//© Copyright 2013 - Design and Sitebuild
//Web - www.medioworks.com
//Envato Exclusive Author - http://themeforest.net/user/MedioWorks


// JavaScript Document


//--------- PrettyPhoto SCRIPT ---------//
$(document).ready(function(){
	$("a[data-rel^='prettyPhoto']").prettyPhoto({
	theme: 'dark_square' /* light_rounded / dark_rounded / light_square / dark_square / facebook */
	});
});

//--------- ScrollTop SCRIPT ---------//
	// fade in #back-top
$(document).ready(function(){
$('#back-top a').click(function () {
	$('body,html').animate({
		scrollTop: 0
	}, 1000);
	return false;
	});
});

//--------- SLIDERS SCRIPT ---------//
$(document).ready(function(){
$("#c-slider").carouFredSel({
	synchronise	: [
		["#c-slider", true, true, 0],
		["#c-slider2", false, false, 0],
		["#c-slider3", true, false, 2]
	]
});

$('#c-slider').carouFredSel({
	auto: false,
	prev: '#carousel_prev',
	next: '#carousel_next',
	direction: "left",
	responsive  : true,
	width	: "100%",
	scroll	: 2,
	duration: 1000,
	pauseOnHover: true,
	items		: {
		visible		: 3,
		width		: "100%",
		height: '66%',
		visible: {
			min: 3,
			max: 6
		}
	}
	
	
});

$('#c-slider2').carouFredSel({
	auto: false,
	prev: '#carousel_prev2',
	next: '#carousel_next2',
	direction: "left",
	responsive  : true,
	width	: "100%",
	scroll	: 2,
	duration: 1000,
	pauseOnHover: true,
	items		: {
		visible		: 3,
		width		: "100%",
		height: '66%',
		visible: {
			min: 3,
			max: 6
		}
	}
});

$('#c-slider3').carouFredSel({
	auto: false,
	prev: '#carousel_prev3',
	next: '#carousel_next3',
	direction: "left",
	responsive  : true,
	width	: "100%",
	scroll	: 2,
	duration: 1000,
	pauseOnHover: true,
	items		: {
		visible		: 3,
		width		: "100%",
		height: '66%',
		visible: {
			min: 3,
			max: 6
		}
	}
});

// TEST MULTIPLE //
$('#c-slider-multiple').carouFredSel({
	auto: false,
	prev: '#carousel_prev-multiple',
	next: '#carousel_next-multiple',
	direction: "left",
	responsive  : true,
	width	: "100%",
	scroll	: 2,
	duration: 1000,
	pauseOnHover: true,
	items		: {
		visible		: 3,
		width		: "100%",
		height: '66%',
		visible: {
			min: 3,
			max: 6
		}
	}
});
$('#c-slider-multiple-2').carouFredSel({
	auto: true,
	prev: '#carousel_prev-multiple-2',
	next: '#carousel_next-multiple-2',
	direction: "left",
	responsive  : true,
	width	: "100%",
	scroll	: 2,
	duration: 800,
	pauseOnHover: true,
	items		: {
		visible		: 3,
		width		: "100%",
		height: '66%',
		visible: {
			min: 3,
			max: 6
		}
	}
});
$('#c-slider-multiple-3').carouFredSel({
	auto: true,
	prev: '#carousel_prev-multiple-3',
	next: '#carousel_next-multiple-3',
	direction: "left",
	responsive  : true,
	width	: "100%",
	scroll	: {
		fx              : "scroll",
        easing          : "elastic",
	},
	duration: 1000,
	pauseOnHover: true,
	items		: {
		visible		: 3,
		width		: "100%",
		height: '66%',
		visible: {
			min: 3,
			max: 6
		}
	},
	auto: {
	    play            : true,
        timeoutDuration : null,     //  5 * auto.duration
        delay           : 500
	}
});
						
return false;							
});



//--------- Tabs SCRIPT ---------//
$(document).ready(function(){
    $("#tabs li").click(function() {
        $("#tabs li").removeClass('active');
        $(this).addClass("active");
        $(".tab_content").hide();
        var selected_tab = $(this).find("a").attr("href");
        $(selected_tab).fadeIn();
        return false;
    });
});


//--------- SuperFish Menu SCRIPT ---------//
$(document).ready(function(){ 
	$("ul.sf-menu").superfish(); 
});


//--------- END ALL ---------//			
