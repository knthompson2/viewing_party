class Review
  attr_reader :author,
              :review

  def initialize(info)
    @author = info[:author]
    @review = info[:content]
  end
end
