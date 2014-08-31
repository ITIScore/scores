class EventsController < ApplicationController

  expose(:event)
  expose(:events)

  def create
    event = events.new(event_params)
    event.save
    redirect_to events_path, notice: 'Event was successfull created!'
  end

  def destroy
    event.destroy
    redirect_to events_path, notice: 'Event was successfull deleted!'
  end

  def update
    event.update(event_params)
    event.save
    redirect_to events_path, notice: 'Event was successfull updated!'
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :date
    )
  end

end
