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
            text = read_file(path)
            keys = []
            patterns.each do |pattern|
              pattern_keys = scan(path, text, pattern)
              next if pattern_keys.empty?
              keys.concat(pattern_keys)
            end
            keys.compact
          end

          private

          def scan(path, text, pattern)
            keys = []
            text.scan(pattern) do |match|
              src_pos = Regexp.last_match.offset(0).first
              match.each { |m| keys << scan_match(m, path, text, src_pos) }
            end
            keys
          end

          def scan_match(match, path, text, src_pos)
            key = strip_literal(match)
            location = occurrence_from_position(path, text, src_pos, raw_key: key)
            return unless valid_key?(key)
            [key, location]
          end

          def patterns
            return [pattern] unless pattern.instance_of?(Array)
            pattern
          end

          def pattern
            raise NotImplemented
          end
        end
      end
    end
  end
end
