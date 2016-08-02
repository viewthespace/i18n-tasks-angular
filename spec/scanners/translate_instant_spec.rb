# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'TranslateInstant' do
  subject { I18n::Tasks::Angular::Scanners::TranslateInstant.new }

  describe '#pattern' do
    context 'with bracket' do
      context 'double quotes' do
        let(:text) { '$translate.instant("activity_items.approval.archived")' }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
        it { expect(text.scan(subject.pattern).flatten.first).to eq('activity_items.approval.archived') }
      end

      context 'single quotes' do
        let(:text) { "$translate.instant('activity_items.approval.archived')" }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
        it { expect(text.scan(subject.pattern).flatten.first).to eq('activity_items.approval.archived') }
      end

      context 'javascript' do
        let(:text) { '$translate.instant(element.getAttribute("step-title-translation-key"))' }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
      end
    end

    context 'without bracket' do
      context 'double quotes' do
        let(:text) { '$translate.instant "activity_items.approval.archived"' }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
        it { expect(text.scan(subject.pattern).flatten.first).to eq('activity_items.approval.archived') }
      end

      context 'single quotes' do
        let(:text) { "$translate.instant 'activity_items.approval.archived'" }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
        it { expect(text.scan(subject.pattern).flatten.first).to eq('activity_items.approval.archived') }
      end

      context 'javascript' do
        context 'double quotes' do
          let(:text) { '$translate.instant element.getAttribute("step-title-translation-key")' }
          it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
        end

        context 'single quotes' do
          let(:text) { "$translate.instant element.getAttribute('step-title-translation-key')" }
          it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
        end
      end
    end
  end
end
