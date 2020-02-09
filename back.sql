/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.4.10-MariaDB : Database - campusvotingdb
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`campusvotingdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `campusvotingdb`;

/*Table structure for table `campaigngroups` */

DROP TABLE IF EXISTS `campaigngroups`;

CREATE TABLE `campaigngroups` (
  `campaignGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `schoolYearId` int(11) DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`campaignGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `campaigngroups` */

/*Table structure for table `candidateclearances` */

DROP TABLE IF EXISTS `candidateclearances`;

CREATE TABLE `candidateclearances` (
  `candidateClearanceId` int(11) NOT NULL AUTO_INCREMENT,
  `positionId` int(11) DEFAULT NULL,
  `gradeId` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`candidateClearanceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `candidateclearances` */

insert  into `candidateclearances`(`candidateClearanceId`,`positionId`,`gradeId`,`active`) values (1,1,1,0),(2,1,2,1),(3,1,3,1),(4,2,1,0),(5,2,2,0),(6,2,3,1);

/*Table structure for table `candidates` */

DROP TABLE IF EXISTS `candidates`;

CREATE TABLE `candidates` (
  `candidateId` int(11) NOT NULL AUTO_INCREMENT,
  `pictureId` int(11) DEFAULT NULL,
  `studentId` int(11) NOT NULL,
  `schoolYearId` int(11) DEFAULT NULL,
  `positionId` int(11) DEFAULT NULL,
  `campaignGroupId` int(11) DEFAULT NULL,
  `propaganda` varchar(100) NOT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`candidateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `candidates` */

/*Table structure for table `castedvotes` */

DROP TABLE IF EXISTS `castedvotes`;

CREATE TABLE `castedvotes` (
  `castedVoteId` int(11) NOT NULL AUTO_INCREMENT,
  `votingSessionId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `candidateId` int(11) NOT NULL,
  `statId` int(11) DEFAULT NULL,
  PRIMARY KEY (`castedVoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `castedvotes` */

/*Table structure for table `gradeandsections` */

DROP TABLE IF EXISTS `gradeandsections`;

CREATE TABLE `gradeandsections` (
  `gradeAndSectionId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`gradeAndSectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `gradeandsections` */

insert  into `gradeandsections`(`gradeAndSectionId`,`title`,`gradeId`,`sectionId`,`statId`,`createdById`,`createdOn`,`modifiedById`,`modifiedOn`) values (1,'Rizal',1,1,1,1,'2020-02-04 00:32:31',NULL,NULL),(2,'Bonifacio',1,2,1,1,'2020-02-04 00:32:58',NULL,NULL),(3,'Silang',1,3,1,1,'2020-02-05 12:24:53',NULL,NULL),(4,'Aquino',1,4,1,1,'2020-02-05 12:26:26',NULL,NULL),(5,'Luna',1,5,1,1,'2020-02-05 12:29:04',NULL,NULL),(6,'Aguinaldo',1,6,1,1,'2020-02-05 12:33:23',1,'2020-02-05 12:34:19'),(7,'shbrfghdghdev',1,7,0,1,'2020-02-05 12:37:51',NULL,NULL),(8,'M. H. Del Pilar',1,7,1,1,'2020-02-08 19:51:38',NULL,NULL),(9,'Nervous',2,1,1,1,'2020-02-09 17:18:47',1,'2020-02-09 17:20:07'),(10,'Muscular',2,2,1,1,'2020-02-09 17:19:48',NULL,NULL),(11,'Respiratory',2,3,1,1,'2020-02-09 17:21:17',1,'2020-02-09 17:21:27'),(12,'Digestive',2,4,1,1,'2020-02-09 17:21:50',NULL,NULL),(13,'Circulatory',2,5,1,1,'2020-02-09 17:22:27',NULL,NULL),(14,'Skeletal',2,6,1,1,'2020-02-09 17:24:44',NULL,NULL),(15,'Excretory',2,7,1,1,'2020-02-09 17:25:07',NULL,NULL),(16,'Gold',3,1,1,1,'2020-02-09 17:26:03',NULL,NULL),(17,'Silver',3,2,1,1,'2020-02-09 17:26:13',NULL,NULL),(18,'Copper',3,3,1,1,'2020-02-09 17:26:24',NULL,NULL),(19,'Boron',3,4,1,1,'2020-02-09 17:26:32',NULL,NULL),(20,'Hydrogen',3,5,1,1,'2020-02-09 17:27:16',NULL,NULL),(21,'Sodium',3,6,1,1,'2020-02-09 17:28:19',NULL,NULL),(22,'Uranium',3,7,1,1,'2020-02-09 17:29:03',NULL,NULL);

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `gradeId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `grades` */

insert  into `grades`(`gradeId`,`title`,`details`,`statId`,`createdById`,`createdOn`,`modifiedById`,`modifiedOn`) values (1,'07','1st year',1,1,'2020-02-04 00:27:09',NULL,NULL),(2,'08','2nd year',1,1,'2020-02-04 00:27:22',NULL,NULL),(3,'09','3rd year',1,1,'2020-02-04 00:27:33',NULL,NULL);

/*Table structure for table `pictures` */

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `pictureId` int(11) NOT NULL AUTO_INCREMENT,
  `pict` blob DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  PRIMARY KEY (`pictureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pictures` */

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `positionId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `positionType` varchar(1000) DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`positionId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `positions` */

insert  into `positions`(`positionId`,`title`,`details`,`positionType`,`statId`,`createdById`,`createdOn`,`modifiedById`,`modifiedOn`) values (1,'President','Main man','Regular',1,1,'2020-02-09 17:37:47',1,'2020-02-10 00:27:09'),(2,'Vice President','Reserve main man','Regular',1,1,'2020-02-09 17:38:41',1,'2020-02-10 00:26:25');

/*Table structure for table `schoolyears` */

DROP TABLE IF EXISTS `schoolyears`;

CREATE TABLE `schoolyears` (
  `schoolYearId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`schoolYearId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `schoolyears` */

insert  into `schoolyears`(`schoolYearId`,`title`,`details`,`active`,`statId`,`createdById`,`createdOn`,`modifiedById`,`modifiedOn`) values (1,'1998-1999','late nineties',0,1,1,'2020-01-24 20:06:53',NULL,NULL),(2,'1999-2000','year 2000',0,1,1,'2020-01-24 20:07:37',NULL,NULL),(3,'2001-2002','year 2001',1,0,1,'2020-01-24 20:09:04',NULL,NULL),(4,'2002-2003','year 2002',0,1,1,'2020-01-24 20:09:33',1,'2020-01-25 10:10:05'),(5,'2003-2004','year 2003',0,1,1,'2020-01-24 20:10:49',NULL,NULL),(6,'2004-2005','year 2004',1,1,1,'2020-01-25 10:08:47',1,'2020-01-25 10:21:20'),(7,'egerwgewrg','egrwegwer',0,1,1,'2020-01-25 10:22:02',1,'2020-01-25 10:22:14');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `sectionId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` varchar(1000) DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedById` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`sectionId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sections` */

insert  into `sections`(`sectionId`,`title`,`details`,`statId`,`createdById`,`createdOn`,`modifiedById`,`modifiedOn`) values (1,'A','1st section',1,1,'2020-02-04 00:29:06',1,'2020-02-04 00:30:49'),(2,'B','2nd section',1,1,'2020-02-04 00:29:27',NULL,NULL),(3,'C','3rd section',1,1,'2020-02-04 00:29:42',NULL,NULL),(4,'D','4th section',1,1,'2020-02-04 00:29:51',NULL,NULL),(5,'E','5th section',1,1,'2020-02-04 00:30:06',NULL,NULL),(6,'F','6th section',1,1,'2020-02-04 00:30:19',NULL,NULL),(7,'G','7th section',1,1,'2020-02-04 00:30:33',NULL,NULL);

/*Table structure for table `stats` */

DROP TABLE IF EXISTS `stats`;

CREATE TABLE `stats` (
  `statId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `details` varchar(1000) NOT NULL,
  PRIMARY KEY (`statId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stats` */

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `lrn` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(100) NOT NULL,
  `gradeAndSectionId` int(11) DEFAULT NULL,
  `currentSectionName` varchar(100) NOT NULL,
  `schoolYearId` int(11) NOT NULL,
  `statId` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `students` */

insert  into `students`(`studentId`,`lrn`,`password`,`lastName`,`firstName`,`middleName`,`gradeAndSectionId`,`currentSectionName`,`schoolYearId`,`statId`) values (1,'0001','1','last01','first01','middle01',1,'rizal',0,1),(2,'0002','1','last02','first02','middle02',1,'rizal',0,1),(3,'0003','1','koko01','first03','middle03',1,'rizal',0,1),(4,'0004','1','last04','first04','middle04',1,'rizal',0,1),(5,'0005','1','last05','first05','middle05',1,'rizal',0,1),(6,'0006','1','zeze01','first06','middle06',1,'rizal',0,1),(7,'0007','1','last07','first07','middle07',1,'rizal',0,1),(8,'0008','1','last08','first08','middle08',1,'rizal',0,1),(9,'0009','1','yoyo01','first09','middle09',1,'rizal',0,1),(10,'0010','1','last10','first10','middle10',1,'rizal',0,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(100) NOT NULL,
  `userLevelId` int(11) DEFAULT 0,
  `statId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`userId`,`userName`,`password`,`lastName`,`firstName`,`middleName`,`userLevelId`,`statId`) values (1,'administrator','ppppppp','doe','jane','mill',0,1);

/*Table structure for table `voterclearances` */

DROP TABLE IF EXISTS `voterclearances`;

CREATE TABLE `voterclearances` (
  `voterClearanceId` int(11) NOT NULL AUTO_INCREMENT,
  `positionId` int(11) DEFAULT NULL,
  `gradeId` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`voterClearanceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `voterclearances` */

insert  into `voterclearances`(`voterClearanceId`,`positionId`,`gradeId`,`active`) values (1,1,1,0),(2,1,2,0),(3,1,3,1),(4,2,1,1),(5,2,2,1),(6,2,3,1);

/*Table structure for table `votingsessions` */

DROP TABLE IF EXISTS `votingsessions`;

CREATE TABLE `votingsessions` (
  `votingSessionId` int(11) NOT NULL AUTO_INCREMENT,
  `schoolYearId` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `statId` int(11) DEFAULT NULL,
  `createdById` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `startedById` int(11) NOT NULL,
  `startedOn` datetime NOT NULL,
  `stoppedById` int(11) NOT NULL,
  `stoppedOn` datetime NOT NULL,
  PRIMARY KEY (`votingSessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `votingsessions` */

/*Table structure for table `winners` */

DROP TABLE IF EXISTS `winners`;

CREATE TABLE `winners` (
  `winnerId` int(11) NOT NULL AUTO_INCREMENT,
  `votingSessionId` int(11) NOT NULL,
  `schoolYearId` int(11) NOT NULL,
  `candidateId` int(11) NOT NULL,
  `totalVotes` int(11) NOT NULL,
  PRIMARY KEY (`winnerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `winners` */

/* Procedure structure for procedure `AddCandidateClearance` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddCandidateClearance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCandidateClearance`(
    in intPositionId int,
    in intGradeId int,
    in boolActive boolean,
    out itExists int
)
begin
    select count(candidateClearanceId) 
    into itExists 
    from candidateClearances
    where positionId = intPositionId 
    and gradeId = intGradeId;
    
    if(itExists = 0) then
        insert into candidateClearances(
            positionId,
            gradeId,
            active
        )
        values(
            intPositionId,
            intGradeId,
            boolActive
        );
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `AddGrade` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddGrade` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGrade`(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intCreatedById int,
    out itExists int
)
begin
    select count(gradeId) 
    into itExists 
    from grades
    where title = strTitle 
    and statId = 1;
    
    if(itExists = 0) then
        insert into grades(
            title,
            details,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            1,
            intCreatedById,
            now()
        );
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `AddGradeAndSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddGradeAndSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGradeAndSection`(
    in strTitle varchar(100),
    in intGradeId int,
    in intSectionId int,    
    in intCreatedById int,
    out itExists int
)
begin
    select count(sectionId) 
    into itExists 
    from gradeAndSections
    where gradeId = intGradeId
        and sectionId = intSectionId
        and statId = 1;
    
    if(itExists = 0) then
        insert into gradeAndSections(
            title,
            gradeId,
            sectionId,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            intGradeId,
            intSectionId,
            1,
            intCreatedById,
            now()
        );
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `AddPosition` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddPosition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPosition`(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in strPositionType varchar(100),
    in intCreatedById int,
    out itExists int,
    out intNewId int
)
begin
    select count(positionId) 
    into itExists 
    from positions
    where title = strTitle 
    and statId = 1;
    
    if(itExists = 0) then
        insert into positions(
            title,
            details,
            positionType,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            strPositionType,
            1,
            intCreatedById,
            now()
        );
        set intNewId = last_insert_id();
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `AddSchoolYear` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddSchoolYear` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSchoolYear`(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in boolActive boolean,    
    in intCreatedById int,
    out itExists int
)
begin
    select count(schoolYearId) 
    into itExists 
    from schoolYears
    where title = strTitle 
    and statId = 1;
       
    if(itExists = 0) then
        if(boolActive = 1) then
            update schoolYears 
            set active = 0
            where active = 1
            and statId = 1;
        end if;
        insert into schoolYears(
            title,
            details,
            active,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            boolActive,
            1,
            intCreatedById,
            now()
        );
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `AddSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSection`(
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in intCreatedById int,
    out itExists int
)
begin
    select count(sectionId) 
    into itExists 
    from sections
    where title = strTitle 
    and statId = 1;
    
    if(itExists = 0) then
        insert into sections(
            title,
            details,
            statId,
            createdById,
            createdOn
        )
        values(
            strTitle,
            strDetails,
            1,
            intCreatedById,
            now()
        );
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `AddVoterClearance` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddVoterClearance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `AddVoterClearance`(
    in intPositionId int,
    in intGradeId int,
    in boolActive boolean,
    out itExists int
)
begin
    select count(voterClearanceId) 
    into itExists 
    from voterClearances
    where positionId = intPositionId 
    and gradeId = intGradeId;
    
    if(itExists = 0) then
        insert into voterClearances(
            positionId,
            gradeId,
            active
        )
        values(
            intPositionId,
            intGradeId,
            boolActive
        );
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteCandidateClearance` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteCandidateClearance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCandidateClearance`(
    in intId int
)
begin
        
    update candidateClearances
    set statId = 0
    where candidateClearanceId = intId;
    
end */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteGrade` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteGrade` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGrade`(
    in intId int
)
begin
        
    update grades
    set statId = 0
    where gradeId = intId;
    
end */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteGradeAndSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteGradeAndSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGradeAndSection`(
    in intId int    
)
begin
    
    update gradeAndSections
    set statId = 0            
    where (gradeAndSectionId = intId or intId = 0) and
        statId = 1;   
end */$$
DELIMITER ;

/* Procedure structure for procedure `DeletePosition` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeletePosition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePosition`(

    in intId int

)
begin

        

    update positions

    set statId = 0

    where positionId = intId;

    

end */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteSchoolYear` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteSchoolYear` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSchoolYear`(

    in intId int

)
begin

        

    update schoolYears

    set statId = 0

    where schoolYearId = intId;

    

end */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSection`(

    in intId int

)
begin

        

    update sections

    set statId = 0

    where sectionId = intId;

    

end */$$
DELIMITER ;

/* Procedure structure for procedure `DeleteVoterClearance` */

/*!50003 DROP PROCEDURE IF EXISTS  `DeleteVoterClearance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteVoterClearance`(
    in intId int
)
begin
        
    delete from voterClearances
    where voterClearanceId = intId;
    
end */$$
DELIMITER ;

/* Procedure structure for procedure `EditCandidateClearance` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditCandidateClearance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditCandidateClearance`(
    in intId int,
    in intPositionId int,
    in intGradeId int,   
    in boolActive boolean,
    out itExists int
)
begin
    select count(candidateClearanceId)
    into itExists
    from candidateClearances
    where positionId = intPositionId
    and gradeId = intGradeId
    and candidateClearanceId <> intId;
    
    if(itExists = 0) then
        update candidateClearances
        set active = boolActive
        where candidateClearanceId = intId;
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `EditGradeAndSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditGradeAndSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditGradeAndSection`(
    in intId int,
    in strTitle varchar(100),
    in intGradeId int,
    in intSectionId int,    
    in intModifiedById int,
    out itExists int
)
begin
    select count(gradeAndSectionId) 
    into itExists 
    from gradeAndSections
    where gradeId = intGradeId
        and sectionId = intSectionId
        and statId = 1
        and gradeAndSectionId != intId;
    
    if(itExists = 0) then
        update gradeAndSections
        set title = strTitle,
            gradeId = intGradeId,
            sectionId = intSectionId,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where (gradeAndSectionId = intId or intId = 0) and
            statId = 1;
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `EditPosition` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditPosition` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditPosition`(

    in intId int,

    in strTitle varchar(100),

    in strDetails varchar(1000),

    in strPositionType varchar(100),

    in intModifiedById int,

    out itExists int

)
begin



    select count(positionId)

    into itExists

    from positions

    where positionId <> intId

    and title = strTitle

    and statId = 1;



    if(itExists = 0) then

        update positions

        set title = strTitle,

            details = strDetails,

            positionType = strPositionType,

            modifiedById = intModifiedById,

            modifiedOn = now()

        where positionId = intId;

    end if;



end */$$
DELIMITER ;

/* Procedure structure for procedure `EditSchoolYear` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditSchoolYear` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditSchoolYear`(
    in intId int,
    in strTitle varchar(100),
    in strDetails varchar(1000),
    in boolActive boolean,
    in intModifiedById int,
    out itExists int
)
begin
    select count(schoolYearId)
    into itExists
    from schoolYears
    where schoolYearId <> intId
    and title = strTitle
    and statId = 1;
    if(itExists = 0) then
        if(boolActive = 1) then
            update schoolYears 
            set active = 0
            where active = 1
            and schoolYearId <> intId
            and statId = 1;
        end if;
        update schoolYears
        set title = strTitle,
            details = strDetails,
            active = boolActive,
            modifiedById = intModifiedById,
            modifiedOn = now()
        where schoolYearId = intId;
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `EditSection` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditSection` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditSection`(

    in intId int,

    in strTitle varchar(100),

    in strDetails varchar(1000),

    in intModifiedById int,

    out itExists int

)
begin

    select count(sectionId) 

    into itExists 

    from sections

    where sectionId <> intId and

        title = strTitle and

        statId = 1;

    

    if(itExists = 0) then

        update sections

        set title = strTitle,

            details = strDetails,

            modifiedById = intModifiedById,

            modifiedOn = now()

        where sectionId = intId and 

            statId = 1;

    end if;

end */$$
DELIMITER ;

/* Procedure structure for procedure `EditVoterClearance` */

/*!50003 DROP PROCEDURE IF EXISTS  `EditVoterClearance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EditVoterClearance`(
    in intId int,
    in intPositionId int,
    in intGradeId int,   
    in boolActive boolean,
    out itExists int
)
begin
    select count(voterClearanceId)
    into itExists
    from voterClearances
    where positionId = intPositionId
    and gradeId = intGradeId
    and voterClearanceId <> intId;
       
    if(itExists = 0) then
        update voterClearances
        set active = boolActive
        where voterClearanceId = intId;
    end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetCandidateClearances` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetCandidateClearances` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCandidateClearances`(
    in intPositionId int,
    in strPosition varchar(100),
    in intGradeId int,
    in strGrade varchar(100)
)
begin
    select
        ifnull(a.candidateClearanceId, 0) AS CandidateClearanceId,
        ifnull(a.positionId, 0) AS PositionId,
        ifnull(b.title, '') AS PositionName,
        ifnull(a.gradeId, 0) AS GradeId,
        ifnull(c.title, '') AS GradeName,
        ifnull(a.Active, 0) AS Active
    from candidateClearances a
        left join positions b on a.positionId = b.positionId
        left join grades c on a.gradeId = c.gradeId
    where (a.positionId = intPositionId or intPositionId = 0)    
    and (b.title like concat('%', strPosition, '%') or strPosition = '')
    and b.statId = 1
    and (a.gradeId = intGradeId or intGradeId = 0)
    and (c.title like concat('%', strGrade, '%') or strGrade = '')
    and c.statId = 1;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetGradeAndSections` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetGradeAndSections` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGradeAndSections`(
    in intId int,
    in strTitle varchar(100),
    in strGrade varchar(100),
    in strSection varchar(100)      
)
begin
    select 
        ifnull(a.gradeAndSectionId, 0) as GradeAndSectionId,
        ifnull(a.title, '') as Title,
        ifnull(a.gradeId, 0) as GradeId,
        concat(d.title, '') as GradeName,
        ifnull(a.sectionId, 0) as SectionId,
        concat(e.title, '') as SectionName,
        ifnull(a.statId, 0) as StatId,
        ifnull(a.createdById, 0) as CreatedById,
        concat(b.lastname, ', ', b.firstname) as CreatedByName,
        ifnull(a.createdOn, null) as CreatedOn,
        ifnull(a.modifiedById, 0) as ModifiedById,
        concat(c.lastname, ', ', c.firstname) as ModifiedByName,
        ifnull(a.modifiedOn, null) as ModifiedOn
    from gradeAndSections a
        left join users b on a.createdById = b.userId
        left join users c on a.modifiedById = c.userId
        left join grades d on a.gradeId = d.gradeId
        left join sections e on a.sectionId = e.sectionId
    where (a.gradeAndSectionId = intId or intId = 0)
    and (a.title like concat('%', strTitle, '%') or strTitle = '')
    and (d.title like concat('%', strGrade, '%') or strGrade = '')
    and (e.title like concat('%', strSection, '%') or strSection = '')
    and a.statId = 1
    order by a.gradeId asc, a.sectionId asc;    
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetGrades` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetGrades` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetGrades`(

    in intId int,

    in strTitle varchar(100)    

)
begin

    select 

        ifnull(a.gradeId, 0) as GradeId,

        ifnull(a.title, '') as Title,

        ifnull(a.details, '') as Details,

        ifnull(a.statId, 0) as StatId,

        ifnull(a.createdById, 0) as CreatedById,

        concat(b.lastname, ', ', b.firstname) as CreatedByName,

        ifnull(a.createdOn, null) as CreatedOn,

        ifnull(a.modifiedById, 0) as ModifiedById,

        concat(c.lastname, ', ', c.firstname) as ModifiedByName,

        ifnull(a.modifiedOn, null) as ModifiedOn

    from grades a

        left join users b on a.createdById = b.userId

        left join users c on a.modifiedById = c.userId

    where (a.gradeId = intId or intId = 0)

    and (a.title like concat('%', strTitle, '%') or strTitle = '')

    and a.statId = 1

    order by a.title;

end */$$
DELIMITER ;

/* Procedure structure for procedure `GetPositions` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetPositions` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPositions`(
    in intId int,
    in strTitle varchar(100),
	in strPositionType varchar(100)
)
begin
    select 
        ifnull(a.positionId, 0) as PositionId,
        ifnull(a.title, '') as Title,
		ifnull(a.positionType, '') as PositionType,
        ifnull(a.details, '') as Details,
        ifnull(a.statId, 0) as StatId,
        ifnull(a.createdById, 0) as CreatedById,
        concat(b.lastname, ', ', b.firstname) as CreatedByName,
        ifnull(a.createdOn, null) as CreatedOn,
        ifnull(a.modifiedById, 0) as ModifiedById,
        concat(c.lastname, ', ', c.firstname) as ModifiedByName,
        ifnull(a.modifiedOn, null) as modifiedOn
    from positions a
        left join users b on a.createdById = b.userId
        left join users c on a.modifiedById = c.userId
    where (a.positionId = intId or intId = 0)
    and (a.title like concat('%', strTitle, '%') or strTitle = '')
    and (a.positionType like concat('%', strPositionType, '%') or strPositionType = '')
    and a.statId = 1
    order by a.title;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetSchoolYears` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetSchoolYears` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSchoolYears`(

    in intId int,

    in strTitle varchar(100),

    in intActive tinyint



)
begin

    select 

        ifnull(a.schoolYearId, 0) as SchoolYearId,

        ifnull(a.title, '') as Title,

        ifnull(a.details, '') as Details,

        ifnull(a.active, 0) as Active,

        ifnull(a.statId, 0) as StatId,

        ifnull(a.createdById, 0) as CreatedById,

        concat(b.lastname, ', ', b.firstname) as CreatedByName,

        ifnull(a.createdOn, null) as CreatedOn,

        ifnull(a.modifiedById, 0) as ModifiedById,

        concat(c.lastname, ', ', c.firstname) as ModifiedByName,

        ifnull(a.modifiedOn, null) as ModifiedOn

    from schoolyears a

        left join users b on a.createdById = b.userId

        left join users c on a.modifiedById = c.userId

    where (a.schoolYearId = intId or intId = 0)

    and (a.title like concat('%', strTitle, '%') or strTitle = '')

    and (a.active = intActive or intActive = 0)

    and a.statId = 1

    order by a.title;

end */$$
DELIMITER ;

/* Procedure structure for procedure `GetSections` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetSections` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSections`(

    in intId int,

    in strTitle varchar(100)    

)
begin

    select 

        ifnull(a.sectionId, 0) as SectionId,

        ifnull(a.title, '') as Title,

        ifnull(a.details, '') as Details,

        ifnull(a.statId, 0) as StatId,

        ifnull(a.createdById, 0) as CreatedById,

        concat(b.lastname, ', ', b.firstname) as CreatedByName,

        ifnull(a.createdOn, null) as CreatedOn,

        ifnull(a.modifiedById, 0) as ModifiedById,

        concat(c.lastname, ', ', c.firstname) as ModifiedByName,

        ifnull(a.modifiedOn, null) as modifiedOn

    from sections a

        left join users b on a.createdById = b.userId

        left join users c on a.modifiedById = c.userId

    where (a.sectionId = intId or intId = 0)

    and (a.title like concat('%', strTitle, '%') or strTitle = '')

    and a.statId = 1

    order by a.title;

end */$$
DELIMITER ;

/* Procedure structure for procedure `GetStudents` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetStudents` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudents`(
    in intId int,
    in strLrn varchar(100),
    in strLastName varchar(100),
    in strFirstName varchar(100),
    in strMiddleName varchar(100),
    in strSectionName varchar(100),
    in strGradeName varchar(100),
    in strCurrentSectionName varchar(100)
)
begin
    select
        ifnull(a.studentId, 0) as StudentId,
        ifnull(a.lrn, '') as Lrn,
        ifnull(a.lastName, '') as LastName,
        ifnull(a.firstName, '') as FirstName,
        ifnull(a.middleName, '') as MiddleName,
        ifnull(a.gradeAndSectionId, 0) as GradeAndSectionId,
        ifnull(a.currentSectionName, 0) as CurrentSectionName,
        ifnull(b.sectionId, 0) as SectionId,
        ifnull(c.title, '') as SectionName,
        ifnull(b.gradeId, 0) as GradeId,
        ifnull(d.title, '') as GradeName,
        ifnull(a.schoolYearId, 0) as SchoolYearId,
        ifnull(e.title, '') as SchoolYearName
    from students a
        left join gradeandsections b on a.gradeAndSectionId = b.gradeAndSectionId
        left join sections c on b.sectionId = c.sectionId
        left join grades d on b.gradeId = d.gradeId
        left join schoolyears e on a.schoolYearId = e.schoolYearId
    where (a.studentId = intId or intId = 0)
    and (a.lrn like concat('%', strLrn, '%') or strLrn = '')
    and (a.lastName like concat('%', strLastName, '%') or strLastName = '')
    and (a.firstName like concat('%', strFirstName, '%') or strFirstName = '')
    and (a.middleName like concat('%', strMiddleName, '%') or strMiddleName = '')
    and (b.title like concat('%', strCurrentSectionName, '%') or strCurrentSectionName = '')
    and (c.title like concat('%', strSectionName, '%') or strSectionName = '')
    and (d.title like concat('%', strGradeName, '%') or strGradeName)
    and a.statId = 1;
end */$$
DELIMITER ;

/* Procedure structure for procedure `GetVoterClearances` */

/*!50003 DROP PROCEDURE IF EXISTS  `GetVoterClearances` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVoterClearances`(
    in intPositionId int,
    in strPosition varchar(100),
    in intGradeId int,
    in strGrade varchar(100)
)
begin
    select
        ifnull(a.voterClearanceId, 0) AS VoterClearanceId,
        ifnull(a.positionId, 0) AS PositionId,
        ifnull(b.title, '') AS PositionName,
        ifnull(a.gradeId, 0) AS GradeId,
        ifnull(c.title, '') AS GradeName,
        ifnull(a.Active, 0) AS Active
    from voterClearances a
        left join positions b on a.positionId = b.positionId
        left join grades c on a.gradeId = c.gradeId
    where (a.positionId = intPositionId or intPositionId = 0)    
    and (b.title like concat('%', strPosition, '%') or strPosition = '')
    and b.statId = 1
    and (a.gradeId = intGradeId or intGradeId = 0)
    and (c.title like concat('%', strGrade, '%') or strGrade = '')
    and c.statId = 1;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
