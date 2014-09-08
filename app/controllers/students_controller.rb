class StudentsController < AuthorizedController

  expose(:student)
  expose(:students)
  expose(:relation)
  expose(:relations) { student.relations }
  expose(:event)
  expose(:events) { user.events }
  expose(:user) { users.owner? }
  expose(:users)

  def create
    student = students.new(students_params)
    student.save
    redirect_to students_path, notice: 'Student was successfull created!'
  end

  def destroy
    student.destroy
    redirect_to students_path, notice: 'Student was successfull deleted!'
  end

  def update
    student.update(students_params)
    student.save
    redirect_to student_path, notice: 'Student was successfull updated!'
  end

  private

  def students_params
    params.require(:student).permit(
      :lastname,
      :firstname,
      :patronymic
    ).merge(group_id: current_user.group_id)
  end
end
