# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'TranslationKey' do
  subject { I18n::Tasks::Angular::Scanners::TranslationKey.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '%ht-submit(translation-key="common.save")' }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('common.save') }
    end

    context 'single quotes' do
      let(:text) { "%ht-submit(translation-key='common.save')" }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('common.save') }
    end

    context '%ht-modal-field' do
      let(:text) { '%ht-modal-field(full-width="true" translation-key="activerecord.attributes.commission.value" right-label=" {{ ctrl.totalCommissionAmount() | unitFormat:editable:\'MONEY\' }}")' }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('activerecord.attributes.commission.value') }
    end

    context 'ht-sortable' do
      let(:text) { '%th.reason(ht-sortable translation-key="deals.dead.reason" property="deal_dying_update_reason_id" predicate="predicate" reverse="reverse")' }
      it { expect(text.scan(subject.pattern).flatten.size).to eq(1) }
      it { expect(text.scan(subject.pattern).flatten.first).to eq('deals.dead.reason') }
    end

    context 'javascript' do
      context 'tenary operator' do
        let(:text) { '%ht-submit(translation-key="{{ executedDealWizardCtrl.isLastStep() ? \'common.complete\' : \'common.continue\' }}")' }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
      end

      context 'function' do
        let(:text) { '%ht-modal-field(translation-key="{{ ctrl.noteLabelTranslateKey() }}" full-width="true")' }
        it { expect(text.scan(subject.pattern).flatten.size).to eq(0) }
      end
    end
  end
end
