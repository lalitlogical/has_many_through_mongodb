# frozen_string_literal: true

module HasManyThroughMongodb
  module Model
    def define_through **associations
      p associations
      associations.each do |model, through_model|
        model_name = model.to_s.underscore
        class_eval <<-METHODS, __FILE__, __LINE__ + 1
          def #{model_name}_ids
            @#{model_name}_ids ||= #{through_model.to_s.underscore.pluralize}.distinct(:#{model_name}_id).compact
          end

          def has_#{model_name}_ids?
            #{model_name}_ids.present?
          end

          def has_#{model_name.pluralize}?
            has_#{model_name}_ids? ? #{model}.in(id: #{model_name}_ids).count != 0 : false
          end

          def #{model_name.pluralize}
            has_#{model_name}_ids? ? #{model}.in(id: #{model_name}_ids) : []
          end
        METHODS
      end
    end
  end
end
