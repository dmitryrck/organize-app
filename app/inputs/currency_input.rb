class CurrencyInput < SimpleForm::Inputs::Base
  def input
    [
      '<span class="add-on">R$ </span>',
      @builder.text_field(attribute_name, input_html_options)
    ].join.html_safe
  end
end
