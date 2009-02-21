SELECT * FROM `audits` WHERE
(
  (object_type = 10 and object_id = 16) or
  (object_type = 20 and object_id IN (SELECT id FROM `scenarios` WHERE (`scenarios`.`feature_id` = 16 ))) or
  (
    object_type = 30 and object_id IN
    (
      SELECT id FROM `scenario_steps` WHERE
      (
        (`scenario_steps`.`scenario_id` IN ( SELECT id FROM `scenarios` WHERE (`scenarios`.`feature_id` = 16)) ) or
        (`scenario_steps`.`parent_id` IN (SELECT id FROM `scenario_steps` WHERE (`scenario_steps`.`scenario_id` IN ( SELECT id FROM `scenarios` WHERE (`scenarios`.`feature_id` = 16)))))
      )
    )
  )
)