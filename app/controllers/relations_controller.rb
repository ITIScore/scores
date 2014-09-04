class RelationsController < ApplicationController

  expose(:relation)
  expose(:relations)
  expose(:event)
  expose(:events)
  expose(:student)
  expose(:students) { group.students }

  def create
    relation = relations.new(relation_params)
    relation.save
    redirect_to event_path(event), notice: 'Student was successfull added!'
  end

  def destroy
    relation.destroy
    redirect_to event_path(event), notice: 'Student was successfull deleted!'
  end

  def update
    relation.update(relation_params)
    relation.save
    redirect_to event_path(event), notice: 'Student was successfull updated!'
  end

  private

  def relation_params
    params.require(:relation).permit(
      :student_id,
      :event_id,
      :score
    ).merge(group_id: current_user.group_id)
  end
end
