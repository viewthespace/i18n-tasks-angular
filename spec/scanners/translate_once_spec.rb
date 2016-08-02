# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'TranslateOnce' do
  subject { I18n::Tasks::Angular::Scanners::TranslateOnce.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '.all-caps-label(translate-once="activerecord.attributes.proposal_term.deal_type")' }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'single quotes' do
      let(:text) { ".all-caps-label(translate-once='activerecord.attributes.proposal_term.deal_type')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'translate-once-alt' do
      let(:text) { ".all-caps-label(translate-once-alt='activerecord.attributes.proposal_term.deal_type')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'translate-once-placeholder' do
      let(:text) { ".all-caps-label(translate-once-placeholder='activerecord.attributes.proposal_term.deal_type')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'translate-once-title' do
      let(:text) { ".all-caps-label(translate-once-title='activerecord.attributes.proposal_term.deal_type')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'translate-once-value' do
      let(:text) { ".all-caps-label(translate-once-title='activerecord.attributes.proposal_term.deal_type')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'javascript' do
      context 'tenary operator' do
        let(:text) do
          <<-TEXT
  %input.search(type="search"
  ng-model="filter.keyword"
  ng-model-options="{debounce: 100}"
  translate-once-placeholder="{{ ctrl.displayTenantLensOptions() ? 'stacking_plan.filter.placeholder_tenants' : 'stacking_plan.filter.placeholder_no_tenants' }}"
  ng-change="ctrl.keywordChanged()")
  TEXT
        end
        it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
      end

      context 'function' do
        let(:text) { '%span(translate-once="{{ translateKey }}")' }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
      end
    end
  end
end
