# frozen_string_literal: true
module I18n
  module Tasks
    module Angular
      module Scanners
        class TranslatePluralize < TranslateAbstract
          def pattern
            /pluralize\s*:\s*[\'\"]([^\"\']+)[\"\']/
          end
        end
      end
    end
  end
end
