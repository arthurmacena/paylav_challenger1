require "simplecov"

if ENV["SIMPLECOV"] == "true"
  SimpleCov.start "rails" do
    use_merging true
    minimum_coverage 70
    minimum_coverage_by_file 0
  end
end
