require "mandrill"

class MandrillMailer < ApplicationMailer
	default(
    from: "TopNoiseMakers <support@topnoisemakers.com>",
    reply_to: "TopNoiseMakers <support@topnoisemakers.com>"
  )

  def send_video_received_email(video)
    video.author = video.author.gsub(/\s.+/, '')
    subject = "#{video.author}, we've received your video"
    merge_vars = {:AUTHOR => video.author}
    email_body = mandrill_template("video_uploads_received", merge_vars)
    mail(to: video.author_email, subject: subject, body: email_body, content_type: "text/html")
  end

  def send_video_accepted_email(video)
    video.author = video.author.gsub(/\s.+/, '')
    subject = "#{video.author}, we've reviewed and accepted your video."
    merge_vars = {:AUTHOR => video.author}
    email_body = mandrill_template("video_uploads_accepted", merge_vars)
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
