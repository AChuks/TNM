document.addEventListener("turbolinks:load", function(){

    $(function() {
        $('.directUpload').find("input:file").each(function(i, elem) {
            var fileInput    = $(elem);
            var form         = $(fileInput.parents('form:first'));
            var inputFileName = form.find('input[type="file"]')[0].name;
            var buttonInput = $('.directUpload').find("button.fileButton");
            var submitButton = form.find('input[type="submit"]');
            var progressBar  = $("<div class='bar'></div>");
            var barContainer = $("<br/><div class='progress'></div>").append(progressBar);

            barContainer.css('width', '50%')
            barContainer.css('display', 'inline-block')
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

                    var progress = Math.round(((barContainerWidth-1)*((data.loaded-1)/(data.total-1))) + 1); 
                    progressBar.css('width', progress + 'px')
                },

                start: function (e) {
                    submitButton.prop('disabled', true);
                    
                    progressBar.
                    css('background', 'green').
                    css('display', 'block').
                    css('width', '0%').
                    text("Uploading video...");
                },

                done: function(e, data) {

                    submitButton.prop('disabled', false);
                    progressBar.text("Video uploaded !!!");

                    // extract key and generate URL from response
                    var key   = $(data.jqXHR.responseXML).find("Key").text();
                    var url   = '//' + form.data('host') + '/' + key;

                    // create hidden field
                    var input = $("<input />", { type:'hidden', name: inputFileName, value: url })
                    form.append(input);
                },

                fail: function(e, data) {

                    submitButton.prop('disabled', false);

                    progressBar.
                    css("background", "red").
                    text("Failed");
                }
            });
        });
    });

})