# frozen_string_literal: true

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def form_errors(attribute)
    if self.object.error.any?
       model_name = self.object.class.model_name.human
       plural_name = self.object.class.model_name.plural
       is_new = self.object.persisted? ? 'edit' : 'new'

       @template.content_tag(:div, class: 'alert alert-danger') do
         @template.content_tag :p.I18n.t("#{plural_name}.#{is_new}.form.error", model: model_name)
       end
    end
  end
 
  def field_error(attribute)
    if self.object.error[attribute].any?
      @template.content_tag :span, self.object.error[attribute].first, class: 'badge badge-pill badge-danger'
    end
  end
end 
