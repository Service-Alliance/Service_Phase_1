class ApplicationDatatable
  attr_reader :sort_fields, :sort_field, :model
  attr_accessor :count, :params

  delegate :count, to: :model

  def query(params)
    self.params = params
    model.order(build_sort)
    filter_model
    count = model.count
    page_model
  end

  def included_associations
    []
  end

  def build_sort
    return '' unless params[:sort] && params[:order]
    sort_field = sort_fields[params[:sort].to_sym]
    Array.wrap(sort_field).map{|field| "#{field} #{params[:order]} #{params[:order] == 'asc' ? 'NULLS FIRST' : 'NULLS LAST'}"}.join(', ')
  end

  def filter_model
    @model
  end

  def page_model
    @model = @model.limit(params[:limit]).offset(params[:offset])
  end
end
