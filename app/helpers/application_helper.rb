module ApplicationHelper
  def gallery_tag(image_name)
    image = image_tag("gallery/#{image_name}")

    content_tag :div, class: 'image' do
      content_tag :a, href: '#', class: 'no-link', 'data-featherlight' => "#{image}" do
        image
      end
    end
  end

  def blank_link_tag(text, url)
    link_to text, url, target: :_blank
  end

  def attending_tag(attending)
    return 'No Response' if attending.nil?
    return 'Declined' if !attending
    return 'Accepted' if attending
  end

  def comments_tag(comments)
    comments = comments || '&nbsp;'.html_safe
    content_tag :span, comments.truncate(30), title: comments
  end
end
