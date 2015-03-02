require 'rails_helper'

describe RsvpMailer do
  describe '#rsvp_email' do
    let(:guest) { build(:guest) }
    let(:guest_group) { guest.guest_group }
    subject { RsvpMailer.rsvp_email(guest_group) }

    it { expect(subject.to).to include 'basiaandphillip@gmail.com' }
    it { expect(subject.subject).to include 'A group of guests RSVP\'d!' }
  end
end
