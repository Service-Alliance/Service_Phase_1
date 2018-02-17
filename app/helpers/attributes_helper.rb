module AttributesHelper
  def display_attribute(name, value)
    render partial: 'partials/attribute', locals: {name: name, value: value}
  end

  def display_money_attribute(name, value)
    display_attribute(name, display_money(value))
  end

  def display_money(val)
    "$#{sprintf('%.2f', val)}"
  end
end
