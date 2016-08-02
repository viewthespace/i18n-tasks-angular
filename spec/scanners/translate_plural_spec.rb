# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'TranslatePlural' do
  subject { I18n::Tasks::Angular::Scanners::TranslatePlural.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '%translate-plural(prefix="account_settings.web_session_count" count="editable.web_session_count")' }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('account_settings.web_session_count') }
    end

    context 'single quotes' do
      let(:text) { "%translate-plural(prefix='account_settings.web_session_count' count='editable.web_session_count')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('account_settings.web_session_count') }
    end
  end
end
