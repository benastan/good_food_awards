module GoodFoodAwards
  class Year
    attr_reader :html

    def initialize(year)
      @year = year
      @html = Nokogiri::HTML(Faraday.get('http://www.goodfoodawards.org/%s-winners/' % @year).body)
    end

    def categories
      @categories ||= extract_categories
    end

    def to_hash
      categories.map(&:to_hash)
    end

    protected

    def extract_categories
      @html.xpath('//h2').map { |node| Category.new(node) }
    end
  end
end
