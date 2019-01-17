<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2019-01-17 14:41:53 --> Undefined property: InviteUser::$User_Invite_model at line no 25 in C:\xampp\htdocs\ACH-master\api\application\modules\InviteUser\controllers\InviteUser.php
ERROR - 2019-01-17 14:41:53 --> Call to a member function userInvite() on null at line no 25 in C:\xampp\htdocs\ACH-master\api\application\modules\InviteUser\controllers\InviteUser.php
ERROR - 2019-01-17 14:43:08 --> Call to undefined method InviteUser_model::userInvite() at line no 25 in C:\xampp\htdocs\ACH-master\api\application\modules\InviteUser\controllers\InviteUser.php
ERROR - 2019-01-17 14:43:45 --> Query error: Unknown column 'StatusId' in 'field list' - Invalid query: INSERT INTO `tbluser` (`EmailAddress`, `StatusId`, `InvitationCode`, `UpdatedOn`) VALUES ('mitesh.patel@theopeneyes.inbb', 0, 'H87U2D', '19-01-17 14:43:45')
ERROR - 2019-01-17 14:43:45 --> Database error! Error Code [1054] Error: Unknown column 'StatusId' in 'field list' at line no 50 in C:\xampp\htdocs\ACH-master\api\application\modules\InviteUser\models\InviteUser_model.php
