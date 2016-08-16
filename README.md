# i18n-tasks-angular
i18n-tasks-angular extends i18n-tasks with scanners for angular-translate and angular-translate-once

This gem provides scanners for key usages, such as:

- $translate.instant
- translate=, translate-attr-\*=
- translate-once=, translate-once-\*=
- | pluralize
- %translate-plural=
- translation-key=

## Installation

Add i18n-tasks-angular to the Gemfile:

```ruby
gem 'i18n-tasks-angular'
```

You need to add `<% require "i18n/tasks/angular" %>` at the top of your `i18n-tasks.yml.erb`.

## Usage

Run `i18n-tasks` to get the list of all the tasks with short descriptions.
