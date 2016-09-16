# frozen_string_literal: true
require 'spec_helper'

RSpec.describe I18n::Tasks::Angular::Scanners::TranslatePluralize do
  subject(:translate_pluralize) { described_class.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '%div {{ editable.web_session_count | pluralize: "account_settings.web_session" }}' }
      it { expect(text.scan(translate_pluralize.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate_pluralize.pattern).flatten.first).to eq('account_settings.web_session') }
    end

    context 'single quotes' do
      let(:text) { "%div {{ editable.web_session_count | pluralize: 'account_settings.web_session' }}" }
      it { expect(text.scan(translate_pluralize.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate_pluralize.pattern).flatten.first).to eq('account_settings.web_session') }
    end
  end
end
