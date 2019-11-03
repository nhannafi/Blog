-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 03 nov. 2019 à 22:51
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`Id`, `FirstName`, `LastName`) VALUES
(1, 'John', 'DOE'),
(2, 'Guillaume ', 'MUSSO'),
(3, 'Michel ', 'BUSSI'),
(4, 'Marc ', 'LEVY'),
(7, 'Françoise ', 'BOURDIN'),
(8, 'Laurent ', 'GOUNELLE'),
(9, 'Gilles ', 'LEGARDINIER'),
(10, 'Maxime ', 'CHATTAM'),
(11, 'David ', 'FOENKINOS');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`Id`, `Name`) VALUES
(8, 'art'),
(5, 'cinéma'),
(13, 'économie'),
(12, 'géographie'),
(7, 'histoire'),
(4, 'informatique/IT'),
(2, 'Jeux-Vidéos'),
(10, 'politique'),
(9, 'romance'),
(11, 'sciences de la vie'),
(6, 'sciences fiction'),
(3, 'sport'),
(1, 'Voyages');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NickName` varchar(30) DEFAULT NULL,
  `Contents` text NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `Post_Id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CreationTimestamp` (`CreationTimestamp`),
  KEY `Post_Id` (`Post_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`Id`, `NickName`, `Contents`, `CreationTimestamp`, `Post_Id`) VALUES
