class User < ApplicationRecord
  has_many :permissions

  def activate!(reason)
    update(reason: reason, active: true)
  end

  def deactivate!(reason)
    update(reason: reason, active: false)
  end

  def set_permission(permission_name)
    permissions.create(name: permission_name)
    activate!("Because #{permission_name} was created")
  end

  def remove_permission(permission_name)
    permissions.find_by(name: permission_name).delete
    deactivate!("Because #{permission_name} was removed")
  end
end
