module ApplicationHelper
    def active_item(url)
      url_segments = request.fullpath.split(/\/|\?/)
      url_segments[1] === url ? 'active' : ''
    end
end
