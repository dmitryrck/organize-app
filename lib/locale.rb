module OrganizeApp
  module Locale
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def human_attribute_name attribute, options = {}
        I18n.translate "simple_form.labels.#{self.to_s.underscore}.#{attribute}", :default => (options[:default] || attribute.to_s.capitalize)
      end
      alias_method :t, :human_attribute_name

      def human_name
        I18n.translate "simple_form.models.#{self.to_s.underscore}.one", :default => self.to_s
      end
    end
  end
end
