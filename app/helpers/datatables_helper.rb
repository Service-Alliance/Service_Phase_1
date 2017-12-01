module DatatablesHelper
  def datatable_column(field, name, display_columns, options = {sortable: true})
    options[:visible] = display_columns.include?(field)
    options[:field] = field
    content_tag :th, name, data: options
  end
end
