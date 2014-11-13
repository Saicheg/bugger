object @database

attributes :description, :mariage_date

child :husband => :husband_attributes do
  attributes :first_name, :last_name, :middle_name, :birthday
end

child :wife => :wife_attributes do
  attributes :first_name, :last_name, :middle_name, :birthday
end

child :children => :children_attributes do
  attributes :name, :height, :birthday

  node(:_destroy) { '0' }
end
