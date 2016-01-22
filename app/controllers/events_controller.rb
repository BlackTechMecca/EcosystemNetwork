class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.create(event_params)
        if @event.save
          format.html { redirect_to event_path, notice: 'Event was successfully created.' }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
	end

	private
	def event_params
		params.require(:event).permit(:name,:description,:user,:date)
	end


end
