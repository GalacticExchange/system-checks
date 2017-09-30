class Checkset < ActiveRecord::Base
  has_many :check_in_sets
  accepts_nested_attributes_for :check_in_sets, reject_if: :all_blank, allow_destroy: true

  #
  searchable_by_simple_filter


end
