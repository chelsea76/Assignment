module EmployeesHelper
  
  # return select fields of Model's attributes for Select Tag(In Future if attributes added, i will be dynamic)
  def select_attributes
    select_list = Employee.attribute_names.reject { |attr| ["id", "created_at", "updated_at", "soft_deleted"].include?(attr)}
    select_list.inject([]) {| result, attr| result.append([attr, attr])}
  end
end
