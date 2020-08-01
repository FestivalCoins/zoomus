module Zoomus
  module Actions
    module Meeting

      def meetings(*args)
        options = Utils.extract_options!(args)
        Utils.require_params(:host_id, options)
        Utils.process_datetime_params!(:start_time, options)
        Utils.parse_response self.class.get("/users/#{id}/meetings", :query => options)
      end

      def create_meeting(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:host_id, :topic, :type], options)
        Utils.process_datetime_params!(:start_time, options)
        Utils.parse_response self.class.post("/users/#{id}/meetings", :query => options)
      end

      def get_meeting(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id, :host_id], options)
        Utils.parse_response self.class.get("/meetings/#{id}", :query => options)
      end

      def update_meeting(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id, :host_id], options)
        Utils.process_datetime_params!(:start_time, options)
        Utils.parse_response self.class.patch("/meetings/#{id}", :query => options)
      end

      def delete_meeting(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id, :host_id], options)
        Utils.parse_response self.class.delete("/meetings/#{id}", :query => options)
      end

      def end_meeting(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id, :host_id], options)
        Utils.parse_response self.class.put("/meetings/#{id}/status", :query => options)
      end

      Utils.define_bang_methods(self)
    end
  end
end
