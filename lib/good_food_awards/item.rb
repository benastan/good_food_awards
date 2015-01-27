module GoodFoodAwards
  class Item
    attr_reader :business_name, :href, :product_name, :location

    def initialize(link_node, other_node)
      @business_name = link_node.text.gsub(/\s?\,?$/, '').chomp
      @href = link_node.attributes['href'].value if link_node.attributes.key?('href')
      product_name, location = other_node.text.gsub(/^\,?\s?/, '').chomp.split(',')
      @product_name = product_name.gsub('^\s+' ,'')
      @location = location.gsub("\u00A0", ' ').gsub(/^\s/ ,'') if location
    rescue => e
      binding.pry
      raise e
    end

    def to_hash
      {
        business_name: business_name,
        href: href,
        product_name: product_name,
        location: location,
        search_location: [ business_name, location ].compact.join(', ')
      }
    end
  end
end
