# frozen_string_literal: true
module I18n
  module Tasks
    module Angular
      module Scanners
        class TranslatePlural < TranslateAbstract
          def pattern
            /%translate-plural\s*\(.*prefix\s*=\s*[\'\"]([^\'\"]+)[\'\"]/
          end
        end
      end
    end
  end
end
