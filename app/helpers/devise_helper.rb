module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map {|message| content_tag(:li, message)}.join
    html = <<-HTML
      <div class="alert alert-error alert-danger">
        <button type="button" class="close" data-dismiss="alert">x</button>
        #{messages}
      </div>
    HTML

    html.html_safe
  end
end
