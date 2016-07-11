json.array!(@resources) do |resource|
  json.extract! resource, :id, :submitter, :position, :organization, :submitter_email, :submitter_phone, :mepi_project, :mepi_project_number, :focus_women, :focus_youth, :description
  json.url resource_url(resource, format: :json)
end
