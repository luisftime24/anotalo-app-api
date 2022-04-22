class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :color, :cover_data, :created_at
  def cover_data
    data = object.cover
    {
      cover_url: data.cover_url,
      cover_name: data.cover_name
    }
  end
end
