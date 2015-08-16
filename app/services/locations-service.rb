require 'json'

class LocationsService
  class << self
    def find(name)
      locations.select { |location| location['name'].downcase.include?(name.downcase) }
    end

    def all
      locations
    end

    private

    def locations
      @locations ||= build_locations
    end

    def build_locations
      JSON.parse(File.read(File.expand_path('../../../config/locations.json', __FILE__)))
    end
  end
end
