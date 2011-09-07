module ActiveDirect
  class Config
    cattr_accessor :model_config
    cattr_accessor :controller_config
    cattr_accessor :controller_name
    class << self
      def model_config
        @@model_config ||= Hash.new { |hash, key| hash[key] = [] }
      end

      def controller_config
        @@controller_config ||= Hash.new { |hash, key| hash[key] = [] }
      end

      def controller_name
        @@controller_name ||= {}
      end

      def has_model?(action)
        model_config.keys.include?(action)
      end

      def has_controller?(action)
        controller_config.keys.include?(action)
      end

      def has_method?(action, method)
        methods_for(action).include?(method)
      end

      def other_controller_name?(action)
        controller_name[action]
      end

      def callable_controller_name(action)
        controller_name[action]
      end

      private

      def methods_for(action)
        model_config[action].map {|m| m['name']}
      end
      
    end
  end
end