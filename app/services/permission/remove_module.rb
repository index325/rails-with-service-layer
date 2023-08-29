module Permissions
  class RemoveService
    def initialize(permission)
      @permission = permission
    end

    def call(permission_name)
      remove!(permission_name)
    end

    private
    def remove!(permission_name)
      @permission.find_by(name: permission_name).delete
    end
  end
end
