require "mandrill"

class MandrillMailer < ApplicationMailer
	default(
    from: "support@example.com",
    reply_to: "support@example.com"
  )

  def video_received(video)
    subject = "#{video.author}, we have received your video"
    merge_vars = {:AUTHOR => video.author}
    email_body = mandrill_template("video_uploads_received", merge_vars)
    mail(to: video.author_email, subject: subject, body: email_body, content_type: "text/html")
  end


  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end
  mandrill.templates.render(template_name, [], merge_vars)["html"]
  end
end
