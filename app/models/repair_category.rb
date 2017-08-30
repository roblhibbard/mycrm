class RepairCategory < ApplicationRecord
 has_many :repairs
 scope :diagnostic_only, -> { where('repair_category_id = 1 ')}
 scope :load_with_data, -> { where('repair_category_id = 2 ')}
 scope :load_no_data, -> { where('repair_category_id = 3 ')}
 scope :malware_results, -> { where('repair_category_id = 4 ')}
 
end
