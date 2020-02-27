require 'active_support/core_ext/string/inflections'

module Onfleet
  class Util
    SPECIAL_PARSE = {
      'skip_sms_notifications' => 'skipSMSNotifications',
      'skip_phone_number_validation' => 'skipPhoneNumberValidation',
      'recipient_skip_sms_notifications' => 'recipientSkipSMSNotifications'
    }.freeze

    def self.constantize(class_name)
      Object.const_get(class_name)
    end

    def self.to_underscore(key)
      key
        .to_s
        .gsub(/::/, '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr('-', '_')
        .downcase
    end

    def self.to_camel_case_lower(str)
      SPECIAL_PARSE[str] || str.camelize(:lower)
    end

    def self.object_classes
      @object_classes ||= {
        'address'     => Address,
        'recipients'  => Recipient,
        'recipient'   => Recipient,
        'tasks'       => Task,
        'destination' => Destination,
        'vehicle'     => Vehicle
      }
    end
  end
end
