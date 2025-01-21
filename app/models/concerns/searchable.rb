module Searchable
    extend ActiveSupport::Concern
  
    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks
  
      mapping do
        # mapping definition goes here
        indexes :title, type: 'text'
        indexes :location, type: 'text'
      end
  
      def self.search(query)
        # build and run search
        params = {
            query: {
              multi_match: {
                query: query,
                fields: ['title', 'location'],
                fuzziness: "AUTO"
              }
            }
        }
        self.__elasticsearch__.search(params).records.to_a
      end
    end
end
