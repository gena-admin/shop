module ProductImporter
  extend ActiveSupport::Concern

  module ClassMethods
    def import_json_data(json)
      self.transaction { self.create(json['products']) }
    end
  end

  class ProducImporterErrors < StandardError; end
end
