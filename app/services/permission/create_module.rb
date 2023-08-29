module Permissions
  class CreateService
    def initialize(permission)
      @permission = permission
    end

    def call(permission_name)
      create!(permission_name)
    end

    private
    def create!(permission_name)
      @permission.create(name: permission_name)
    end
  end
end
