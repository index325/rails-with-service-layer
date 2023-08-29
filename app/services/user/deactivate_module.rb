module Users
  class DeactivateService
    def initialize(user)
      @user = user
    end

    def call(reason)
      deactivate!(reason)
    end

    private
    def deactivate!(reason)
      @user.update(reason: reason, active: false)
    end
  end
end
