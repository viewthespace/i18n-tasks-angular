# frozen_string_literal: true
module ScannerHelpers
  def file_path
    file = Tempfile.new
    file.write(text)
    file.rewind
    file.path
  end

  def scan_keys
    subject.scan_file(file_path).flat_map { |k, _| k }
  end
end
