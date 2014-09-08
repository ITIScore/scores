class EventsController < ApplicationController

  expose(:event)
  expose(:events)
  expose(:relation)
  expose(:relations) { group.relations }
  expose(:students) { group.students }
  expose(:student)

  before_action :check_events_creator?, only: %i(updated destroy new)

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

  def check_events_creator?
    current_user.create_events.empty?
  end

  def event_params
    params.require(:event).permit(
      :name,
      :date
    ).merge(user_id: current_user.id)
  end

end
