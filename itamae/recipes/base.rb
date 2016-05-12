%w(yum_update mysql ruby_build nginx redis).each do |resource|
  include_recipe "./#{resource}.rb"
end
