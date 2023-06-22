class BaseDecorator < Nameable # rubocop:todo Layout/EndOfLine
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
