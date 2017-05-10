namespace :tsar do

  desc 'set the display order for shifts'
  task :set_order => :environment do
    order_hash = {
      1 => 12,
      2 => 1,
      3 => 2,
      4 => 9,
      5 => 4,
      6 => 6,
      7 => 8,
      8 => 3,
      9 => 5,
      10 => 7,
      11 => 10,
      12 => 11
    }
    Shift.all.each do |shift|
      shift.update(order: order_hash[shift.id])
    end
  end
  
end
