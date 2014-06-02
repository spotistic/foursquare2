module Foursquare2
  module PagesUpdate

    # Add a tip
    #
    # @param [Hash]  options
    # @option options String :pageId - Required, which page to add the tip to.
    # @option options String :venueId - Required, which venue to add the tip to.
    # @option options String :shout - The text of the update.
    # @option options String :photoId -  An optional photo to attach to the broadcast.

    def pageupdates_add(options={})
      response = connection.post do |req|
        req.url "pageupdates/add", options
      end
      return_error_or_body(response, response.body.response.tip)
    end

  end
end
