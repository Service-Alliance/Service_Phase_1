class AddCompanyIdToCallers < ActiveRecord::Migration
  def change
    add_reference :callers, :company, index: true, foreign_key: true
  end
end
