class GuestsRepository < DefaultRepository
  def after_initialize
    @klass = Guest
  end

  def find_by_name(name)
    klass.where("#{replace_letter('name')} LIKE #{replace_letter('?')}", "%#{name}%")
  end

  def responses
    all.map(&:attending)
  end

  private

  def replace_letter(with)
    "REPLACE(REPLACE(#{with}, 'ł', 'l'), 'Ł', 'L')"
  end
end
