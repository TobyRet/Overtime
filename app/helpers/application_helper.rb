module ApplicationHelper
  def active?(path)
    'active' if current_page? path
  end

  def admin_types
    ['AdminUser']
  end

  def status_label(status)
    case status
    when 'submitted'
      content_tag(:span, status.titlecase, class: 'label label-primary')
    when 'approved'
      content_tag(:span, status.titlecase, class: 'label label-success')
    when 'rejected'
      content_tag(:span, status.titlecase, class: 'label label-danger')
    when 'pending'
      content_tag(:span, status.titlecase, class: 'label label-primary')
    when 'confirmed'
      content_tag(:span, status.titlecase, class: 'label label-success')
    end
  end
end
