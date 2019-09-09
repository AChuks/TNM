require 'sib-api-v3-sdk'

class SendinBlueMailer < ApplicationMailer
	default(
    from: "SuperComedian <support@supercomedian.com>",
    reply_to: "SuperComedian <support@supercomedian.com>"
  )

  def send_video_received_email(video)
    @send_in_blue = SibApiV3Sdk::SMTPApi.new
    @email = SibApiV3Sdk::SendSmtpEmail.new
    @email.sender = {
      "name": "SuperComedian, Inc",
      "email": "support@supercomedian.com"
    }
    @email.to = [{ "email": video.author_email }]
    @email.params = {"AUTHOR": video.author}
    @email.reply_to = {
      "email": "talents@supercomedian.com",
      "name": "SuperComedian, Inc"
    }

    @send_in_blue.send_template(1, @email)
  end

  def send_video_accepted_email(video)
    @send_in_blue = SibApiV3Sdk::SMTPApi.new
    @email = SibApiV3Sdk::SendSmtpEmail.new
    @email.sender = {
      "name": "SuperComedian, Inc",
      "email": "talents@supercomedian.com"
    }
    @email.to = [{ "email": video.author_email }]

    @email.params = {"AUTHOR": video.author}
    @email.reply_to = {
      "email": "talents@supercomedian.com",
      "name": "SuperComedian, Inc"
    }
    @send_in_blue.send_template(1, @email)
  end

  def send_contact_message(contact_form)
    @send_in_blue = SibApiV3Sdk::SMTPApi.new
    @email = SibApiV3Sdk::SendSmtpEmail.new
    @email.sender = {
      'name': contact_form[:first_name],
      'email': contact_form[:email]
    }
    @email.to = [{ 'email': 'support@supercomedian.com' }]
    @email.params = {'AUTHOR': contact_form[:first_name]}
    @email.subject = 'Contact Form Message'
    @email.reply_to = {
      'email': contact_form[:first_name],
      'name': contact_form[:email]
    }
    @send_in_blue.send_template(1, @email)
  end
end
