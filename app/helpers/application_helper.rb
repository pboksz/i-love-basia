module ApplicationHelper
  def gallery_tag(image_name)
    image = image_tag("gallery/#{image_name}")

    content_tag :div, class: 'image' do
      content_tag :a, href: '#', class: 'no-link', 'data-featherlight' => "#{image}" do
        image
      end
    end
  end

  def outside_link_tag(text, url, options = {})
    link_to(text, url, target: :_blank) + map_link_tag(options[:map])
  end

  def attending_tag(attending)
    return 'No Response' if attending.nil?
    return 'Declined' if !attending
    return 'Accepted' if attending
  end

  def comments_tag(comments)
    comments = '&nbsp;'.html_safe unless comments.present?
    content_tag :span, comments.truncate(30), title: comments
  end

  private

  def map_link_tag(link)
    if link
      link_to link, class: 'map-link', target: :_blank do
        icon('fas', 'map-marker-alt')
      end
    end
  end
end
