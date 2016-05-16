%w(yum_update ruby_build nginx redis mkdir).each do |resource|
  include_recipe "./#{resource}.rb"
end
