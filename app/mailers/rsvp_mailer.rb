class RsvpMailer < ActionMailer::Base
  add_template_helper ApplicationHelper

  def rsvp_email(guest_group)
    @guest_group = guest_group

    mail to: 'basiaandphillip@gmail.com',
         subject: 'A group of guests RSVP\'d!'
  end
end
