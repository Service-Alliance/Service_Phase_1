class TimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    template.content_tag(:div, class: 'input-group time') do
      template.concat @builder.text_field(attribute_name, merged_input_options)
    end
  end

  def input_html_options
    super.merge({class: 'form-control timepicker', value: value})
  end

  def value
    time = @builder.object.send @attribute_name if @builder.object
    time.present? ? time.strftime("%l:%M %p") : ""
  end
end
