require "has_many_through_mongodb/version"
require "has_many_through_mongodb/model"

module HasManyThroughMongodb

end

ActiveModel::Callbacks.include(HasManyThroughMongodb::Model)

ActiveSupport.on_load(:active_record) do
  extend HasManyThroughMongodb::Model
end
