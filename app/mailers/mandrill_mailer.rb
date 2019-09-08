require "mandrill"

class MandrillMailer < ApplicationMailer
	default(
    from: "SuperComedian <support@supercomedian.com>",
    reply_to: "SuperComedian <support@supercomedian.com>"
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

   def send_contact_message(contact_form)
    subject = "Contact Form Message"
    merge_vars = {:AUTHOR => contact_form[:first_name]}
    email_body = mandrill_template("video_uploads_received", merge_vars)
    mail(from: contact_form[:email], to: 'support@supercomedian.com', subject: subject, body: contact_form[:message], content_type: "text/html")
  end


  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV["SMTP_PASSWORD"])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
    end
    mandrill.templates.render(template_name, [], merge_vars)["html"]
  end
end
