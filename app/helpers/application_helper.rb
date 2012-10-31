module ApplicationHelper
  def form_errors(f)
    if f.error_notification
      content_tag :div, :class => "alert alert-error fade in" do
        link_to("&times;".html_safe, "#", {:class => "close", "data-dismiss" => "alert"}) +
        f.error_notification
      end
    end   
  end
end
