class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    params[:tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.passengers.each do |passenger|
      passenger.flight_id = params[:booking][:flight_id]
    end

    if @booking.save
      PassengerMailer.confirmation_email(@booking).deliver_now!
      redirect_to @booking, success: 'Flight successfully booked!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
