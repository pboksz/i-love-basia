module ApplicationHelper
  def gallery_tag(image_name)
    image = image_tag("gallery/#{image_name}")

    content_tag :div, class: 'image' do
      content_tag :a, href: '#', class: 'no-link', 'data-featherlight' => "#{image}" do
        image
      end
    end
  end
end
