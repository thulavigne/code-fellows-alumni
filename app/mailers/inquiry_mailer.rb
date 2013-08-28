class InquiryMailer < ActionMailer::Base

  def inquiry(inquiry, user)
    mail(to: user.email, subject: ('Inquiry from CodeFellows Alumni Site from ' + inquiry.name),
          reply_to: inquiry.email, body: inquiry.message, from: inquiry.email)
  end

end
