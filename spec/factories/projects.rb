FactoryBot.define do
  factory :project do
    name { 'Test Project' }
    start_date { Date.today }
    duration { 5 }
    end_date { DurationParser.find_end_date(start_date, duration) }
  end
end
