# require 'sib-api-v3-sdk'

class SendinBlueMailer < ApplicationMailer
	default(
    from: "SuperComedian <support@supercomedian.com>",
    reply_to: "SuperComedian <support@supercomedian.com>"
  )

  def send_video_received_email(video)
    @send_in_blue = SibApiV3Sdk::SMTPApi.new
    email = SibApiV3Sdk::SendSmtpEmail.new
    email.sender = {
      "name": "SuperComedian",
      "email": "media@supercomedian.com"
    }
    email.to = [{ "email": video.author_email }]
    email.template_id = 1
    email.params = {"AUTHOR": video.author}
    email.reply_to = {
      "email": "media@supercomedian.com",
      "name": "SuperComedian"
    }
    @send_in_blue.send_transac_email(email)
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
    email = SibApiV3Sdk::SendSmtpEmail.new
    email.to =  [{'name':'SuperComedian, Inc', 'email':'info@supercomedian.com'}]
    email.sender =  {'name': contact_form[:first_name], 'email': contact_form[:email]}
    email.template_id = 2
    email.subject = contact_form[:subject]
    email.params = {'AUTHOR': contact_form[:first_name], 'BODY': contact_form[:message]}
    @send_in_blue.send_transac_email(email)
  end
end
