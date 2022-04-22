class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :token, :notes
  def notes
    object.notes.size
  end
end
