module DatatablesHelper
  def datatable_column(field, name, display_columns, options = {sortable: true})
    options = {sortable: true, visible: display_columns.include?(field), field: field}.merge(options)
    content_tag :th, name, data: options
  end
end
