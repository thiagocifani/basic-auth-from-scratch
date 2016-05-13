module ApplicationHelper
  def form_defaults
    { wrapper_html: { class: "form-group" },
      input_html: { class: "form-control" } }
  end

  def asset(name)
    name if Rails.application.assets.find_asset(name)
  end

  def stylesheet_optional(name, options = {})
    stylesheet_link_tag(name, options) if asset(name)
  end

  def device_stylesheet
    file = "phone"  if browser.device.iphone?
    file = "tablet" if browser.device.tablet?
    file || "pc"
  end
end
