class Report < ApplicationRecord
  #== SCOPES ===============================================

  #== ASSOCIATIONS =========================================

  #== ACCEPTED ATTRIBUTES ==================================

  #== VALIDATIONS ==========================================
  validates :purchaser_name, :item_description, :item_price, :purchase_count,
    :merchant_address, :merchant_name, presence: true
  #== CALLBACKS ============================================

  #== INSTANCE METHODS =====================================

  #== CLASS METHODS ========================================
  def self.import(file)
    CSV.foreach(file.path, {:headers => true, :col_sep => "\t"}) do |row|
      Report.create!(purchaser_name:row[0], item_description: row[1], item_price: row[2],
        purchase_count: row[3], merchant_address: row[4], merchant_name: row[5])
    end
  end

end
