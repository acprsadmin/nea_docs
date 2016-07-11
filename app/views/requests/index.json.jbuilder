json.array!(@requests) do |request|
  json.extract! request, :id, :name, :submitted_on, :role, :submitter_id, :requesttype, :urgent, :subject, :description, :response, :impact_hour, :impact_duration, :impact_schedule, :approved, :approver_id, :approved_on, :decision, :decided_on, :decisiontext, :conditions, :decided_by
  json.url request_url(request, format: :json)
end
