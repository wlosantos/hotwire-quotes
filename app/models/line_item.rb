class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true, length: { maximum: 60 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 999 }
  validates :unit_price, presence: true, numericality: { greater_than: 0.0, less_than: 100_000.0 }

  validate :word_is_long, :descript_is_long

  delegate :quote, to: :line_item_date

  def total_price
    quantity * unit_price
  end

  private

  def word_is_long
    return unless name.present? && name.length > 10 && !name.include?(' ')

    errors.add(:name, 'word invalid')
  end
end
