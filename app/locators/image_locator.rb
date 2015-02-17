class ImageLocator
  def image_names
    file_paths.map { |path| path.split('/').last }
  end

  private

  def file_paths
    @file_paths ||= Dir.glob("#{Rails.root}/app/assets/images/gallery/*").sort
  end
end
