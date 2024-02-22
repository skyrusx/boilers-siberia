module AdminHelper
  def nav_link_classes(link_path)
    current_page?(link_path) ? "nav-link active" : "nav-link"
  end

  def build_alert_classes(alert_type)
    classes = 'alert alert-dismissable '
    case alert_type.to_sym
    when :alert, :danger, :error, :validation_errors
      classes += 'alert-danger'
    when :warning, :todo
      classes += 'alert-warning'
    when :notice, :success
      classes += 'alert-success'
    else
      classes += 'alert-info'
    end
  end

  def current_order
    Order.find_by_id(session[:order_id]).nil? ? Order.new : Order.find_by_id(session[:order_id])
  end

  def find_settings
    Setting.all.first
  end
end
