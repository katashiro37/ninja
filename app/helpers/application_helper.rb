module ApplicationHelper
    def active_item(url)
      url_segments = request.fullpath.split(/\/|\?/)
      url_segments[1] === url ? 'active' : ''
    end

    def has_errors?(resource, field) #dynamic error validator
      #@contact.errors.messages[field].present?
      resource.errors.messages[field].present?
    end

    def get_error(resource, field) #dynamic error validator
      resource.errors.messages[field].join(', ')
    end

end
