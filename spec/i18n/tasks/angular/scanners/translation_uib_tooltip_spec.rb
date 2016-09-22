# frozen_string_literal: true
require 'spec_helper'

RSpec.describe I18n::Tasks::Angular::Scanners::TranslationUibTooltip, type: :scanner do
  subject { described_class.new }

  describe '#pattern' do
    context 'double quotes' do
      let(:text) { '<ht-toggle class="mll disabled" disabled ng-if="!ctrl.canToggleAssetSubscription(notificationProfile)" tooltip-append-to-body="true" tooltip-placement="right" translation-uib-tooltip="asset.realtime_and_summary_notifications_disabled"></ht-toggle>' }
      it { expect(scan_keys.size).to eq(1) }
      it { expect(scan_keys).to include('asset.realtime_and_summary_notifications_disabled') }
    end

    context 'single quotes' do
      let(:text) { "<i class='fa fa-info-circle' translation-uib-tooltip='space.target_size_toolip'></i>" }
      it { expect(scan_keys.size).to eq(1) }
      it { expect(scan_keys).to include('space.target_size_toolip') }
    end

    context 'javascript' do
      context 'tenary operator' do
        let(:text) { '<i class="fa fa-info-circle" translation-uib-tooltip="{{ executedDealWizardCtrl.isLastStep() ? \'common.complete\' : \'common.continue\' }}"></i>' }
        it { expect(scan_keys.size).to eq(2) }
        it { expect(scan_keys).to include('common.complete') }
        it { expect(scan_keys).to include('common.continue') }
      end

      context 'function' do
        let(:text) { '%ht-modal-field(translation-uib-tooltip="{{ ctrl.noteLabelTranslateKey() }}" full-width="true")' }
        it { expect(scan_keys.size).to eq(0) }
      end
    end
  end
end
