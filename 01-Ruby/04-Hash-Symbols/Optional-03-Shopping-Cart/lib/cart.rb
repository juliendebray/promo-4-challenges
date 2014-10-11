# This file contains methods related to your shopping cart.
# You should complete it according to the instructions in the TODO comments

def add_to_cart(cart, product)
  # TODO: you get a cart and a product. Add the product to the cart!
  #cart = []
  cart << product
end

# cart = ["a"]
# p cart
# p add_to_cart(cart,"banane")
# p cart

def cart_to_s(cart)
  # TODO: you get a cart, return a coma-separated String list of the contained products
  hash_count = {}
  cart.each {|prod| hash_count[prod] = cart.count(prod) }
  phr = ""
  hash_count.each do |prod, val|
    if val == 1
      phr += "#{prod}, "
    else
      phr += "#{prod} x #{val}, "
    end
  end
  return phr[0..-3]
  #cart.join(", ")
end

# cart = ["a","b","c","a", "d", "a", "c", "d"]
# p cart
# p cart_to_s(cart)

# p cart_to_s(cart)


def cart_total_price(cart, store_items)
  # TODO: you get a cart and the store items with their prices. Return the total
  # price of the shopping cart
  sum = 0
  cart.each do |value|
    sum = sum + store_items[value.to_sym] if store_items[value.to_sym] != nil
  end
  sum
end
