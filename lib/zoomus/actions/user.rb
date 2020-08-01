module Zoomus
  module Actions
    module User

      def all_users(*args)
        options = Utils.extract_options!(args)
        Utils.parse_response self.class.get('/users', :query => options)
      end

      def create_user(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:type, :email], options)
        Utils.parse_response self.class.post('/users', :query => options)
      end

      def delete_user(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id], options)
        Utils.parse_response self.class.post('/users', :query => options)
      end 

      def update_user(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id], options)
        Utils.parse_response self.class.patch("/users/#{id}", :query => options)
      end

      def get_user(*args)
        options = Utils.extract_options!(args)
        Utils.require_params([:id], options)
        Utils.parse_response self.class.get("/users/#{id}", :query => options)
      end

      Utils.define_bang_methods(self)
    end
  end
end
