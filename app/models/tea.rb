class Tea < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { less_than: 10_000_000 }
  validates :quantity, presence: true, numericality: { integer_only: true, greater_than_or_equal_to: 0 }

  # just to make random generation easier, not for real life applications of course
  FAKE_IMAGES = %w{
    http://listz.in/wp-content/uploads/2015/01/lipton.jpg
    http://listz.in/wp-content/uploads/2015/01/red-label.jpg
    http://ugc-01.cafemomstatic.com/gen/constrain/500/500/80/2012/02/26/09/1i/6q/po2a7o3zlww7ja.jpg
    http://grablists.com/wp-content/uploads/2015/05/Lipton.jpg
    http://stylesatlife.com/wp-content/uploads/2014/12/Yogi-Green-Tea.jpg
  }

  def image
    FAKE_IMAGES[id%FAKE_IMAGES.size]
  end
end