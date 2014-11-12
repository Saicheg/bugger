object database

attributes :id, :description, :mariage_date

child :husband do
  attributes :id, :first_name, :last_name, :middle_name, :birthday
end

child :wife do
  attributes :id, :first_name, :last_name, :middle_name, :birthday
end

child :children do
  attributes :id, :name, :height, :birthday

  node(:_destroy) { '0' }
end
