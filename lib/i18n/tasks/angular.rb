# frozen_string_literal: true
require 'i18n/tasks'

require 'i18n/tasks/angular/version'
require 'i18n/tasks/angular/scanners/translate_abstract'

require 'i18n/tasks/angular/scanners/translate'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::Translate', only: %w(*.html *.haml *.coffee *.js)

require 'i18n/tasks/angular/scanners/translate_once'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::TranslateOnce', only: %w(*.html *.haml *.coffee *.js)

require 'i18n/tasks/angular/scanners/translate_instant'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::TranslateInstant', only: %w(*.coffee *.js)

require 'i18n/tasks/angular/scanners/translate_plural'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::TranslatePlural', only: %w(*.html *.haml)

require 'i18n/tasks/angular/scanners/translate_pluralize'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::TranslatePluralize', only: %w(*.html *.haml)

require 'i18n/tasks/angular/scanners/translation_key'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::TranslationKey', only: %w(*.html *.haml *.coffee *.js)

require 'i18n/tasks/angular/scanners/translation_uib_tooltip'
I18n::Tasks.add_scanner 'I18n::Tasks::Angular::Scanners::TranslationUibTooltip', only: %w(*.html *.haml)
