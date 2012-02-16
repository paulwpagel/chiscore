# Given /^there are no checkpoints$/ do
#   Checkpoint.destroy_all
# end
# 
# Given /^I have a checkpoint named "([^\"]*)"$/ do |name|
#   Checkpoint.create!(:location => name)
# end
# 
# 
# 
# 
# Then /^I have the following checkpoint:$/ do |table|
#   attrs = table.rows_hash
#   checkpoint = Checkpoint.last
# 
#   checkpoint.location.should            == attrs["Location"]            if attrs["Location"].present?
#   checkpoint.point_person.should        == attrs["Point person"]        if attrs["Point person"].present?
# end
# 
