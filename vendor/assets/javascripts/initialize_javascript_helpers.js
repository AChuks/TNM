$(window).on("load", function() {
  $(function() {
    $(".directUpload")
      .find("input:file")
      .each(function(i, elem) {
        var fileInput = $(elem);
        var form = $(fileInput.parents("form:first"));
        var inputFileName = form.find('input[type="file"]')[0].name;
        var buttonInput = $(".directUpload").find("button.fileButton");
        var submitButton = form.find('button[type="submit"]');
        var progressBar = $("<div class='bar'></div>");
        var barContainer = $("<div class='progress'></div>").append(
          progressBar
        );

        barContainer.css("width", "100%");
        barContainer.css("display", "block");
        barContainer.css("visibility", "hidden");
        barContainer.css("margin-bottom", "0px");
        buttonInput.after(barContainer);

        var barContainerWidth = document.getElementsByClassName("progress")[0]
          .offsetWidth;
        fileInput.fileupload({
          fileInput: fileInput,
          url: form.data("url"),
          type: "POST",
          autoUpload: true,
          formData: form.data("form-data"),
          paramName: "file", // S3 does not like nested name fields i.e. name="user[avatar_url]"
          dataType: "XML", // S3 returns XML if success_action_status is set to 201
          replaceFileInput: false,

          progressall: function(e, data) {
            barContainer.css("visibility", "visible");

            var progress = Math.round(
              (barContainerWidth - 1) * ((data.loaded - 1) / (data.total - 1)) +
                1
            );
            progressBar.css("width", progress + "px");
          },

          start: function(e) {
            submitButton.prop("disabled", true);

            barContainer.css("visibility", "visible");

            progressBar
              .css("background", "green")
              .css("height", "20px")
              .css("display", "-webkit-box")
              .css("width", "0%")
              .css("border-radius", "4px")
              .css("overflow-x", "hidden")
              .text("Uploading video...");
          },

          done: function(e, data) {
            submitButton.prop("disabled", false);
            progressBar.text("Video uploaded !!!");
            progressBar.css("display", "block");

            // extract key and generate URL from response
            var key = $(data.jqXHR.responseXML)
              .find("Key")
              .text();
            var url = "//" + form.data("host") + "/" + key;

            // create hidden field
            var input = $("<input />", {
              type: "hidden",
              name: inputFileName,
              value: url
            });
            form.append(input);
          },

          fail: function(e, data) {
            console.log(e);
            submitButton.prop("disabled", true);

            progressBar.css("background", "red").text("Failed");
          }
        });
      });
    $(".owl-carousel").owlCarousel({
      // rtl: true,
      margin: 10,
      autoWidth: true,
      loop: true,
      navText: [
        "<i class='fa fa-chevron-left'></i>",
        "<i class='fa fa-chevron-right'></i>"
      ],

      autoplay: true,
      autoplayHoverPause: true,
      autoplayTimeout: 4000,

      touchDrag: true,
      nav: true,
      dots: false
    });
  });
});
