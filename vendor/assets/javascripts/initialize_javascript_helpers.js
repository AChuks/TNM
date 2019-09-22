$(window).on("load", function(){

    $(function() {
        $('.directUpload').find("input:file").each(function(i, elem) {
            var fileInput    = $(elem);
            var form         = $(fileInput.parents('form:first'));
            var inputFileName = form.find('input[type="file"]')[0].name;
            var buttonInput = $('.directUpload').find("button.fileButton");
            var submitButton = form.find('input[type="submit"]');
            var progressBar  = $("<div class='bar'></div>");
            var barContainer = $("<div class='progress'></div>").append(progressBar);

            barContainer.css('width', '80%')
            barContainer.css('display', 'inline-block')
            barContainer.css('visibility', 'hidden')
            buttonInput.after(barContainer);

            var barContainerWidth = document.getElementsByClassName("progress")[0].offsetWidth;
            fileInput.fileupload({

                fileInput:       fileInput,
                url:             form.data('url'),
                type:            'POST',
                autoUpload:       true,
                formData:         form.data('form-data'),
                paramName:        'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
                dataType:         'XML',  // S3 returns XML if success_action_status is set to 201
                replaceFileInput: false,

                progressall: function (e, data) {
                    barContainer.css('visibility', 'visible')

                    var progress = Math.round(((barContainerWidth-1)*((data.loaded-1)/(data.total-1))) + 1); 
                    progressBar.css('width', progress + 'px')
                },

                start: function (e) {
                    submitButton.prop('disabled', true);

                    barContainer.css('visibility', 'visible')
                    
                    progressBar.
                    css('background', 'green').
                    css('height', '20px').
                    css('display', '-webkit-box').
                    css('width', '0%').
                    css('border-radius', '4px').
                    css('overflow-x', 'hidden').
                    text("Uploading video...");
                },

                done: function(e, data) {

                    submitButton.prop('disabled', false);
                    progressBar.text("Video uploaded !!!");
                    progressBar.css('display', 'block');

                    // extract key and generate URL from response
                    var key   = $(data.jqXHR.responseXML).find("Key").text();
                    var url   = '//' + form.data('host') + '/' + key;

                    // create hidden field
                    var input = $("<input />", { type:'hidden', name: inputFileName, value: url })
                    form.append(input);
                },

                fail: function(e, data) {
                    console.log(e);
                    submitButton.prop('disabled', true);

                    progressBar.
                    css("background", "red").
                    text("Failed");
                }
            });
        });
        $('.owl-carousel').owlCarousel({
            // rtl: true,
            margin: 10,
            autoWidth:true,
            loop:true,
            navText : ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],

            autoplay: true,
            autoplayHoverPause:true,
            autoplayTimeout:1000,

            touchDrag: true,
            nav : true,
            dots: false,
        });
        $("img.lazy").lazyload();
    });

})

$(window).on("scroll", function() {
    var navBar = document.getElementsByClassName("navbar-container")[0];
    var scrollPos = document.scrollingElement.scrollTop;
    if (scrollPos > 0) {
        navBar.style.background = 'linear-gradient(rgba(0,0,0,.9) 1%,rgba(0,0,0,.8) 15%,rgba(0,0,0,.7) 30%,rgba(0,0,0,.6) 45%,rgba(0,0,0,.5) 60%,rgba(0,0,0,.3) 75%,transparent)'
    } else if (scrollPos === 0) {
        navBar.style.background = 'transparent';
    }

    var relatedVideo = document.getElementsByClassName("content-videos-header-videos-section-related")[0];
    var disqusThread = document.getElementsByClassName("disqus-thread")[0];
    if (relatedVideo && disqusThread && relatedVideo.offsetHeight !== disqusThread.scrollHeight) {
        console.log(disqusThread.scrollHeight);
        relatedVideo.style.height = disqusThread.scrollHeight + 'px';
    }
})

$(document).ready(function(){

  $("#contact-form").validate({
    debug: false,
    rules: {
        first_name: {required: true, minlength: 2},  
        last_name: {required: true, minlength: 2},  
        email: {required: true, email: true},        
        subject: {required: true, minlength: 2},  
        message: {required: true, minlength: 2},  
    },
    messages: {
        first_name: "Please enter your first name",
        last_name: "Please enter your last name",
        email: "Please enter a valid email address",
        subject: "Please enter a subject",
        message: "Please enter your message"
    }   
  });

  $("#video-submit-form").validate({
    debug: false,
    rules: {
        "video[author]": {required: true, minlength: 2},  
        "video[title]": {required: true, minlength: 2},  
        "video[description]": {required: true, minlength: 2},  
        "video[author_email]": {required: true, email: true},        
        "video[url]": {required: true, minlength: 2},  
    },
    messages: {
        "video[author]": "Please enter your name",
        "video[title]": "Please enter video title",
        "video[description]": "Please enter video description",
        "video[author_email]": "Please enter a valid email address",
        "video[url]": "Please select a file"
    }   
  });

   $("#new-user-form").validate({
    debug: false,
    rules: {
        "session[email]": {required: true, email: true},        
        "session[password]": {required: true, minlength: 2},  
    },
    messages: {
        "session[email]": "Please enter a valid email address",
        "session[password]": "Please enter your password"
    }   
  });
});