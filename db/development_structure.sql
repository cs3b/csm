CREATE TABLE `features` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `in_order_to` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `scenarios` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(255) default NULL,
  `parent_id` int(11) default NULL,
  `position` int(11) default NULL,
  `type_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stories` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `description` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `feature_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20081214092459');

INSERT INTO schema_migrations (version) VALUES ('20081227082348');

INSERT INTO schema_migrations (version) VALUES ('20081227111012');

INSERT INTO schema_migrations (version) VALUES ('20090101184824');

INSERT INTO schema_migrations (version) VALUES ('20090103151236');