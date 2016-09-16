# frozen_string_literal: true
require 'spec_helper'

RSpec.describe I18n::Tasks::Angular::Scanners::TranslationKey, type: :scanner do
  subject { described_class.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '%ht-submit(translation-key="common.save")' }
      it { expect(scan_keys.size).to eq(1) }
      it { expect(scan_keys).to include('common.save') }
    end

    context 'single quotes' do
      let(:text) { "%ht-submit(translation-key='common.save')" }
      it { expect(scan_keys.size).to eq(1) }
      it { expect(scan_keys).to include('common.save') }
    end

    context '%ht-modal-field' do
      let(:text) { '%ht-modal-field(full-width="true" translation-key="activerecord.attributes.commission.value" right-label=" {{ ctrl.totalCommissionAmount() | unitFormat:editable:\'MONEY\' }}")' }
      it { expect(scan_keys.size).to eq(1) }
      it { expect(scan_keys).to include('activerecord.attributes.commission.value') }
    end

    context 'ht-sortable' do
      let(:text) { '%th.reason(ht-sortable translation-key="deals.dead.reason" property="deal_dying_update_reason_id" predicate="predicate" reverse="reverse")' }
      it { expect(scan_keys.size).to eq(1) }
      it { expect(scan_keys).to include('deals.dead.reason') }
    end

    context 'javascript' do
      context 'tenary operator' do
        let(:text) { '%ht-submit(translation-key="{{ executedDealWizardCtrl.isLastStep() ? \'common.complete\' : \'common.continue\' }}")' }
        it { expect(scan_keys.size).to eq(2) }
        it { expect(scan_keys).to include('common.complete') }
        it { expect(scan_keys).to include('common.continue') }
      end

      context 'function' do
        let(:text) { '%ht-modal-field(translation-key="{{ ctrl.noteLabelTranslateKey() }}" full-width="true")' }
        it { expect(scan_keys.size).to eq(0) }
      end
    end
  end
end