(4, 'Maximo', 'Bel enthousiasme startupéen qu\'il conviendrait de modérer un peu d\'expérience...\r\n\r\nÀ New York, lors d’un banquet, le 25 septembre 1880, le célèbre journaliste John Swinton se fâche quand on propose de boire un toast à la liberté de la presse :\r\n« Il n’existe pas, à ce jour, en Amérique, de presse libre et indépendante. Vous le savez aussi bien que moi. Pas un seul parmi vous n’ose écrire ses opinions honnêtes et vous savez très bien que si vous le faites, elles ne seront pas publiées. On me payeun salaire pour que je ne publie pas mes opinions et nous savons tous que si nous nous aventurions à le faire, nous nous retrouverions à la rue illico. Le travail du journaliste est la destruction de la vérité,le mensonge patent, la perversion des faits et la manipulation de l’opinion au service des Puissances de l’Argent. Nous sommes les outils obéissants des Puissants et des Riches qui tirent les ficelles dans les coulisses. Nos talents, nos facultés et nos vies appartiennent à ces hommes.\r\nNous sommes des prostituées de l’intellect. Tout cela, vous le savez aussi bien que moi !', '2019-11-03 22:18:46', 2),
(5, 'Donnato', 'Cette application donnera-t-elle accès à tous les médias alternatifs qui démasquent toutes les intox des médias mainstream ?', '2019-11-03 22:19:26', 2);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Contents` text NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `Author_Id` tinyint(3) UNSIGNED DEFAULT NULL,
  `Category_Id` tinyint(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Title` (`Title`),
  KEY `CreationTimestamp` (`CreationTimestamp`),
  KEY `Author_Id` (`Author_Id`),
  KEY `Category_Id` (`Category_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`Id`, `Title`, `Contents`, `CreationTimestamp`, `Author_Id`, `Category_Id`) VALUES
(2, '\"Il fallait un Spotify pour les articles de presse\"', 'Cette semaine s\'est lancé un nouvel acteur dans le monde de la presse. Pressmium, une start-up française née dans la Station F à Paris, propose une appli d\'abonnement unique à des dizaines de médias. Entretien avec Aloïs Bazin de Jessey, l\'un de ses deux fondateurs.\r\nAprès Deezer et Spotify pour la musique, Netflix pour les séries, Pressmium pour la presse ? C\'est l\'objectif ambitieux que s\'est donné une jeune start-up française en lançant cette semaine son site Internet et son application. Pressmium réunit à ce jour une quarantaine de titres de presse français - dont Marianne, l\'Opinion ou encore l\'Equipe - mais aussi quelques étrangers, comme le quotidien britannique The Guardian. Sur le principe des plateformes d\'abonnement à la musique et à la vidéo en illimité, Pressmium permet pour 12,90 euros par mois d\'accéder à tous leurs contenus payants, sans publicité en format de lecture web, sur une seule plateforme et son appli, disponible sur Apple Store et Google Play. Rencontre avec Aloïs Bazin de Jessey, cofondateur et CEO de la start-up.\r\n\r\nMarianne : D\'où est venue l\'idée de Pressmium ?\r\n\r\nAloïs Bazin de Jessey : C\'était il y a un peu plus d\'un an. Je suis un grand fan de foot et j\'aime consulter les débriefs de matchs sur le site de L\'Equipe. Sauf que pour passer le \"paywall\" du journal et lire les articles dans leur intégralité, je devais m\'y abonner. Mon problème n\'était pas que je ne voulais pas payer mais que je ne voyais pas pourquoi m\'abonner uniquement à L\'Equipe, au lieu de Challenges pour l\'économie ou d\'un autre média. J\'avais besoin d\'une solution unique et simple où retrouver toute la presse que je veux lire, sans avoir à choisir tel ou tel abonnement. En gros, il me fallait l\'équivalent d\'un Spotify pour les articles de presse. Avec un ami d\'enfance, Walid Ghanem, nous avons donc décidé de nous lancer dans l\'aventure. Cela a bien fonctionné car nous avons des profils très complémentaires : j\'ai fait une école de commerce, il a fait polytechnique.\r\n\r\nEn quoi Pressmium est-il différent d\'autres agrégateurs d\'articles, comme Apple News ou Google News ?\r\n\r\nPressmium n\'est justement pas un agrégateur. A l\'inverse des deux exemples que vous citez, notre site et notre appli permettent au lecteur d\'accéder directement aux articles qu\'il souhaite lire, sans être redirigé vers les différents sites des différents médias. Nous apportons aussi un panel de services. Nous recommandons des articles, nous permettons au lecteur de personnaliser ce qu\'il souhaite lire… L\'idée est d\'offrir un maximum de services personnalisés pour proposer un outil de presse en accord avec la manière dont on consomme aujourd\'hui les médias, que ce soit la musique sur Spotify ou les séries et films sur Netflix. Sur Pressmium, fini les paywall, 80% de nos partenaires nous donnent accès à l\'ensemble de leurs contenus payants. Ce que ni Google, ni Apple n\'offrent aujourd\'hui.\r\n\r\nNous travaillons main dans la main avec les médias et nous rémunérons la lecture de leurs contenus sur Pressmium, contrairement à Apple et Google\"\r\n\r\nComment êtes-vous parvenus à convaincre les éditeurs de presse de publier leurs contenus sur Pressmium ?\r\n\r\nNous les avons rencontrés et impliqués dès le début de cette aventure. Nous avons notamment présenté notre projet à l\'Alliance de la presse d\'information générale, l\'entité composée des syndicats professionnels de la presse. Aujourd\'hui, la presse a du mal à engranger des abonnés car son secteur n\'a pas été accompagné par une technologie innovante. Pendant longtemps, on a cru que fournir du bon contenu, des articles de presse en l\'occurrence, serait suffisant pour attirer les lecteurs. C\'est primordial mais en plus du contenu, il faut du service et une technologie. Les éditeurs en sont conscients, nous travaillons main dans la main avec eux et nous rémunérons la lecture de leurs contenus sur Pressmium, contrairement à Apple et Google.\r\n\r\nDepuis une vingtaine d\'années, le journalisme a été bouleversé par l\'arrivée d\'Internet, puis des géants du numérique, les Gafam. Y-a-t-il aujourd\'hui la place pour faire émerger un acteur européen de la presse ?\r\n\r\nMon co-cofondateur et moi-même sommes persuadés que la France a les capacités techniques pour développer un géant de l\'information. Google a créé en 2013 un fonds d\'innovation pour la presse. On sait qu\'il veut aller plus loin. Apple cherche également à investir plus sérieusement dans le secteur. Nous n\'en sommes encore, en réalité, qu\'aux balbutiements de ce changement technologique, il y a beaucoup à faire. Dans cette conversation, nous voulons faire émerger un acteur européen responsable, qui ne travaille pas aux dépens des médias en bradant leurs contenus, et respecte également la vie privée de ses utilisateurs en n\'exploitant pas leurs données.', '2019-11-01 10:00:00', 1, 2),
(4, 'Droits voisins : « Quelle liberté la presse peut-elle avoir si elle est dépendante d’un acteur privé ? »', 'C’est un bras de fer entre Google et les éditeurs de presse. La loi qui transpose dans le droit français la directive européenne sur le droit d’auteur sera appliquée à partir de ce jeudi. Elle instaure un « droit voisin » et oblige notamment les plateformes et les aggrégateurs d’information, en particulier Google News, à rémunérer les éditeurs de presse, dont 20 Minutes, pour l’utilisation de leur contenu (le texte d’un article, par exemple).\r\n\r\nPour éviter d’avoir à s’y plier, Google a présenté fin septembre de nouvelles règles pour les éditeurs de presse basés en Europe. Ceux-ci doivent décider si, en France, des « snippets », soit des extraits de leur production (comportant par exemple le titre, le chapô et le début du texte de l’article), et des aperçus des photos et vidéos, continueront d’être affichés à côté des liens renvoyant vers leurs sites dans Google Actualités et dans les résultats du moteur de recherche.\r\n\r\nPour conserver l’affichage de ces extraits, les éditeurs devront accepter de ne pas être rémunérés par Google et céder leurs droits voisins à l’entreprise gratuitement. S’ils refusent, les extraits et les vignettes ne seront plus affichés dans les résultats du moteur de recherche. Dans ce cas, les résultats incluront un titre et un lien « sec » vers le site de l’éditeur concerné, qui risque donc de voir le trafic vers ses sites diminuer.\r\n\r\nDans une tribune publiée ce mercredi dont 20 Minutes est signataire, des journalistes et des personnalités européennes des médias et de la culture ont dénoncé la stratégie du géant du Net, l’accusant de contourner la législation sur le droit voisin. Me Zoé Vilain, avocate associée du cabinet 1862 Avocats, spécialiste en technologies de l’information, explique que le contournement de la loi par Google était inévitable.\r\n\r\nA quoi correspondent ces fameux « droits voisins » au cœur du bras de fer avec Google ?\r\nOn parle ici de droits voisins du droit d’auteur. A l’origine, il s’agit d’une particularité du droit français, au profit des artistes-interprètes et des producteurs de musique et d’audiovisuel. L’idée était de donner une rémunération à des gens qui ne sont pas auteurs d’une œuvre mais qui en ont apporté une interprétation. Les droits voisins ont ensuite été étendus aux producteurs de bases de données. Face à l’importance d’Internet et surtout des GAFA (Google, Apple, Facebook, Amazon), la question s’est également posée de rémunérer les éditeurs de presse, qui publient les articles écrits par les journalistes.\r\n\r\nQui est concerné par ces nouveaux « droits voisins » ?\r\nLa directive européenne et la loi du 24 juillet 2019 visent à créer un droit de licence et de rémunération pour les éditeurs de presse, quand leurs contenus sont utilisés ailleurs. Ce droit entre en jeu à partir du moment où l’on republie un article. Il concerne tout le monde : si quelqu’un qui tient un blog y reproduit demain un article, il est soumis à cette loi.\r\n\r\nIl y a deux exceptions : le fait de copier un lien, et la citation courte d’extraits d’un article. En ce qui concerne cette exception, la loi ne précise pas de règles strictes sur le format, ce sera fixé par la jurisprudence. Mais il faudra sans doute prendre en compte la taille de l’article que l’on cite : si on reproduit un paragraphe qui représente 50 % de l’article, c’est plus qu’un court extrait.\r\n\r\nEst-il surprenant que Google ait contourné la loi ?\r\nNon, une directive comme celle-là est très simple à contourner. Sa transposition dans la loi française dit qu’il faut rémunérer si on cite l’article : il est évident que Google peut dire « ok, on coupe tout, on arrête de vous citer ». Google est dans une situation de domination, rien ne l’oblige à citer des articles dans Google News. Google a donc proposé aux médias de signer une licence de droit qui dit que les éditeurs de presse lui cèdent leurs droits voisins gratuitement. L’entreprise reste ainsi dans le cadre légal.\r\n\r\nUne solution aurait été que l’article 11 de la directive sur le droit d’auteur interdise les licences à titre gratuit comme celle que Google fait signer aux éditeurs de presse. Mais cette directive touche d’autres plateformes, et une telle mesure serait compliquée pour les petits acteurs du net.\r\n\r\nQue peuvent faire les éditeurs de presse face à Google ?\r\nIl y aurait peut-être des questions à poser au niveau du droit de la concurrence. Je pense qu’une action possible serait d’indiquer que Google profite de sa situation de monopole, si celle-ci est avérée, pour imposer ses propres exemples [l’Autorité de la concurrence a ouvert une enquête exploratoire début octobre pour savoir si la pratique de Google peut être constituée comme anticoncurrentielle].\r\n\r\nIl est normal que les éditeurs de presse demandent des revenus en plus. Mais j’imagine que la baisse de leurs revenus serait conséquente s’ils perdaient le trafic venant de Google News. La seule solution pour eux, c’est le regroupement : tous les éditeurs doivent se mettre d’accord pour dire non à Google. Mais je ne vois pas comment c’est possible. D’autant que Google a déjà prouvé qu’il pouvait fermer Google News dans un pays, comme il l’a fait en Espagne [en 2014 face à une loi similaire].\r\n\r\nLes autres entreprises des GAFA n’ont pas encore réagi à la loi française sur les droits voisins…\r\nFacebook est moins concerné par cette loi car il n’a pas d’endroits éditorialisés, ce sont les utilisateurs qui diffusent les articles. On pourrait demander à Facebook de payer une licence pour tous ses utilisateurs, mais l’entreprise pourrait alors répondre « je ne suis qu’hébergeur » – même si ça va à l’encontre d’autres déclarations. Par contre, la plateforme Apple News est concernée par la même règle sur les droits voisins.\r\n\r\nCette affaire met en avant la difficulté à contrôler les GAFA. Ne pose-t-elle pas également des questions sur la liberté de la presse ?\r\nJe pense que la question de la liberté de la presse est peut-être l’angle le plus important de cette affaire. Quelle liberté la presse peut-elle avoir si elle est dépendante d’un acteur privé ? Ici, il n’y a pas eu de favoritisme, Google allait supprimer les « snippets » pour tous les médias qui ne cédaient pas leurs droits. Mais il aurait pu décider de privilégier un média sur un autre. Il est dommage que cette question n’ait pas été prise en compte il y a deux ans, lors des débats sur la directive.\r\n\r\nIl risque de se passer la même chose avec l’article 13 de la directive européenne [qui rend les plateformes d’hébergement en ligne comme YouTube responsable du respect des droits d’auteur dans les contenus qu’elles hébergent] : YouTube a déjà des accords avec Warner, Universal, etc. Les « petits » ayants droit qui ont besoin de YouTube pour diffuser leur contenu seront dans le même cas que les éditeurs de presse aujourd’hui.\r\n\r\nPeut-on encore penser Internet sans les GAFAM ?\r\nLe problème, c’est que les GAFAM sont des incontournables. Et nos lois leur donnent plus de pouvoirs. On essaye de taxer ces entreprises, et en même temps on leur donne toujours plus de responsabilités, par exemple en les rendant responsables des contenus haineux sur Internet.', '2019-11-03 22:30:09', 4, 4),
(5, 'Marges dans la grande distribution : dans le secret de la fabrique des prix', 'Le Parisien-Aujourd’hui en France a récupéré la liste des marges appliquées par une enseigne sur tous ses produits. Ce document permet de comprendre pourquoi vous payez certains articles plus ou moins cher.\r\nC\'est un peu la boîte noire de la grande distribution. Dans ce document rare que Le Parisien – Aujourd\'hui en France s\'est procuré, nous découvrons l\'envers du décor d\'une enseigne, ses secrets les plus intimes qu\'elle se garde bien de dévoiler à ses clients. Il s\'agit de la liste des 10 000 références vendues dans les magasins Franprix, pour lesquelles tous les prix et les marges appliquées sont détaillés, depuis l\'achat au producteur ou à l\'industriel jusqu\'au client.\r\n\r\nCe fichier interne à la direction a été envoyé par erreur à de nombreux franchisés de Franprix. Il est d\'ailleurs utilisé en justice par l\'un d\'entre eux, actuellement en conflit avec le groupe Casino ( lire ci-dessous ). Sollicitée, l\'enseigne nous précise qu\'il s\'agit là « d\'un document de travail » à destination de ses cadres, qui livre des « moyennes plus que des données réelles et aide à faire des arbitrages ». Au-delà de ces précautions d\'usage, ce document, qui date de 2017, offre néanmoins une occasion unique de découvrir les secrets de la fixation des prix en magasin.', '2019-11-03 22:44:45', 11, 13),
(6, 'L\'interdiction de la publicité politique sur Twitter: Une nouvelle mesure pour censurer l\'Internet', 'Mercredi, Jack Dorsey, PDG de Twitter, a annoncé que son entreprise interdirait toute publicité politique sur sa plate-forme. La publicité, a dit Mme Dorsey, «comporte des risques importants pour la politique, où elle peut être utilisée pour influencer les votes et affecter la vie de millions de personnes.»\r\n\r\nCette annonce intervient au milieu d\'une campagne de plus en plus agressive des services de renseignements américains, des démocrates du Congrès et des médias pour imposer la censure, sous couvert de «vérification des faits».\r\n\r\nL\'action de Twitter est politiquement réactionnaire, avec des conséquences profondes. Elle transforme une société privée, soumise à d\'innombrables pressions politiques et économiques, en arbitre de ce qui peut ou non être écrit et rendu public.\r\n\r\nTwitter et Facebook ont acquis une audience de masse en facilitant la libre circulation de l\'information. Mais ayant obtenu cet audience, ils utilisent leur pouvoir pour exercer la censure au nom du gouvernement.\r\n\r\nL\'action de Dorsey a été opposée favorablement dans les médias à la position du PDG de Facebook, Mark Zuckerberg, qui s\'est publiquement opposé aux appels lancés aux entreprises de médias sociaux pour qu\'elles interdisent ou «vérifient les faits» de la publicité politique.\r\n\r\n«Je ne pense pas qu\'il soit juste dans une démocratie pour une entreprise privée de censurer les politiciens ou les informations», a déclaré Zuckerberg dans un discours prononcé le mois dernier à l\'université de Georgetown. «L\'interdiction des publicités politiques favorise les sortants et tous ceux que les médias choisissent de couvrir.»\r\n\r\nZuckerberg n\'est guère un modèle pour la défense des droits démocratiques. Mais là, il s\'avère qu\'il a raison. En réponse à ces déclarations, le congrès l\'a soumis à un interrogatoire serré beaucoup plus sévère que celui de Dennis Muilenburg, PDG de Boeing, dont l\'entreprise est responsable de la mort de 400 personnes dans des accidents impliquant l\'avion 737 Max 8.\r\n\r\nSes déclarations ont également suscité une vague de dénonciations dans le New York Times, le Washington Post et les chaînes de télévision, qui mènent depuis des années une campagne de censure d\'Internet.\r\n\r\nL\'argument est construit à l\'aide d\'une technique bien usée. Divers exemples de fausses informations ou de mensonges potentiels sont cités, notamment par Donald Trump, comme une menace dangereuse. Ceci est alors utilisé pour justifier la censure totale du discours politique, qui sera inévitablement dirigée en premier lieu contre la gauche.\r\n\r\nUne méthode similaire a été utilisée après les attentats terroristes du 11 septembre 2001. Dans le livre The Lesser Evil (Le moindre mal), publié en 2004, Michael Ignatieff déclarait qu\' «une urgence terroriste» peut «exiger que nous prenions des mesures pour défendre la démocratie qui s\'écarteraient des engagements fondamentaux de la démocratie pour la dignité.»\r\n\r\nQue devrait faire le gouvernement, selon lui, s\'il capturait un terroriste qui possédait des renseignements essentiels au sujet d\'un attentat imminent? Toutes les méthodes, y compris la torture, ne seraient-elles pas nécessaires pour obtenir les connaissances nécessaires pour «sauver des vies»? Qu\'est-ce qui n\'est pas permis afin d\'arrêter le «nuage atomique»? Les implications de ces arguments ont été réalisées dans les cachots d\'Abu Ghraib et de Guantanamo Bay.\r\n\r\nAujourd\'hui, le même prétexte est concocté: une prétendue menace imminente pour la démocratie - des «fausses nouvelles» - est utilisée pour justifier les attaques les plus radicales contre les droits démocratiques.\r\n\r\nCe qui est frappant, plus encore que sous l\'administration Bush, c\'est combien les couches «libérales» et supérieures de la classe moyenne dans et autour du Parti démocrate ont été recrutées dans cette campagne.\r\n\r\nDans une chronique publiée hier par le New York Times, le scénariste Aaron Sorkin - qui devrait être plus avisé - a écrit que «les mensonges fous pompés dans les réseaux» altèrent «les décisions les plus importantes que nous prenons ensemble». Ces mensonges «ont un effet très réel et incroyablement dangereux sur nos élections, notre vie et celle de nos enfants.»\r\n\r\nAlexandria Ocasio-Cortez, nouvelle membre du Congrès et appartenant aux Democratic Socialists of America, a exigé au début du mois que Facebook «démolisse les mensonges». Ses arguments irréfléchis et ignorants, qui ne démontrent que son absence totale de conscience démocratique, sont utilisés pour légitimer une campagne de censure.\r\n\r\nL\'hypothèse sous-jacente est que la détermination de ce qu\'est la vérité et de ce qu\'est un «mensonge fou» est un processus purement objectif, sans rapport avec les intérêts de classe ou sociaux. En fait, la politique bourgeoise, de par sa nature même, est construite sur des mensonges qui servent, comme l\'a expliqué Léon Trotsky, à couvrir les contradictions profondes de la société capitaliste.\r\n\r\nQui doit avoir l\'autorité de décider ce qu\'est la vérité? Des entreprises géantes ayant des liens intimes avec l\'État, comme Google, Facebook et Twitter? Ou des publications comme le New York Times et le Washington Post, qui servent de porte-parole aux agences de renseignement? Ou est-ce que ce seront les agences de renseignement elles-mêmes?\r\n\r\nBill Keller, l\'ancien rédacteur en chef du New York Times, a un jour averti que Internet avait sapé le rôle des «gardiens», c\'est-à-dire des institutions qui vérifient l\'information à laquelle le public a accès.\r\n\r\nCes «gardiens» auto-déclarés ne sont en fait pas politiquement neutres. Selon le New York Times, par exemple, quiconque remet en question les circonstances de la mort de Jeffrey Epstein est engagé dans des «théories de complot» infondées. Ceux qui s\'opposent à tout le discours anti-russe des agences de renseignement - qui ont été utilisées pour justifier la censure d\'Internet - propagent de «fausses nouvelles».\r\n\r\nLes implications de ce type d\'arguments sont peut-être les plus grossièrement révélées par le chroniqueur du New York Times Thomas Friedman.\r\n\r\nÀ la déclaration de Zuckerberg selon laquelle «les gens devraient pouvoir voir par eux-mêmes», ce que disent les politiciens, Friedman déclare: «Ben oui, comme si les citoyens moyens étaient capables de discerner la véracité de chaque publicité politique après avoir été conditionnés par un journalisme responsable pendant des années pour présumer que les affirmations ne sont pas simplement inventées.»\r\n\r\n«Des années de journalisme responsable!» Friedman prend ses lecteurs pour des imbéciles. Il y a seize ans, Friedman a servi de propagandiste pour la guerre de l\'administration Bush en Irak, faisant la promotion des mensonges de la Maison-Blanche sur les «armes de destruction massive» tout en déclarant qu\'il n\'avait «aucun problème avec une guerre pour le pétrole».\r\n\r\nEn 2017, Friedman déclarait que «seul un imbécile ne soutiendrait pas» le prince héritier saoudien Mohammed bin Salman. Un peu plus d\'un an plus tard, bin Salman a personnellement ordonné que le collaborateur du Washington Post Jamal Khashoggi soit scié en morceaux dans une ambassade saoudienne.\r\n\r\nOn peut supposer que ceux qui ont attaqué Friedman pour son rôle dans la promotion des mensonges de l\'État auraient dû être censurés pour «avoir propagé des mensonges.»\r\n\r\nQuant à ceux qui devraient déterminer ce qui est vrai, Friedman écrit: «Les diplomates, les agents de renseignement et les fonctionnaires sont ceux qui font respecter les règlements - et qui fournissent les recherches et les faits indépendants - qui rendent notre gouvernement légitime.»\r\n\r\nC\'est-à-dire que la tâche du gouvernement, à travers ses «agents de renseignement», est de fournir les «faits» qui amènent les citoyens à croire que le gouvernement est légitime.\r\n\r\nQue faire des personnes qui ont exposé des «faits» qui, selon les «agents de renseignement», ne devraient pas être rendus publics? Ils vont finir, comme Julian Assange et Chelsea Manning, par languir en prison, et les publications qui diffusent leurs révélations doivent être bâillonnées.\r\n\r\nAppelons les choses par leur vrai nom. Ce n\'est que de la censure. Le New York Times vend des mensonges. Et le public en a assez, alors le journal veut les empêcher de pouvoir choisir.\r\n\r\nDepuis les élections de 2016, les services de renseignements américains préconisent la censure d\'Internet au nom de la lutte contre les «fausses nouvelles». La cible principale de cette campagne n\'a pas été Trump, mais plutôt les sites web et les organisations de gauche, anti-guerre et progressistes. En 2017, Google a annoncé qu\'il ferait la promotion de sources d\'information «faisant autorité» plutôt que de «points de vue alternatifs», ce qui entraînerait une baisse massive du trafic de recherche sur les sites de gauche. Facebook et Twitter ont emboîté le pas en supprimant les comptes de gauche et les pages qui comptent des millions d\'adeptes.\r\n\r\nSous la pression incessante des démocrates et des agences de renseignement, ces entreprises ne feront qu\'intensifier leur offensive contre les organisations de gauche, anti-guerre et socialistes.', '2019-11-03 22:46:14', 4, 10);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`Id`, `Username`, `Password`) VALUES
(1, 'rret', 'aqas'),
(2, '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan=', '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan='),
(3, '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan=', '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan='),
(4, '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan=', '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan='),
(5, '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan=', '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan='),
(6, '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan=', '<br /><font size=\'1\'><table class=\'xdebug-error xe-notice\' dir=\'ltr\' border=\'1\' cellspacing=\'0\' cellpadding=\'1\'><tr><th align=\'left\' bgcolor=\'#f57900\' colspan=');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`Post_Id`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`Author_Id`) REFERENCES `author` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Post_ibfk_2` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
