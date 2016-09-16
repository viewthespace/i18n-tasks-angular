# frozen_string_literal: true
require 'spec_helper'

RSpec.describe I18n::Tasks::Angular::Scanners::Translate do
  subject(:translate) { described_class.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '.all-caps-label(translate="activerecord.attributes.proposal_term.deal_type")' }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'single quotes' do
      let(:text) { ".all-caps-label(translate='activerecord.attributes.proposal_term.deal_type')" }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate.pattern).flatten.first).to eq('activerecord.attributes.proposal_term.deal_type') }
    end

    context 'translate-attr-placeholder' do
      let(:text) { '%input(type="text" name="end_date" required translate translate-attr-placeholder="date.formats.short.placeholder"' }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate.pattern).flatten.first).to eq('date.formats.short.placeholder') }
    end

    context 'translate-key' do
      let(:text) { '%ht-submit(translate-key="tenant_rep.deals.new.invite_action")' }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(translate.pattern).flatten.first).to eq('tenant_rep.deals.new.invite_action') }
    end

    context 'javascript tenary operator' do
      let(:text) { '%span(translate="{{ ctrl.displayTenantLensOptions() ? \'stacking_plan.filter.placeholder_tenants\' : \'stacking_plan.filter.placeholder_no_tenants\' }}")' }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(0) }
    end

    context 'javascript function' do
      let(:text) { '%span(translate="{{ translateKey }}")' }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(0) }
    end

    context 'translate-once-placeholder' do
      let(:text) { '%input(type="text" name="end_date" required translate-once-placeholder="date.formats.short.placeholder"' }
      it { expect(text.scan(translate.pattern).flatten.size).to eq(0) }
    end
  end
end
