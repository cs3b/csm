module SubStepsHelper

  def scenario_step_link_keyword_select
    tmp = []
    ScenarioStep::LINK_KEYWORDS.each_pair { |key, value| tmp.push [t(key), value] }
    tmp
  end
  
  def scenario_step_link_keyword_select_tag
    scenario_step_link_keyword_select.collect { |lk| "<option value=\'#{lk.last}\'>#{lk.first}</option>" }.join
  end
end
