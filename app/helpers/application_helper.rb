# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def json_audit_wordbook
    hash = Audit::KEYS.invert
    hash.each do |key,value|
      hash[key] = t(value)
    end
    hash.to_json
  end
end
