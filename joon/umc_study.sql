CREATE TABLE `Users` (
	`user_id`	bigint	NOT NULL,
	`password`	varchar(255)	NOT NULL,
	`name`	varchar(100)	NOT NULL,
	`phone`	varchar(11)	NOT NULL,
	`gender`	varchar(100)	NOT NULL,
	`birth`	datetime	NOT NULL,
	`address`	varchar(255)	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL
);

CREATE TABLE `Stores` (
	`store_id`	bigint	NOT NULL,
	`store_name`	varchar(255)(	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL
);

CREATE TABLE `review` (
	`user_id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL,
	`star`	varchar(100)	NOT NULL,
	`content`	text	NOT NULL,
	`picture`	text	NOT NULL
);

CREATE TABLE `Point` (
	`point_id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL,
	`point`	bigint	NOT NULL	DEFAULT 0,
	`issue_date`	datetime(6)	NOT NULL,
	`expiry_date`	datetime(6)	NOT NULL,
	`reason`	varchar(255)	NOT NULL,
	`point_status_code`	varchar(1)	NOT NULL
);

CREATE TABLE `notification` (
	`notification_id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL,
	`content`	text	NOT NULL,
	`notification_url`	text	NOT NULL
);

CREATE TABLE `Inquiry` (
	`inquiry_id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL,
	`title`	varchar(255)	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL,
	`picture`	text	NOT NULL
);

CREATE TABLE `missions` (
	`mission_id`	bigint	NOT NULL,
	`point_id`	bigint	NOT NULL,
	`created_at`	timestamp	NOT NULL,
	`modified_at`	timestamp	NOT NULL,
	`status`	varchar(255)	NOT NULL,
	`content`	varchar(255)	NOT NULL,
	`region_id`	bigint	NOT NULL
);

CREATE TABLE `Auth` (
	`social_login_id`	bigint	NOT NULL,
	`user_id`	bigint	NOT NULL
);

CREATE TABLE `UserMission` (
	`user_id`	bigint	NOT NULL,
	`mission_id`	bigint	NOT NULL,
	`success_or_fail`	varchar	NOT NULL	DEFAULT fail
);

CREATE TABLE `PointDetail` (
	`point_detail_id`	bigint	NOT NULL,
	`point_id`	bigint	NOT NULL,
	`point_status_code`	varchar(1)	NOT NULL	DEFAULT 0,
	`point`	int	NOT NULL	DEFAULT 0,
	`user_id`	bigint	NOT NULL
);

CREATE TABLE `StoreMission` (
	`store_id`	bigint	NOT NULL,
	`mission_id`	bigint	NOT NULL
);

CREATE TABLE `PreferFood` (
	`food_category`	enum	NOT NULL,
	`user_id`	bigint	NOT NULL
);

CREATE TABLE `region` (
	`region_id`	bigint	NOT NULL,
	`region_name`	varchar(255)	NOT NULL
);

ALTER TABLE `Users` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `Stores` ADD CONSTRAINT `PK_STORES` PRIMARY KEY (
	`store_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`user_id`,
	`store_id`
);

ALTER TABLE `Point` ADD CONSTRAINT `PK_POINT` PRIMARY KEY (
	`point_id`
);

ALTER TABLE `notification` ADD CONSTRAINT `PK_NOTIFICATION` PRIMARY KEY (
	`notification_id`
);

ALTER TABLE `Inquiry` ADD CONSTRAINT `PK_INQUIRY` PRIMARY KEY (
	`inquiry_id`
);

ALTER TABLE `missions` ADD CONSTRAINT `PK_MISSIONS` PRIMARY KEY (
	`mission_id`
);

ALTER TABLE `UserMission` ADD CONSTRAINT `PK_USERMISSION` PRIMARY KEY (
	`user_id`,
	`mission_id`
);

ALTER TABLE `PointDetail` ADD CONSTRAINT `PK_POINTDETAIL` PRIMARY KEY (
	`point_detail_id`
);

ALTER TABLE `StoreMission` ADD CONSTRAINT `PK_STOREMISSION` PRIMARY KEY (
	`store_id`,
	`mission_id`
);

ALTER TABLE `region` ADD CONSTRAINT `PK_REGION` PRIMARY KEY (
	`region_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_Users_TO_review_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `Users` (
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_Stores_TO_review_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `Stores` (
	`store_id`
);

ALTER TABLE `UserMission` ADD CONSTRAINT `FK_Users_TO_UserMission_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `Users` (
	`user_id`
);

ALTER TABLE `UserMission` ADD CONSTRAINT `FK_missions_TO_UserMission_1` FOREIGN KEY (
	`mission_id`
)
REFERENCES `missions` (
	`mission_id`
);

ALTER TABLE `StoreMission` ADD CONSTRAINT `FK_Stores_TO_StoreMission_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `Stores` (
	`store_id`
);

ALTER TABLE `StoreMission` ADD CONSTRAINT `FK_missions_TO_StoreMission_1` FOREIGN KEY (
	`mission_id`
)
REFERENCES `missions` (
	`mission_id`
);

