# frozen_string_literal: true
module I18n
  module Tasks
    module Angular
      module Scanners
        class TranslationKey < TranslateAbstract
          def pattern
            [
              /translation-key(?:-[a-z]+)?=[\"\']([^\"\'\{\}]+)[\"\']/,
              # ternary operator
              /translation-key=[\'\"][^?]*\?\s[\'\"]([^\"\'\{\}]+)[\'\"]\s:\s[\'\"]([^\"\'\{\}]+)[\'\"] \S*[\'\"]/
            ]
          end
        end
      end
    end
  end
end
