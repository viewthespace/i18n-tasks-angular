# frozen_string_literal: true
require 'i18n/tasks/scanners/file_scanner'

module I18n
  module Tasks
    module Angular
      module Scanners
        class TranslateAbstract < I18n::Tasks::Scanners::FileScanner
          include I18n::Tasks::Scanners::RelativeKeys
          include I18n::Tasks::Scanners::OccurrenceFromPosition
          include I18n::Tasks::Scanners::RubyKeyLiterals

          def scan_file(path)
            keys = []
            text = read_file(path)
            text.scan(pattern) do |match|
              src_pos = Regexp.last_match.offset(0).first
              key = strip_literal(match[0])
              location = occurrence_from_position(path, text, src_pos, raw_key: key)
              next unless valid_key?(key)
              keys << [key, location]
            end
            keys
          end

          def pattern
            raise NotImplemented
          end
        end
      end
    end
  end
end
