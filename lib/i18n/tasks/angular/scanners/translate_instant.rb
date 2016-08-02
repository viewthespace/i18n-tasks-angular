# frozen_string_literal: true
module I18n
  module Tasks
    module Angular
      module Scanners
        class TranslateInstant < TranslateAbstract
          def pattern
            /\$translate\.instant\s*\(?\s*[\"\']([^\"\'\{\}\#]+)[\"\']/
          end
        end
      end
    end
  end
end
