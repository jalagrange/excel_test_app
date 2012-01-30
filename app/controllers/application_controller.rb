class ApplicationController < ActionController::Base
  protect_from_forgery


    session_key_name = Rails.application.config.session_options[:key]
    %Q{

    <script type='text/javascript'>
      $(document).ready(function() {
        $('#photo_upload').uploadify({
          script          : 'url',
          fileDataName    : 'photo[image]',
          uploader        : '/uploadify/uploadify.swf',
          cancelImg       : '/uploadify/cancel.png',
          fileDesc        : 'Images',
          fileExt         : '*.png;*.jpg;*.gif',
          sizeLimit       : #{10.megabytes},
          queueSizeLimit  : 24,
          multi           : true,
          auto            : true,
          buttonText      : 'ADD IMAGES',
          scriptData      : {
            '_http_accept': 'application/javascript',
          
          },
          onComplete      : function(a, b, c, response){ eval(response) }
        });
      });
    </script>

    }.gsub(/[\n ]+/, ' ').strip.html_safe
  end
  
  


