module Foursquare2
  module Venuegroups

    # Retrieve information about a venuegroup
    #
    # param [String] group_id The ID of the venuegroup

    def venuegroup(group_id)
      response = connection.get("venuegroups/#{group_id}")
      return_error_or_body(response, response.body.response.venue)
    end

    # Add a venuegroup
    # @param [Hash]  options
    # @option options String :name - Name of the venuegroup (required)
    # @option options String :venueId - Comma-delimited list of venue IDs to add to the group

    def add_venuegroup(options={})
      response = connection.post do |req|
        req.url "venuegroups/add", options
      end
      return_error_or_body(response, response.body.response.venue)
    end

    # List all venue groups owned by the user
    
    def list_venuegroup
      response = connection.post do |req|
        req.url "venuegroups/list"
      end
      return_error_or_body(response, response.body.response.venue)
    end

    # Update a venuegroup
    # @param [String] group_id - The ID of the venue group to modify
    # @param [Hash]  options
    # @option options String :name - The new name to give to the group
    # @option options String :venueId - An array of venue IDs that will become the new set of venue IDs for the group.

    def update_venuegroups(group_id, options={})
      options[:venueId] = options[:venueId].join(',') # Transforms the array into a 'comma-separated list' of ids.
      response = connection.post do |req|
        req.url "venuegroups/#{group_id}/update", options
      end
      return_error_or_body(response, response.body.response)
    end

    # Get daily venue stats for the venues in a group over a time range.
    # Client instance should represent an OAuth user who is the venuegroup owner.
    #
    # @param [Hash] options
    # @option options Array[String] :group_id - The ID of the venue group to modify
    # @option options Integer :startAt - Required. The start of the time range to retrieve stats for (seconds since epoch).
    # @option options Integer :endAt - The end of the time range to retrieve stats for (seconds since epoch). If omitted, the current time is assumed.
    # @option options String :fields - Specifies which fields to return. May be one or more of totalCheckins, newCheckins, uniqueVisitors, sharing, genders, ages, hours, separated by commas.

    def venuegroups_timeseries(options={})
      response = connection.get do |req|
        req.url "venuegroups/#{group_id}/timeseries", options
      end
      return_error_or_body(response, response.body.response)
    end
  end
end
