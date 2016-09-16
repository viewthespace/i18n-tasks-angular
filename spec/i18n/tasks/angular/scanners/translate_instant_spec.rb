# frozen_string_literal: true
require 'spec_helper'

RSpec.describe I18n::Tasks::Angular::Scanners::TranslateInstant do
  subject(:translate_instant) { described_class.new }

  describe '#pattern' do
    context 'double quotes with bracket' do
      let(:text) { '$translate.instant("activity_items.approval.archived")' }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate_instant.pattern).flatten.first).to eq('activity_items.approval.archived') }
    end

    context 'double quotes without bracket' do
      let(:text) { '$translate.instant "activity_items.approval.archived"' }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate_instant.pattern).flatten.first).to eq('activity_items.approval.archived') }
    end

    context 'single quotes with bracket' do
      let(:text) { "$translate.instant('activity_items.approval.archived')" }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate_instant.pattern).flatten.first).to eq('activity_items.approval.archived') }
    end

    context 'single quotes without bracket' do
      let(:text) { "$translate.instant 'activity_items.approval.archived'" }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate_instant.pattern).flatten.first).to eq('activity_items.approval.archived') }
    end

    context 'javascript double quotes with bracket' do
      let(:text) { '$translate.instant(element.getAttribute("step-title-translation-key"))' }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(0) }
    end

    context 'javascript double quotes without bracket' do
      let(:text) { '$translate.instant element.getAttribute("step-title-translation-key")' }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(0) }
    end

    context 'javascript single quotes with bracket' do
      let(:text) { "$translate.instant(element.getAttribute('step-title-translation-key'))" }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(0) }
    end

    context 'javascript single quotes without bracket' do
      let(:text) { "$translate.instant element.getAttribute('step-title-translation-key')" }
      it { expect(text.scan(translate_instant.pattern).flatten.size).to eq(0) }
    end
  end
end
