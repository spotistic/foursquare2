module Foursquare2
  module PagesUpdate

    # Add an update see https://developer.foursquare.com/docs/pageupdates/add
    #
    # @param [Hash]  options
    # @option options String :pageId - which page to add the update to.
    # @option options String :venueId - A comma-separated list of venue IDs indicated which venues to broadcast from.
    # @option options String :shout - The text of the update.
    # @option options String :photoId -  An optional photo to attach to the broadcast.

    def pageupdates_add(options={})
      response = connection.post do |req|
        req.url "pageupdates/add", options
      end
      return_error_or_body(response, response.body.response.pageUpdate)
    end

  end
end
