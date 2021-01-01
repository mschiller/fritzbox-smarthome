module Fritzbox
  module Smarthome
    class Switch < Actor

      attr_accessor \
        :switch_state,
        :switch_mode,
        :switch_lock,
        :switch_devicelock,
        :simpleonoff_state,
        :powermeter_voltage,
        :powermeter_power,
        :powermeter_energy,
        :temperature_celsius,
        :temperature_offset

      class << self
        def new_from_api(data)
          return if data.dig('switch', 'state') == nil
          @values = {
            switch_state:           data.dig('switch', 'state').to_i,
            switch_mode:            data.dig('switch', 'mode').to_s,
            switch_lock:            data.dig('switch', 'lock').to_i,
            switch_devicelock:      data.dig('switch', 'devicelock').to_i,
            simpleonoff_state:      data.dig('simpleonoff', 'state').to_i,
            powermeter_voltage:     data.dig('powermeter', 'voltage').to_i,
            powermeter_power:       data.dig('powermeter', 'power').to_i,
            powermeter_energy:      data.dig('powermeter', 'energy').to_i,
            temperature_celsius:    data.dig('temperature', 'celsius').to_i,
            temperature_offset:     data.dig('temperature', 'offset').to_i
          }
          super
        end
      end
    end
  end
end
