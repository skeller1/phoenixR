module ActiveDirect
  class AllowedControllers
    def self.matches?(request)
      p request
      false
    end
  end
end