class EmployeesController < ApplicationController
  
  # List of all Employees
  def index
    @employees = Employee.where(soft_deleted: false)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(params[:employee])

    if @employee.save
      redirect_to employees_path, notice: 'Employee was successfully created.'
    else
      render action: "new"
    end
  end

  # Soft Delete, will update soft_deleted attribute to TRUE
  def delete
    employee = Employee.find(params[:id])
    employee.update_attributes(soft_deleted: true)
    redirect_to employees_path, notice: 'Employee was successfully deleted.'
  end
  
  # return Hash with key as grouped attribute & Value as Arrays of grouping result
  def group
    if request.xhr?
      @group_employees = Employee.where(soft_deleted: false).to_set.classify { |emp| emp.send(params[:attribute]) }#Employee.where(soft_deleted: false).group_by {|x| x.send(params[:attribute])}(Another Way)
    end
  end
  
  # search defined as scope in Employee class
  def search
    if request.xhr?
      @employees = Employee.search(params[:keyword]).where(soft_deleted: false)
    end
  end
  
  def sort
    if request.xhr?
      @employees = Employee.where(soft_deleted: false).order(params[:attribute] + " " + params[:order])
    end
  end
end
