class ReceiptPrinter
  COST = {
    'meat' => 5,
    'milk' => 3,
    'candy' => 1,
  }

  TAX = 0.05

  def initialize(output: $stdout, items:)
    @output = output
    @items = items
    @subtotal = calculate_subtotal
  end

  def print
    receipt_output
  end

  private
    attr_reader :output, :items, :subtotal

    def receipt_output
      output.puts divider
      output.puts "subtotal: #{sprintf('$%.2f', subtotal)}"
      output.puts "tax: #{sprintf('$%.2f', calculate_tax)}"
      output.puts divider
      output.puts "total: #{sprintf('$%.2f', subtotal + calculate_tax)}"
    end

    def calculate_subtotal
      items.reduce(0) do |sum, item|
        print_item(item)
        add_to_sum(sum, item)
      end
    end

    def divider
      '-' * 13
    end

    def calculate_tax
      subtotal * TAX
    end

    def item_cost(item)
      COST[item]
    end

    def print_item(item)
      output.puts "#{item}: #{sprintf('$%.2f', item_cost(item))}"
    end

    def add_to_sum(sum, item)
      sum + item_cost(item).to_i
    end
end