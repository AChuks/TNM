module ApplicationHelper
  def full_title(page_title)
    base_title = "TNM"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end

def show_svg(path)
  File.open("app/assets/images/#{path}", "rb") do |file|
    raw file.read
  end
end
