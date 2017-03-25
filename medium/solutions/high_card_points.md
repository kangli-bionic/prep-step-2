# High Card Points

```ruby
def high_card_points(hand)
  points = 0

  i = 0
  while i < hand.length
   if hand[i] == "A"
     points = points + 4
   elsif hand[i] == "K"
     points = points + 3
   elsif hand[i] == "Q"
     points = points + 2
   elsif hand[i] == "J"
     points = points + 1
   end

   i = i + 1
  end

  points
end
```
