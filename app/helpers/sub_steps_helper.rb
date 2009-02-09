module SubStepsHelper

  def scenario_step_link_keyword_select
    tmp = []
    ScenarioStep::LINK_KEYWORDS.each_pair { |key, value| tmp.push [t(key), value] }
    tmp
  end
end
