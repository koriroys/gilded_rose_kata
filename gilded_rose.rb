SULFURAS = 'Sulfuras, Hand of Ragnaros'
TICKETS = 'Backstage passes to a TAFKAL80ETC concert'
CHEESE = 'Aged Brie'
MAX_QUALITY = 50

def update_quality(items)

  items.each do |item|
    next if item.name == SULFURAS
    item.sell_in -= 1

    case item.name
    when CHEESE
      item.quality += 1
      if expired?(item)
        item.quality += 1
      end
    when TICKETS
      backstage_pass
      if expired?(item)
        item.quality = 0
      end
    else
      if expired?(item)
        item.quality -= 2
      else
        item.quality -= 1
      end
    end

    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.quality < 0
  end
end

def expired?(item)
  item.sell_in < 0
end

def backstage_pass
  item.quality += 3 and return if item.sell_in < 5
  item.quality += 2 and return if item.sell_in < 10
  item.quality += 1
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

