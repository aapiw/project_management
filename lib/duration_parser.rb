module DurationParser
  class << self
    def find_end_date(start_date, duration)
      case duration.downcase
      when /\A(\d+)\s*days?\z/
        start_date.next_day($1.to_i)
      when /\A(\d+)\s*weeks?\z/
        start_date.next_day($1.to_i*7)
      when /\A(\d+)\s*months?\z/
        start_date.next_month($1.to_i)
      else
        raise ArgumentError, "Invalid duration format"
      end
    end
  end
end
