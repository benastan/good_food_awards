module GoodFoodAwards
  class Category
    def initialize(node)
      @node = node
      @name = node.text
    end

    def items
      @items ||= extract_items
    end

    def to_hash
      {
        name: @name,
        items: items.map(&:to_hash)
      }
    end

    protected

    def extract_items
      item_nodes = @node.next.next.children.reject { |node| node.name == 'br' || node.text == "\n" }.each_slice(2)
      item_nodes.map { |(link_node, location_node)| Item.new(link_node, location_node) }
    end
  end
end