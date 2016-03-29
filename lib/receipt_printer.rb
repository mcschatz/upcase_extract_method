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
  end

  def print
    receipt_output(calculate_subtotal)
  end

  private

    def receipt_output(subtotal)
      output.puts divider
      output.puts "subtotal: #{sprintf('$%.2f', subtotal)}"
      output.puts "tax: #{sprintf('$%.2f', subtotal * TAX)}"
      output.puts divider
      output.puts "total: #{sprintf('$%.2f', subtotal + (subtotal * TAX))}"
    end

    def calculate_subtotal
      items.reduce(0) do |sum, item|
        item_cost = COST[item]
        output.puts "#{item}: #{sprintf('$%.2f', item_cost)}"
        sum + item_cost.to_i
      end
    end

    def divider
      '-' * 13
    end

  attr_reader :output, :items

end