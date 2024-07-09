class PassengerMailer < ApplicationMailer
  def confirmation_email(booking)
    @booking = booking
    @flight = @booking.flight
    mail(
      to: @booking.passengers.pluck(:email),
      subject: 'Your booking has been confirmed'
    )
  end
end
