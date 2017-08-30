json.array!(@ticket_diagnostics) do |ticket_diagnostic|
  json.extract! ticket_diagnostic, :id, :hard_drive, :mem_test, :mobo, :dumps, :scans, :temp, :chkdsk, :policies, :details
  json.url ticket_diagnostic_url(ticket_diagnostic, format: :json)
end
