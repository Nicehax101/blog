class Book < ApplicationRecord
    belongs_to :author

    before_save :set_publish_date

    private
    
    def set_publish_date
        self.publish_date = (10..20).to_a.sample.weeks.ago.to_date if publish_date.nil?
    end
end
