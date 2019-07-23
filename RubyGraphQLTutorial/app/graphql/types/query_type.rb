module Types
  class QueryType < BaseObject
    field :all_links, function: Resolvers::LinksSearch
  end
end
