class UsersDatatable < ApplicationDatatable
  def source
    User
  end

  def initial_relation
    User.all
  end

  def included_associations
    [:department]
  end

  def filter_model
  end

  def sort_fields
    {
      first_name: 'first_name',
      last_name: 'last_name',
      department_name: 'departments.name'
    }
  end
end
