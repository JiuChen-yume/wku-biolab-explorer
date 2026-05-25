-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2026 at 12:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wku_biolab`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `image_url`) VALUES
(1, '/images/microscope.jpg'),
(2, '/images/dissecting.jpg'),
(3, '/images/balance.jpg'),
(4, '/images/pipette.jpg'),
(5, '/images/waterbath.jpg'),
(6, '/images/spectrophotometer.jpg'),
(7, '/images/centrifuge.jpg'),
(8, '/images/gelimaging.jpg'),
(9, '/images/electrophoresis.jpg'),
(10, '/images/incubator.jpg'),
(11, '/images/refrigerator.jpg'),
(12, '/images/microwave.jpg'),
(13, '/images/alcoholburner.jpg'),
(14, '/images/oilimmersion.jpg'),
(15, '/images/co2chamber.jpg'),
(16, '/images/warmingplate.jpg'),
(17, '/images/co2asphyxiation.jpg'),
(18, '/images/inverted_fluorescence.jpg'),
(19, '/images/microplate_reader1.jpg'),
(20, '/images/microplate_reader2.jpg'),
(21, '/images/gel_imaging_biorad.jpg'),
(22, '/images/inverted_fluorescence_nikon.jpg'),
(23, '/images/qpcr_roche.jpg'),
(24, '/images/qpcr_abi.jpg'),
(25, '/images/ultra_centrifuge.jpg'),
(26, '/images/infrared_imaging.jpg'),
(27, '/images/confocal_zeiss.jpg'),
(28, '/images/atomic_absorption.jpg'),
(29, '/images/hplc_waters.jpg'),
(30, '/images/nanoparticle_analyzer.jpg'),
(31, '/images/ftir.jpg'),
(32, '/images/uplc_agilent.jpg'),
(33, '/images/gc_thermo.jpg'),
(34, '/images/flow_cytometer.jpg'),
(35, '/images/cluster.jpg'),
(36, '/images/lcms_waters.jpg'),
(37, '/images/fplc_biorad.jpg'),
(38, '/images/uv_nir.jpg'),
(39, '/images/qpcr_quantstudio.jpg'),
(40, '/images/nmr_magritek.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_translations`
--

CREATE TABLE `equipment_translations` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `language_code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `purpose` text DEFAULT NULL,
  `usage_scenario` text DEFAULT NULL,
  `precautions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment_translations`
--

INSERT INTO `equipment_translations` (`id`, `equipment_id`, `language_code`, `name`, `purpose`, `usage_scenario`, `precautions`) VALUES
(1, 1, 'zh-CN', '鍏夊?鏄惧井闀?', '瑙傚療寰?皬鐗╀綋鍜岀粏鑳炵粨鏋?', '缁嗚優銆佺粍缁囥?佸井鐢熺墿瑙傚療', '閬垮厤闀滃ご姹℃煋锛屼娇鐢ㄤ笓鐢ㄦ摝闀滅焊锛屾补闀滅敤鍚庨渶娓呮磥'),
(2, 2, 'zh-CN', '瑙ｅ墫鏄惧井闀?', '瑙傚療杈冨ぇ鏍囨湰鐨勪笁缁寸粨鏋?', '瑙ｅ墫瀹為獙銆佹暣浣撹?瀵?', '杞绘嬁杞绘斁锛岄伩鍏嶇?鎾?'),
(3, 3, 'zh-CN', '鐢靛瓙澶╁钩', '绮剧‘绉伴噺璇曞墏璐ㄩ噺', '閰嶅埗婧舵恫銆佺О閲忚嵂鍝?', '涓嶅彲瓒呰浇锛岄伩鍏嶆恫浣撴磼钀斤紝浣跨敤鍚庢竻娲?'),
(4, 4, 'zh-CN', '绉绘恫鍣?', '绮剧‘閲忓彇寰?噺娑蹭綋', 'DNA/铔嬬櫧璐ㄥ疄楠屻?佹憾娑查厤鍒?', '涓嶅彲鍊掔疆锛岄伩鍏嶆恫浣撹繘鍏ユ灙浣擄紝瀹氭湡鏍″噯'),
(5, 5, 'zh-CN', '鎭掓俯姘存荡閿?', '缁存寔鎭掑畾娓╁害鍔犵儹娑蹭綋', '瑙ｅ喕璇曞墏銆佷繚娓╁弽搴?', '瀹氭湡鎹㈡按锛岄伩鍏嶅共鐑э紝娉ㄦ剰鐑?激'),
(6, 6, 'zh-CN', '鍒嗗厜鍏夊害璁?', '娴嬮噺婧舵恫鍚稿厜搴?', '娴撳害娴嬪畾銆侀叾娲绘?娴?', '姣旇壊鐨块渶娓呮磥锛岄伩鍏嶅埉浼ゅ厜瀛﹂潰'),
(7, 7, 'zh-CN', '绂诲績鏈?', '鍒╃敤绂诲績鍔涘垎绂绘牱鍝?', '娌夋穩缁嗚優銆佸垎绂讳笂娓呮恫', '蹇呴』骞宠　锛岀洊瀛愮洊绱э紝鍋滄?鍓嶅嬁鎵撳紑'),
(8, 8, 'zh-CN', '鍑濊兌鎴愬儚绯荤粺', '鎷嶆憚鍜屽垎鏋愬嚌鑳剁數娉崇粨鏋?', 'DNA/铔嬬櫧鍑濊兌鎷嶇収', '閬垮厤绱??鍏夌洿鎺ョ収灏勭溂鐫涳紝鎴撮槻鎶ら潰缃?'),
(9, 9, 'zh-CN', '鐢垫吵浠?', '鎻愪緵鐢靛満鍒嗙?DNA/铔嬬櫧璐?', 'DNA鐢垫吵銆佽泲鐧界數娉?', '娉ㄦ剰姝ｈ礋鏋侊紝閬垮厤瑙︾數锛岀紦鍐叉恫瑕嗙洊鍑濊兌'),
(10, 10, 'zh-CN', '鎭掓俯鍩瑰吇绠?', '鎭掓俯鍩瑰吇寰?敓鐗╂垨缁嗚優', '缁嗚弻鍩瑰吇銆佺粏鑳炲煿鍏?', '瀹氭湡娓呮磥锛岄伩鍏嶆薄鏌擄紝娉ㄦ剰鍕胯秴杞?'),
(11, 11, 'zh-CN', '鍐扮?', '浣庢俯淇濆瓨璇曞墏鍜屾牱鍝?', '閰躲?佹姉浣撱?佹牱鍝佷繚瀛?', '瀹氭湡闄ら湝锛屼笉鍚屾俯搴﹀垎鍖哄瓨鏀撅紝閬垮厤鍙嶅?鍐昏瀺'),
(12, 12, 'zh-CN', '寰?尝鐐?', '蹇??熷姞鐑?憾娑叉垨铻嶅寲鐞艰剛', '閰嶅埗鍩瑰吇鍩恒?佽瀺鍖栫惣鑴?', '涓嶅彲鍔犵儹瀵嗛棴瀹瑰櫒锛屽彇鍑烘椂闃茬儷浼?'),
(13, 13, 'zh-CN', '閰掔簿鐏?', '鎻愪緵鏄庣伀鍔犵儹鎴栫伃鑿?', '鎺ョ?鐜?伃鑿屻?佸姞鐑?', '鏄撶噧锛岃繙绂绘湁鏈烘憾鍓傦紝涓嶅彲鍚圭伃'),
(14, 14, 'zh-CN', '娌归暅', '100鍊嶆补闀滆?瀵熺粏鑿岀瓑寰?皬缁撴瀯', '缁嗚弻鏌撹壊瑙傚療', '娌归暅鐢ㄥ悗蹇呴』绔嬪嵆娓呮磥锛岄伩鍏嶅共娑?'),
(15, 15, 'zh-CN', 'CO鈧傞夯閱夌?', '瀵瑰疄楠屽姩鐗╄繘琛孋O鈧傚畨涔愭?', '鍔ㄧ墿澶勬?', '鎿嶄綔闇?缁忓姩鐗╀鸡鐞嗘壒鍑嗭紝閬垮厤鍔ㄧ墿鐥涜嫤'),
(16, 16, 'zh-CN', '鎭掓俯鍔犵儹鏉?', '缁存寔鎭掑畾娓╁害鍔犵儹琛ㄩ潰', '鍔ㄧ墿鎵嬫湳銆佽В鍐?', '閬垮厤鐑?激锛屽畾鏈熸竻娲?'),
(17, 17, 'zh-CN', '浜屾哀鍖栫⒊绐掓伅瑁呯疆', '瀵瑰疄楠屽姩鐗╄繘琛孋O鈧傜獟鎭??姝?', '鍔ㄧ墿澶勬?', '闇?缁忓姩鐗╀鸡鐞嗘壒鍑嗭紝鎿嶄綔瑙勮寖锛岄伩鍏嶅姩鐗╃棝鑻?'),
(18, 18, 'zh-CN', '涓?浣撳紡鍊掔疆鑽у厜鏄惧井闀?', '鑽у厜鏍囪?鏍锋湰瑙傚療涓庨珮鍒嗚鲸鐜囨垚鍍忥紝鏀?寔娲荤粏鑳為暱鏃堕棿鍔ㄦ?佺洃娴?', '缁嗚優鑽у厜鏍囪?瑙傚療銆佹椿缁嗚優鎴愬儚銆佺粍缁囧垏鐗囪崸鍏夊垎鏋?', '浣跨敤鍓嶉?鐑?紝閬垮厤寮哄厜闀挎椂闂寸収灏勬牱鍝佸?鑷磋崸鍏夋番鐏?紝闀滃ご淇濇寔娓呮磥'),
(19, 19, 'zh-CN', '澶氬姛鑳介叾鏍囦华', '寰?瓟鏉垮厜鍚告敹銆佽崸鍏夈?佸寲瀛﹀彂鍏夌瓑澶氱?妯″紡妫?娴?', 'ELISA瀹為獙銆佽泲鐧藉畾閲忋?佺粏鑳炴椿鍔涙?娴嬨?侀叾娲绘?ф祴瀹?', '浣跨敤鍓嶆牎鍑嗭紝閬垮厤姘旀场褰卞搷璇绘暟锛屼繚鎸佸厜璺?竻娲侊紝浣跨敤涓撶敤寰?瓟鏉?'),
(20, 20, 'zh-CN', '閰舵爣浠?', '寰?瓟鏉垮厜鍚告敹妫?娴嬶紝鏀?寔绱??-鍙??鍏夎寖鍥?', 'ELISA銆佽泲鐧芥祿搴︽祴瀹氥?佺粏鑳炲?娈栨?娴?', '浣跨敤鍓嶉?鐑?紝閬垮厤杈圭紭鏁堝簲锛屽姞鏍锋椂閬垮厤浜х敓姘旀场'),
(21, 21, 'zh-CN', '鍑濊兌鎴愬儚绯荤粺', '鍖栧?鍙戝厜銆佽崸鍏夊強姣旇壊娉曞嚌鑳舵垚鍍忎笌瀹氶噺鍒嗘瀽', 'Western Blot鎴愬儚銆丏NA/铔嬬櫧鍑濊兌鎴愬儚銆佹枒鐐规潅浜ゅ垎鏋?', '閬垮厤绱??鍏夌洿鎺ョ収灏勭溂鐫涳紝浣跨敤鍖栧?鍙戝厜璇曞墏鏃舵敞鎰忛伩鍏夛紝瀹氭湡鏍″噯'),
(22, 22, 'zh-CN', '鍊掔疆鑽у厜鏄惧井闀?', '娲荤粏鑳炶崸鍏夋垚鍍忋?佺浉宸??瀵燂紝閫傜敤浜庡煿鍏荤粏鑳炲疄鏃剁洃娴?', '缁嗚優鍩瑰吇瑙傚療銆佽浆鏌撴晥鐜囪瘎浼般?侀挋鎴愬儚瀹為獙', '鐗╅暅浣跨敤鍚庢竻娲侊紝閬垮厤鍩瑰吇鍩烘薄鏌撻暅澶达紝浣跨敤鍚庡叧闂?厜婧?'),
(23, 23, 'zh-CN', '瀹炴椂鑽у厜瀹氶噺PCR浠?', '瀹炴椂鐩戞祴PCR鎵╁?杩囩▼锛岃繘琛屽熀鍥犺〃杈惧畾閲忓垎鏋?', '鍩哄洜琛ㄨ揪妫?娴嬨?乵iRNA瀹氶噺銆佺梾鍘熶綋妫?娴嬨?丼NP鍒嗗瀷', '閬垮厤鏍搁吀姹℃煋锛屼娇鐢ㄤ笓鐢ㄨ?楁潗锛岃?缃?悎閫傚?鐓э紝瀹氭湡缁存姢'),
(24, 24, 'zh-CN', '鑽у厜瀹氶噺PCR绯荤粺', '楂橀?氶噺瀹炴椂鑽у厜瀹氶噺PCR锛屾敮鎸佸?閲嶈崸鍏夋?娴?', '鍩哄洜琛ㄨ揪鍒嗘瀽銆佹嫹璐濇暟鍙樺紓妫?娴嬨?佸井鐢熺墿瀹氶噺', '鍙嶅簲浣撶郴閰嶅埗闇?鍦ㄦ磥鍑?鍖猴紝閬垮厤浜ゅ弶姹℃煋锛屽畾鏈熸牎鍑嗘俯搴?'),
(25, 25, 'zh-CN', '瓒呴珮閫熷喎鍐荤?蹇冩満', '瓒呴珮閫熺?蹇冨垎绂讳簹缁嗚優缁撴瀯銆佺梾姣掗?绮掑強澶у垎瀛愬?鍚堢墿', '浜氱粏鑳炲櫒鍒嗙?銆佺梾姣掔函鍖栥?佸?娉屼綋鎻愬彇銆佽川绮掑ぇ閲忓埗澶?', '蹇呴』涓ユ牸閰嶅钩锛屼娇鐢ㄤ笓鐢ㄨ浆瀛愶紝涓嶅彲瓒呰繃杞?瓙鏈?澶ц浆閫燂紝绂诲績鍚庢?鏌ユ牱鍝?'),
(26, 26, 'zh-CN', '鍙岃壊绾㈠?婵?鍏夋垚鍍忕郴缁?', '鍙岄?氶亾绾㈠?婵?鍏夋?娴嬶紝瀹炵幇Western Blot绮剧‘瀹氶噺', '铔嬬櫧琛ㄨ揪瀹氶噺銆佺７閰稿寲铔嬬櫧妫?娴嬨?佽泲鐧借川鐩镐簰浣滅敤鍒嗘瀽', '浣跨敤涓撶敤鑶滃拰璇曞墏锛岄伩鍏嶄俊鍙烽ケ鍜岋紝瀹氭湡鏍″噯婵?鍏夊己搴?'),
(27, 27, 'zh-CN', '婵?鍏夊叡鑱氱劍鏄惧井闀?', '楂樺垎杈ㄧ巼涓夌淮鑽у厜鎴愬儚锛屾敮鎸佸厜瀛﹀垏鐗囧拰鍏卞畾浣嶅垎鏋?', '缁嗚優缁撴瀯瑙傚療銆佽崸鍏夊叡瀹氫綅銆佹椂闂村簭鍒楁垚鍍忋?丗RAP瀹為獙', '婵?鍏夐槻鎶わ紝閬垮厤鐩磋?婵?鍏夛紝浣跨敤鍚堥?傜墿闀滃拰鍙傛暟锛屽畾鏈熺淮鎶?'),
(28, 28, 'zh-CN', '鍘熷瓙鍚告敹鍏夎氨浠?', '閲戝睘鍏冪礌瀹氶噺鍒嗘瀽锛屾敮鎸佺伀鐒板拰鐭冲ⅷ鐐夋ā寮?', '閲嶉噾灞炴?娴嬨?佸井閲忓厓绱犳祴瀹氥?佺幆澧冩牱鍝佸垎鏋?', '浣跨敤绌哄績闃存瀬鐏?紝瀹氭湡鏍″噯鏇茬嚎锛屾牱鍝侀渶娑堣В澶勭悊锛屾敞鎰忛?氶?'),
(29, 29, 'zh-CN', '楂樻晥娑茬浉鑹茶氨浠?', '鍖栧悎鐗╁垎绂汇?佸畾鎬у拰瀹氶噺鍒嗘瀽', '鑽?墿鍒嗘瀽銆佷唬璋㈢墿妫?娴嬨?佸ぉ鐒朵骇鐗╁垎绂汇?佽川閲忔?娴?', '浣跨敤鍓嶆帓姘旓紝娴佸姩鐩搁渶杩囨护鑴辨皵锛屽畾鏈熺淮鎶よ壊璋辨煴锛屼娇鐢ㄥ悗鍐叉礂绯荤粺'),
(30, 30, 'zh-CN', '绾崇背绮掑害鍒嗘瀽浠?', '鍔ㄦ?佸厜鏁ｅ皠娉曟祴閲忕撼绫抽?绮掔矑寰勩?乑eta鐢典綅', '绾崇背鏉愭枡琛ㄥ緛銆佽泲鐧借川鑱氶泦鍒嗘瀽銆佽剛璐ㄤ綋绮掑緞娴嬪畾', '鏍峰搧闇?杩囨护闄ゅ皹锛岄伩鍏嶆皵娉★紝娴嬮噺鍓嶅钩琛℃俯搴︼紝娓呮磥姣旇壊鐨?'),
(31, 31, 'zh-CN', '鍚屾?鐑?垎鏋?-绾㈠?鍏夎氨鑱旂敤浠?', '鐑?噸鍒嗘瀽鍜屽樊绀烘壂鎻忛噺鐑?笌绾㈠?鍏夎氨鑱旂敤锛屽垎鏋愮儹鍒嗚В浜х墿', '鏉愭枡鐑?ǔ瀹氭?у垎鏋愩?佸垎瑙ｆ満鐞嗙爺绌躲?佺粍鍒嗛壌瀹?', '鏍峰搧闇?骞茬嚗锛屾皵浣撴祦閫熺ǔ瀹氾紝瀹氭湡鏍″噯娓╁害鍜岀孩澶栧厜璋?'),
(32, 32, 'zh-CN', '瓒呴珮鏁堟恫鐩歌壊璋变华', '瓒呴珮鍘嬪揩閫熼珮鏁堝垎绂伙紝鎻愰珮鍒嗚鲸鐜囧拰鐏垫晱搴?', '澶嶆潅鏍峰搧鍒嗘瀽銆佷唬璋㈢粍瀛︺?佽嵂鐗╂潅璐ㄦ?娴?', '浣跨敤UPLC涓撶敤鑹茶氨鏌憋紝鏍峰搧闇?杩囨护锛屾帶鍒舵煴娓╋紝瀹氭湡缁存姢'),
(33, 33, 'zh-CN', '姘旂浉鑹茶氨浠?', '鎸ュ彂鎬у寲鍚堢墿鍒嗙?鍒嗘瀽', '鎸ュ彂鎬ф湁鏈虹墿鐨勬祴瀹氥?佹畫鐣欐憾鍓傛?娴嬨?佽剛鑲?吀鍒嗘瀽', '浣跨敤鍓嶆?婕忥紝杞芥皵绾?害闇?杈炬爣锛岀▼搴忓崌娓╅渶浼樺寲锛屽畾鏈熻?佸寲鑹茶氨鏌?'),
(34, 34, 'zh-CN', '娴佸紡缁嗚優浠?', '缁嗚優澶氬弬鏁板垎鏋愶紝鍖呮嫭缁嗚優琛ㄥ瀷銆佺粏鑳炲懆鏈熴?佸噵浜℃?娴?', '鍏嶇柅缁嗚優鍒嗘瀽銆佸共缁嗚優閴村畾銆佺粏鑳炲懆鏈熸?娴嬨?佺粏鑳炲噵浜℃祴瀹?', '鏍峰搧闇?杩囨护涓哄崟缁嗚優鎮?恫锛岄伩鍏変繚瀛樻煋鑹叉牱鏈?紝姣忓ぉ娓呮礂绠¤矾'),
(35, 35, 'zh-CN', '璁＄畻鏈洪泦缇?', '澶ц?妯℃暟鎹??绠楀拰瀛樺偍锛屾敮鎸佺敓鐗╀俊鎭??鍒嗘瀽', '鍩哄洜缁勭粍瑁呫?佽浆褰曠粍鍒嗘瀽銆佽泲鐧借川缁撴瀯棰勬祴銆佸垎瀛愬姩鍔涘?妯℃嫙', '鍚堢悊鍒嗛厤璁＄畻璧勬簮锛屽畾鏈熷?浠芥暟鎹?紝娉ㄦ剰鏁ｇ儹鍜岀數鍔涚?鐞?'),
(36, 36, 'zh-CN', '瓒呴珮鏁堟恫鐩歌壊璋?-璐ㄨ氨鑱旂敤浠?', '楂樼伒鏁忓害鍖栧悎鐗╁垎绂讳笌閴村畾锛屾敮鎸佸畾鎬у拰瀹氶噺鍒嗘瀽', '浠ｈ阿缁勫?銆佽泲鐧借川缁勫?銆佽嵂鐗╀唬璋㈠姩鍔涘?鍒嗘瀽銆佹畫鐣欐?娴?', '浣跨敤楂樼函搴︽憾鍓傦紝淇濇寔璐ㄨ氨鐪熺┖搴︼紝瀹氭湡鏍″噯璐ㄩ噺杞达紝閬垮厤鐩愬垎杩涘叆'),
(37, 37, 'zh-CN', '铔嬬櫧绾?寲绯荤粺', '鑷?姩鍖栫殑铔嬬櫧璐ㄥ垎绂荤函鍖栵紝鏀?寔澶氭尝闀挎?娴嬪拰姊?害娲楄劚', '閲嶇粍铔嬬櫧绾?寲銆佹姉浣撶函鍖栥?侀叾鍒嗙?銆佷翰鍜屽眰鏋?', '浣跨敤鍓嶅钩琛℃煴瀛愶紝閬垮厤姘旀场杩涘叆绯荤粺锛屾牱鍝侀渶杩囨护锛屼娇鐢ㄥ悗娓呮礂灞傛瀽鏌?'),
(38, 38, 'zh-CN', '绱??鍙??鍏夎繎绾㈠?鍏夎氨浠?', '瀹芥尝闀胯寖鍥村厜璋辨壂鎻忥紝鐢ㄤ簬鏉愭枡鍏夊?鎬ц兘鍒嗘瀽', '甯﹂殭娴嬪畾銆佽杽鑶滈?忓皠/鍙嶅皠娴嬭瘯銆佸厜瀛﹀父鏁板垎鏋?', '浣跨敤鍓嶉?鐑?紝绌虹櫧鏍℃?锛岄伩鍏嶆牱鍝佽繃娴擄紝淇濇寔鍏夎矾娓呮磥'),
(39, 39, 'zh-CN', '楂橀?氶噺鑽у厜瀹氶噺PCR', '楂橀?氶噺瀹炴椂鑽у厜瀹氶噺PCR锛屾敮鎸?96瀛斿拰384瀛旀澘', '澶ц?妯″熀鍥犺〃杈剧瓫閫夈?乵iRNA琛ㄨ揪璋卞垎鏋愩?佺梾鍘熶綋楂橀?氶噺妫?娴?', '閬垮厤姹℃煋锛屼娇鐢ㄨ嚜鍔ㄥ寲鍔犳牱绯荤粺锛岃?缃??涓??瀛旓紝瀹氭湡鏍″噯'),
(40, 40, 'zh-CN', '鍙板紡鏍哥?鍏辨尟娉㈣氨浠?', '鍒嗗瓙缁撴瀯瑙ｆ瀽銆佸弽搴旂洃娴嬨?佸畾閲忓垎鏋愶紝鍙板紡璁捐?鎿嶄綔绠?渚?', '鍖栧悎鐗╃粨鏋勯壌瀹氥?佸寲瀛﹀弽搴斿姩鍔涘?鐮旂┒銆佹贩鍚堢墿瀹氶噺鍒嗘瀽', '浣跨敤涓撶敤鏍哥?绠★紝鏍峰搧闇?婧惰В婢勬竻锛屼繚鎸佺?鍦虹ǔ瀹氾紝娓╁害鎭掑畾'),
(41, 1, 'en-US', 'Light Microscope', 'Observe small objects and cell structures', 'Cell, tissue, microorganism observation', 'Avoid lens contamination, use special lens paper, clean oil immersion lens after use'),
(42, 2, 'en-US', 'Dissecting Microscope', 'Observe 3D structure of larger specimens', 'Dissection, specimen observation', 'Handle gently, avoid bumping'),
(43, 3, 'en-US', 'Electronic Balance', 'Accurately weigh reagent mass', 'Solution preparation, weighing chemicals', 'Do not overload, avoid liquid spills, clean after use'),
(44, 4, 'en-US', 'Pipette Gun', 'Accurately measure microliter volumes', 'DNA/protein experiments, solution preparation', 'Do not invert, avoid liquid entering the body, calibrate regularly'),
(45, 5, 'en-US', 'Constant-temperature Water Bath', 'Maintain constant temperature for heating liquids', 'Thawing reagents, incubation reactions', 'Change water regularly, avoid dry heating, watch for burns'),
(46, 6, 'en-US', 'Spectrophotometer', 'Measure solution absorbance', 'Concentration determination, enzyme activity assay', 'Keep cuvettes clean, avoid scratching optical surfaces'),
(47, 7, 'en-US', 'Centrifuge', 'Separate samples using centrifugal force', 'Cell pelleting, supernatant separation', 'Must balance, close lid tightly, do not open until fully stopped'),
(48, 8, 'en-US', 'Gel Imaging System', 'Capture and analyze gel electrophoresis results', 'DNA/protein gel documentation', 'Avoid direct UV exposure, wear face shield'),
(49, 9, 'en-US', 'Electrophoresis Apparatus', 'Provide electric field to separate DNA/proteins', 'DNA electrophoresis, protein electrophoresis', 'Mind electrode polarity, avoid electric shock, cover gel with buffer'),
(50, 10, 'en-US', 'Constant-temperature Incubator', 'Culture microorganisms or cells at constant temperature', 'Bacteria culture, cell culture', 'Clean regularly, avoid contamination, do not overload'),
(51, 11, 'en-US', 'Refrigerator', 'Store reagents and samples at low temperature', 'Enzyme, antibody, sample storage', 'Defrost regularly, store at appropriate temperature zones, avoid freeze-thaw cycles'),
(52, 12, 'en-US', 'Microwave Oven', 'Quickly heat solutions or melt agar', 'Media preparation, agar melting', 'Do not heat sealed containers, be careful of burns when removing'),
(53, 13, 'en-US', 'Alcohol Burner', 'Provide open flame for heating or sterilization', 'Inoculating loop sterilization, heating', 'Flammable, keep away from organic solvents, do not blow out'),
(54, 14, 'en-US', 'Oil-immersion Objective', '100x oil lens for observing bacteria and small structures', 'Bacterial staining observation', 'Clean immediately after use, avoid drying'),
(55, 15, 'en-US', 'CO鈧? Anesthesia Chamber', 'CO鈧? euthanasia for experimental animals', 'Animal euthanasia', 'Requires animal ethics approval, avoid animal suffering'),
(56, 16, 'en-US', 'Warming Plate', 'Maintain constant temperature for heating surfaces', 'Animal surgery, thawing', 'Avoid burns, clean regularly'),
(57, 17, 'en-US', 'CO鈧? Asphyxiation Equipment', 'CO鈧? asphyxiation for experimental animals', 'Animal euthanasia', 'Requires animal ethics approval, follow standard procedures, avoid animal suffering'),
(58, 18, 'en-US', 'Integrated Inverted Fluorescence Microscope', 'Fluorescence observation and high-resolution imaging of live cells', 'Fluorescence imaging, live-cell tracking, tissue section analysis', 'Preheat before use, avoid prolonged exposure to prevent photobleaching, keep lens clean'),
(59, 19, 'en-US', 'Multi-mode Microplate Reader', 'Absorbance, fluorescence, and luminescence detection in microplates', 'ELISA, protein quantification, cell viability assays, enzyme activity', 'Calibrate before use, avoid bubbles, keep optical path clean'),
(60, 20, 'en-US', 'Microplate Reader', 'UV-Vis absorbance detection in microplates', 'ELISA, protein concentration, cell proliferation assays', 'Preheat before use, avoid edge effects, dispense without bubbles'),
(61, 21, 'en-US', 'Gel Imaging System', 'Chemiluminescence, fluorescence, and colorimetric gel imaging and analysis', 'Western Blot, DNA/protein gel imaging, dot blot analysis', 'Avoid direct UV exposure, use chemical reagents away from light, calibrate regularly'),
(62, 22, 'en-US', 'Inverted Fluorescence Microscope', 'Live-cell fluorescence and phase contrast imaging', 'Cell culture observation, transfection efficiency, calcium imaging', 'Clean objective after use, turn off light source after use'),
(63, 23, 'en-US', 'Real-time Quantitative PCR System', 'Real-time PCR monitoring and gene expression quantification', 'Gene expression, miRNA quantification, pathogen detection, SNP genotyping', 'Avoid nucleic acid contamination, use appropriate consumables, set proper controls'),
(64, 24, 'en-US', 'Quantitative PCR System', 'High-throughput real-time PCR with multiplex detection', 'Gene expression analysis, copy number variation, microbial quantification', 'Prepare reactions in clean area, avoid cross-contamination, calibrate temperature regularly'),
(65, 25, 'en-US', 'Ultra-speed Refrigerated Centrifuge', 'Ultracentrifugation for subcellular fractionation and virus purification', 'Organelle isolation, virus purification, exosome extraction, plasmid preparation', 'Must balance precisely, use proper rotor, do not exceed maximum speed'),
(66, 26, 'en-US', 'Two-color Infrared Laser Imaging System', 'Two-channel infrared detection for quantitative Western Blot', 'Protein quantification, phosphorylation detection, protein-protein interaction', 'Use specific membranes and reagents, avoid signal saturation, calibrate lasers regularly'),
(67, 27, 'en-US', 'Laser Confocal Microscope', 'High-resolution 3D fluorescence imaging with optical sectioning', 'Cell structure imaging, colocalization analysis, time-lapse imaging, FRAP', 'Laser safety, avoid direct exposure, use proper parameters, regular maintenance'),
(68, 28, 'en-US', 'Atomic Absorption Spectrometer', 'Quantitative analysis of metal elements', 'Heavy metal detection, trace element analysis, environmental samples', 'Use hollow cathode lamp, calibrate regularly, digest samples, ensure ventilation'),
(69, 29, 'en-US', 'High Performance Liquid Chromatography', 'Compound separation, qualitative and quantitative analysis', 'Pharmaceutical analysis, metabolite detection, natural product isolation, quality control', 'Degas mobile phase, filter and degas solvents, maintain column regularly, flush system after use'),
(70, 30, 'en-US', 'Nanoparticle Size Analyzer', 'Dynamic light scattering for particle size and Zeta potential measurement', 'Nanomaterial characterization, protein aggregation analysis, liposome sizing', 'Filter samples to remove dust, avoid bubbles, equilibrate temperature, clean cuvette'),
(71, 31, 'en-US', 'STA-FTIR Analyzer', 'TGA-DSC coupled with FTIR for decomposition product analysis', 'Thermal stability analysis, decomposition mechanism study, component identification', 'Dry samples, stabilize gas flow, calibrate temperature and IR regularly'),
(72, 32, 'en-US', 'Ultra Performance Liquid Chromatography', 'High-pressure fast separation with improved resolution and sensitivity', 'Complex sample analysis, metabolomics, impurity detection', 'Use UPLC-specific columns, filter samples, control column temperature, regular maintenance'),
(73, 33, 'en-US', 'Gas Chromatography', 'Separation and analysis of volatile compounds', 'VOC analysis, residual solvent detection, fatty acid analysis', 'Leak check before use, use high purity carrier gas, optimize temperature program, regular column aging'),
(74, 34, 'en-US', 'Flow Cytometer', 'Multi-parameter cell analysis including phenotyping, cell cycle, apoptosis', 'Immunophenotyping, stem cell analysis, cell cycle analysis, apoptosis assay', 'Prepare single-cell suspension, protect stained samples from light, clean fluidics daily'),
(75, 35, 'en-US', 'Computer Cluster', 'Large-scale computation and storage for bioinformatics analysis', 'Genome assembly, transcriptomics, protein structure prediction, molecular dynamics simulation', 'Allocate resources properly, backup data regularly, manage cooling and power'),
(76, 36, 'en-US', 'UPLC-MS/MS System', 'High-sensitivity compound separation and identification with qualitative and quantitative analysis', 'Metabolomics, proteomics, pharmacokinetics, residue detection', 'Use high-purity solvents, maintain vacuum, calibrate mass axis regularly, avoid salts'),
(77, 37, 'en-US', 'Protein Purification System', 'Automated protein purification with gradient elution and multi-wavelength detection', 'Recombinant protein purification, antibody purification, enzyme separation, affinity chromatography', 'Equilibrate column before use, avoid bubbles, filter samples, clean column after use'),
(78, 38, 'en-US', 'UV-Vis-NIR Spectrometer', 'Broad-range spectroscopy for material optical property analysis', 'Bandgap determination, film transmission/reflection measurement, optical constant analysis', 'Preheat before use, blank correction, avoid concentrated samples, keep optical path clean'),
(79, 39, 'en-US', 'High-throughput qPCR System', 'High-throughput real-time PCR with 96/384-well plate support', 'Large-scale gene expression screening, miRNA profiling, high-throughput pathogen detection', 'Avoid contamination, use automated dispensing, set multiple replicates, calibrate regularly'),
(80, 40, 'en-US', 'Benchtop NMR Spectrometer', 'Molecular structure analysis, reaction monitoring, quantitative analysis with benchtop design', 'Compound identification, chemical reaction kinetics, mixture quantification', 'Use NMR tubes, dissolve samples clearly, maintain stable magnetic field and temperature');

-- --------------------------------------------------------

--
-- Table structure for table `operation_steps`
--

CREATE TABLE `operation_steps` (
  `id` int(11) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `step_order` int(11) NOT NULL,
  `language_code` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `tip` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation_steps`
--

INSERT INTO `operation_steps` (`id`, `equipment_id`, `step_order`, `language_code`, `description`, `tip`) VALUES
(1, 1, 1, 'zh-CN', '灏嗘樉寰?暅缃?簬骞崇ǔ妗岄潰锛屾帴閫氱數婧?', '閬垮厤寮哄厜鐩村皠鐩?暅'),
(2, 1, 2, 'zh-CN', '鏀剧疆杞界幓鐗囷紝鐢ㄥ帇鐗囧す鍥哄畾', '鏍锋湰瀵瑰噯閫氬厜瀛斾腑蹇?'),
(3, 1, 3, 'zh-CN', '浠庝綆鍊嶉暅寮?濮嬭皟鐒︼紝杞?姩绮楀噯鐒﹁灪鏃?', '鍕胯?鐗╅暅鎺ヨЕ鐜荤墖'),
(4, 1, 4, 'zh-CN', '杞?姩缁嗗噯鐒﹁灪鏃嬭嚦鍥惧儚娓呮櫚', '浣跨敤缁嗗噯鐒﹁灪鏃嬪井璋?'),
(5, 1, 5, 'zh-CN', '濡傞渶娌归暅锛屾淮棣欐煆娌瑰悗瑙傚療锛岀敤鍚庢竻娲?', '娌归暅鐢ㄥ悗蹇呴』绔嬪嵆娓呮磥'),
(6, 1, 1, 'en-US', 'Place microscope on stable table, connect power', 'Avoid direct strong light into eyepiece'),
(7, 1, 2, 'en-US', 'Place slide, secure with stage clips', 'Center specimen over light path'),
(8, 1, 3, 'en-US', 'Start with low power objective, use coarse focus knob', 'Do not let lens touch slide'),
(9, 1, 4, 'en-US', 'Use fine focus knob until image is clear', 'Use fine focus for precise adjustment'),
(10, 1, 5, 'en-US', 'For oil immersion, apply oil, observe, then clean', 'Clean oil immersion lens immediately'),
(11, 2, 1, 'zh-CN', '灏嗚В鍓栨樉寰?暅缃?簬骞崇ǔ鍙伴潰', '閫夋嫨鍏夌嚎鍏呰冻鐨勪綅缃?'),
(12, 2, 2, 'zh-CN', '鏀剧疆鏍囨湰浜庤浇鐗╁彴涓?ぎ', '鍙?娇鐢ㄨ緟鍔╁厜婧愮収鏄?'),
(13, 2, 3, 'zh-CN', '璋冭妭鍙岀洰闀滅瓛璺濈?', '浣垮弻鐪艰?閲庨噸鍚堜负涓?涓?渾褰?'),
(14, 2, 4, 'zh-CN', '杞?姩璋冪劍鎵嬭疆鑷冲浘鍍忔竻鏅?', '绮楄皟鍚庡彲浣跨敤寰?皟'),
(15, 2, 5, 'zh-CN', '璋冭妭鏀惧ぇ鍊嶆暟瑙傚療缁嗚妭', '浠庝綆鍊嶅埌楂樺?嶉?愭?璋冭妭'),
(16, 2, 1, 'en-US', 'Place dissecting microscope on stable table', 'Choose a well-lit location'),
(17, 2, 2, 'en-US', 'Place specimen on stage center', 'Use auxiliary light if needed'),
(18, 2, 3, 'en-US', 'Adjust binocular distance', 'Merge two fields into one circle'),
(19, 2, 4, 'en-US', 'Turn focus knob until image is clear', 'Use fine focus after coarse adjustment'),
(20, 2, 5, 'en-US', 'Adjust magnification to observe details', 'Increase gradually from low to high'),
(21, 3, 1, 'zh-CN', '灏嗗ぉ骞崇疆浜庡钩绋冲彴闈?紝寮?鏈洪?鐑?15鍒嗛挓', '閬垮厤闇囧姩鍜屾皵娴?'),
(22, 3, 2, 'zh-CN', '鏀剧疆绉伴噺绾告垨瀹瑰櫒锛屾寜褰掗浂閿?', '纭?繚瀹瑰櫒骞茬嚗娓呮磥'),
(23, 3, 3, 'zh-CN', '缂撴參鍔犲叆鏍峰搧鑷虫墍闇?璐ㄩ噺', '閬垮厤杩囬噺'),
(24, 3, 4, 'zh-CN', '璇诲彇绋冲畾鍚庣殑鏁板??', '绛夊緟鏁板瓧涓嶅啀璺冲姩'),
(25, 3, 5, 'zh-CN', '鍙栦笅鏍峰搧锛屾竻娲佺О鐩?', '浣跨敤杞?埛娓呮壂'),
(26, 3, 1, 'en-US', 'Place balance on stable table, warm up for 15 min', 'Avoid vibration and air flow'),
(27, 3, 2, 'en-US', 'Place weighing paper or container, press tare', 'Ensure container is dry and clean'),
(28, 3, 3, 'en-US', 'Slowly add sample to desired weight', 'Avoid adding too much'),
(29, 3, 4, 'en-US', 'Read stable value', 'Wait until numbers stop changing'),
(30, 3, 5, 'en-US', 'Remove sample, clean weighing pan', 'Use soft brush to clean'),
(31, 4, 1, 'zh-CN', '閫夋嫨鍚堥?傞噺绋嬬殑绉绘恫鍣ㄥ拰鍚稿ご', '浣跨敤閲忕▼鑼冨洿鍐呯殑浣撶Н'),
(32, 4, 2, 'zh-CN', '灏嗗惛澶寸墷鍥哄畨瑁呭埌绉绘恫鍣ㄤ笂', '杞昏交鏃嬭浆鎻掑叆锛屽嬁鐢ㄥ姏杩囩寷'),
(33, 4, 3, 'zh-CN', '鎸変笅鎸夐挳鑷崇?涓?妗ｏ紝鍨傜洿娴稿叆娑查潰涓?2-3mm', '淇濇寔绉绘恫鍣ㄥ瀭鐩?'),
(34, 4, 4, 'zh-CN', '缂撴參閲婃斁鎸夐挳鍚稿彇娑蹭綋', '閬垮厤浜х敓姘旀场'),
(35, 4, 5, 'zh-CN', '灏嗗惛澶村皷绔?创瀹瑰櫒澹侊紝鎸夊帇鑷崇?浜屾。鎺掓恫', '纭?繚鍏ㄩ儴娑蹭綋鎺掑嚭'),
(36, 4, 1, 'en-US', 'Select correct pipette and tip for volume range', 'Use volume within pipette range'),
(37, 4, 2, 'en-US', 'Attach tip securely to pipette', 'Gently twist to attach, do not use excessive force'),
(38, 4, 3, 'en-US', 'Press to first stop, immerse tip 2-3mm vertically', 'Keep pipette vertical'),
(39, 4, 4, 'en-US', 'Release button slowly to aspirate liquid', 'Avoid bubbles'),
(40, 4, 5, 'en-US', 'Touch tip to container wall, press to second stop to dispense', 'Ensure complete dispensing'),
(41, 5, 1, 'zh-CN', '妫?鏌ユ按浣嶏紝鍔犳按鑷冲埢搴︾嚎', '浣跨敤钂搁?姘存垨鍘荤?瀛愭按'),
(42, 5, 2, 'zh-CN', '璁惧畾鎵?闇?娓╁害', '鏍规嵁瀹為獙瑕佹眰璁惧畾'),
(43, 5, 3, 'zh-CN', '绛夊緟娓╁害绋冲畾鍚庡啀鏀惧叆鏍峰搧', '閫氬父闇?瑕?10-15鍒嗛挓'),
(44, 5, 4, 'zh-CN', '灏嗘牱鍝佸?鍣ㄦ斁鍏ユ按娴翠腑', '浣跨敤娴?紓鍥哄畾璇曠?'),
(45, 5, 5, 'zh-CN', '瀹為獙缁撴潫鍚庡彇鍑烘牱鍝侊紝鍏抽棴鐢垫簮', '娉ㄦ剰鐑?激'),
(46, 5, 1, 'en-US', 'Check water level, fill to mark line', 'Use distilled or deionized water'),
(47, 5, 2, 'en-US', 'Set desired temperature', 'Follow experiment requirements'),
(48, 5, 3, 'en-US', 'Wait for temperature to stabilize before adding samples', 'Usually takes 10-15 minutes'),
(49, 5, 4, 'en-US', 'Place sample container into water bath', 'Use float to secure tubes'),
(50, 5, 5, 'en-US', 'Remove samples after experiment, turn off power', 'Watch for burns'),
(51, 6, 1, 'zh-CN', '寮?鏈洪?鐑?20鍒嗛挓', '棰勭儹淇濊瘉鍏夋簮绋冲畾'),
(52, 6, 2, 'zh-CN', '璁惧畾妫?娴嬫尝闀?', '鏍规嵁瀹為獙瑕佹眰璁惧畾'),
(53, 6, 3, 'zh-CN', '鏀惧叆绌虹櫧瀵圭収锛岃皟闆?', '浣跨敤鐩稿悓婧跺墏'),
(54, 6, 4, 'zh-CN', '鏀惧叆鏍峰搧锛岃?鍙栧惛鍏夊害鍊?', '鎿︽嫮姣旇壊鐨垮?澹?'),
(55, 6, 5, 'zh-CN', '璁板綍鏁版嵁锛屽彇鍑烘瘮鑹茬毧娓呮礂', '閬垮厤鍒?激鍏夊?闈?'),
(56, 6, 1, 'en-US', 'Turn on and warm up for 20 minutes', 'Warm-up ensures light source stability'),
(57, 6, 2, 'en-US', 'Set detection wavelength', 'Follow experiment requirements'),
(58, 6, 3, 'en-US', 'Insert blank cuvette, zero the instrument', 'Use same solvent'),
(59, 6, 4, 'en-US', 'Insert sample, read absorbance', 'Wipe cuvette outer surface'),
(60, 6, 5, 'en-US', 'Record data, remove and clean cuvette', 'Avoid scratching optical surfaces'),
(61, 7, 1, 'zh-CN', '妫?鏌ユ牱鍝佺?鏄?惁骞宠　锛屼娇鐢ㄥぉ骞抽厤骞?', '纭?繚鏍峰搧绠￠噸閲忎竴鑷?'),
(62, 7, 2, 'zh-CN', '灏嗘牱鍝佺?瀵圭О鏀剧疆鍦ㄨ浆瀛愪腑', '瀵硅?鏀剧疆纭?繚骞宠　'),
(63, 7, 3, 'zh-CN', '鐩栫揣绂诲績鏈虹洊瀛?', '鐩栧瓙鏈?洊绱ф棤娉曞惎鍔?'),
(64, 7, 4, 'zh-CN', '璁惧畾杞??熷拰鏃堕棿', '鏍规嵁鏍峰搧绫诲瀷閫夋嫨鍚堥?傜殑鍙傛暟'),
(65, 7, 5, 'zh-CN', '鍚?姩绂诲績鏈猴紝绛夊緟瀹屽叏鍋滄?鍚庡啀寮?鐩?', '杩愯?鏃跺垏鍕挎墦寮?鐩栧瓙'),
(66, 7, 1, 'en-US', 'Check if sample tubes are balanced, use balance to counterweight', 'Ensure tubes have equal weight'),
(67, 7, 2, 'en-US', 'Place sample tubes symmetrically in rotor', 'Place opposite each other to maintain balance'),
(68, 7, 3, 'en-US', 'Close centrifuge lid tightly', 'Unit will not start if lid is not properly closed'),
(69, 7, 4, 'en-US', 'Set speed and time', 'Select appropriate parameters based on sample type'),
(70, 7, 5, 'en-US', 'Start centrifuge, wait for complete stop before opening', 'Never open lid during operation'),
(71, 8, 1, 'zh-CN', '鎵撳紑鎴愬儚绯荤粺鐢垫簮锛屽惎鍔ㄨ蒋浠?', '绛夊緟绯荤粺鍒濆?鍖?'),
(72, 8, 2, 'zh-CN', '灏嗗嚌鑳舵斁缃?湪閫忓皠鍙颁笂', '纭?繚鍑濊兌浣嶇疆姝ｇ‘'),
(73, 8, 3, 'zh-CN', '閫夋嫨鍚堥?傜殑鍏夋簮锛堢传澶?/鐧藉厜锛?', '绱??鍏夐渶鎴撮槻鎶ら潰缃?'),
(74, 8, 4, 'zh-CN', '璋冭妭鏇濆厜鏃堕棿锛岄?瑙堝浘鍍?', '閬垮厤杩囨洕'),
(75, 8, 5, 'zh-CN', '鎷嶆憚骞朵繚瀛樺浘鍍?', '淇濆瓨鍘熷?鏁版嵁'),
(76, 8, 1, 'en-US', 'Turn on imaging system power, launch software', 'Wait for system initialization'),
(77, 8, 2, 'en-US', 'Place gel on transilluminator', 'Ensure gel is positioned correctly'),
(78, 8, 3, 'en-US', 'Select appropriate light source (UV/white)', 'Wear face shield for UV light'),
(79, 8, 4, 'en-US', 'Adjust exposure time, preview image', 'Avoid overexposure'),
(80, 8, 5, 'en-US', 'Capture and save image', 'Save raw data'),
(81, 9, 1, 'zh-CN', '閰嶅埗鍑濊兌锛屽?掑叆鍒惰兌妲?', '鎻掑叆姊冲瓙褰㈡垚鍔犳牱瀛?'),
(82, 9, 2, 'zh-CN', '寰呭嚌鑳跺嚌鍥哄悗锛屾嫈鎺夋⒊瀛?', '杞绘煍鎿嶄綔闃叉?鐮村潖瀛旈亾'),
(83, 9, 3, 'zh-CN', '灏嗗嚌鑳舵斁鍏ョ數娉虫Ы锛屽姞鍏ョ紦鍐叉恫', '缂撳啿娑茶?鐩栧嚌鑳惰〃闈?'),
(84, 9, 4, 'zh-CN', '鍔犳牱鑷冲姞鏍峰瓟涓?', '璁板綍鍔犳牱椤哄簭'),
(85, 9, 5, 'zh-CN', '鐩栦笂鐩栧瓙锛岃繛鎺ョ數鏋侊紝璁惧畾鐢靛帇', '娉ㄦ剰姝ｈ礋鏋佹柟鍚?'),
(86, 9, 6, 'zh-CN', '鐢垫吵瀹屾垚鍚庯紝鍏抽棴鐢垫簮锛屽彇鍑哄嚌鑳?', '瑙傚療鏌撴枡鍓嶆部浣嶇疆'),
(87, 9, 1, 'en-US', 'Prepare gel, pour into casting tray', 'Insert comb to form wells'),
(88, 9, 2, 'en-US', 'After gel solidifies, remove comb', 'Be gentle to avoid damaging wells'),
(89, 9, 3, 'en-US', 'Place gel into tank, add buffer', 'Buffer should cover gel surface'),
(90, 9, 4, 'en-US', 'Load samples into wells', 'Record loading order'),
(91, 9, 5, 'en-US', 'Close lid, connect electrodes, set voltage', 'Pay attention to polarity'),
(92, 9, 6, 'en-US', 'After electrophoresis, turn off power, remove gel', 'Monitor dye front position'),
(93, 10, 1, 'zh-CN', '璁惧畾鎵?闇?娓╁害', '鏍规嵁鍩瑰吇瑕佹眰璁惧畾'),
(94, 10, 2, 'zh-CN', '绛夊緟娓╁害绋冲畾', '閫氬父闇?瑕?30-60鍒嗛挓'),
(95, 10, 3, 'zh-CN', '灏嗗煿鍏荤墿鏀惧叆鍩瑰吇绠?', '閬垮厤鍫嗙Н杩囧瘑'),
(96, 10, 4, 'zh-CN', '璁板綍鏀惧叆鏃堕棿鍜屾俯搴?', '瀹氭湡妫?鏌?'),
(97, 10, 5, 'zh-CN', '鍩瑰吇缁撴潫鍚庡彇鍑烘牱鍝?', '鍏抽棴绠遍棬'),
(98, 10, 1, 'en-US', 'Set desired temperature', 'Follow culture requirements'),
(99, 10, 2, 'en-US', 'Wait for temperature to stabilize', 'Usually takes 30-60 minutes'),
(100, 10, 3, 'en-US', 'Place cultures into incubator', 'Avoid overcrowding'),
(101, 10, 4, 'en-US', 'Record time and temperature', 'Check periodically'),
(102, 10, 5, 'en-US', 'Remove samples after incubation', 'Close the door'),
(103, 11, 1, 'zh-CN', '妫?鏌ュ啺绠辨俯搴︽槸鍚︽?甯?', '4掳C鎴?-20掳C鏍规嵁瑕佹眰'),
(104, 11, 2, 'zh-CN', '灏嗘牱鍝佹斁鍏ラ?傚綋娓╁害鍖哄煙', '閬垮厤闈犺繎闂ㄨ竟'),
(105, 11, 3, 'zh-CN', '鍏冲ソ鍐扮?闂?', '纭?繚瀵嗗皝'),
(106, 11, 4, 'zh-CN', '璁板綍瀛樻斁浣嶇疆鍜屾棩鏈?', '渚夸簬鍚庣画鏌ユ壘'),
(107, 11, 5, 'zh-CN', '瀹氭湡闄ら湝锛堝?闇?锛?', '閬垮厤鍐板眰杩囧帤'),
(108, 11, 1, 'en-US', 'Check if refrigerator temperature is normal', '4掳C or -20掳C as required'),
(109, 11, 2, 'en-US', 'Place samples in appropriate temperature zone', 'Avoid near door'),
(110, 11, 3, 'en-US', 'Close refrigerator door properly', 'Ensure seal is tight'),
(111, 11, 4, 'en-US', 'Record location and date', 'For easy retrieval'),
(112, 11, 5, 'en-US', 'Defrost regularly if needed', 'Avoid excessive ice buildup'),
(113, 12, 1, 'zh-CN', '灏嗘憾娑叉垨鐞艰剛鍊掑叆鍙?井娉㈠?鍣?', '浣跨敤涓撶敤寰?尝瀹瑰櫒'),
(114, 12, 2, 'zh-CN', '鐩栦笂閫忔皵鐩栨垨淇濋矞鑶滐紙鎵庡瓟锛?', '涓嶈?瀹屽叏瀵嗗皝'),
(115, 12, 3, 'zh-CN', '璁惧畾鏃堕棿锛屽惎鍔ㄥ井娉㈢倝', '涓?珮鐏?姞鐑?'),
(116, 12, 4, 'zh-CN', '鍙栧嚭瀹瑰櫒锛岃交杞绘憞鍖?', '浣跨敤闅旂儹鎵嬪?闃茬儷浼?'),
(117, 12, 5, 'zh-CN', '鍐峰嵈鑷抽?傚綋娓╁害鍚庝娇鐢?', '閬垮厤杩囩儹'),
(118, 12, 1, 'en-US', 'Pour solution or agar into microwave-safe container', 'Use microwave-safe container'),
(119, 12, 2, 'en-US', 'Cover with vented lid or perforated wrap', 'Do not seal completely'),
(120, 12, 3, 'en-US', 'Set time and start microwave', 'Use medium-high power'),
(121, 12, 4, 'en-US', 'Remove container, gently swirl to mix', 'Use heat-resistant gloves to prevent burns'),
(122, 12, 5, 'en-US', 'Cool to appropriate temperature before use', 'Avoid overheating'),
(123, 13, 1, 'zh-CN', '妫?鏌ラ厭绮鹃噺锛屼笉瓒呰繃瀹圭Н鐨?2/3', '閰掔簿涓嶈冻鍙婃椂娣诲姞'),
(124, 13, 2, 'zh-CN', '妫?鏌ョ伅鑺?槸鍚﹀畬濂?', '鐏?姱搴斿钩鏁?'),
(125, 13, 3, 'zh-CN', '鐢ㄧ伀鏌存垨鎵撶伀鏈虹偣鐕?', '涓嶅彲鐢ㄥ凡鐐圭噧鐨勯厭绮剧伅瀵圭伀'),
(126, 13, 4, 'zh-CN', '浣跨敤鐏?附鐩栫伃鐏?劙', '涓嶅彲鐢ㄥ槾鍚圭伃'),
(127, 13, 5, 'zh-CN', '鍐峰嵈鍚庢柟鍙?Щ鍔?', '閬垮厤鐑?激'),
(128, 13, 1, 'en-US', 'Check alcohol level, not exceeding 2/3 of volume', 'Refill if low'),
(129, 13, 2, 'en-US', 'Check if wick is intact', 'Wick should be flat'),
(130, 13, 3, 'en-US', 'Light with match or lighter', 'Do not use another lit burner'),
(131, 13, 4, 'en-US', 'Extinguish with cap', 'Do not blow out'),
(132, 13, 5, 'en-US', 'Wait to cool before moving', 'Avoid burns'),
(133, 14, 1, 'zh-CN', '鍏堢敤浣庡?嶉暅鎵惧埌鐩?爣鍖哄煙', '涓?績瀵瑰噯'),
(134, 14, 2, 'zh-CN', '婊翠竴婊撮?鏌忔补浜庢爣鏈?腑澶?', '浣跨敤涓撶敤闀滄补'),
(135, 14, 3, 'zh-CN', '鏃嬭浆鐗╅暅杞?洏锛屼娇娌归暅娴稿叆娌逛腑', '缂撴參杞?姩閬垮厤纰版挒'),
(136, 14, 4, 'zh-CN', '浣跨敤缁嗗噯鐒﹁灪鏃嬭皟鐒﹁嚦娓呮櫚', '寰?皟鍗冲彲'),
(137, 14, 5, 'zh-CN', '瑙傚療瀹屾瘯鍚庯紝鐢ㄦ摝闀滅焊娓呮磥娌归暅', '绾靛悜鍗曟柟鍚戞摝鎷?'),
(138, 14, 1, 'en-US', 'Locate target area with low power first', 'Center the specimen'),
(139, 14, 2, 'en-US', 'Apply one drop of immersion oil on specimen', 'Use immersion oil only'),
(140, 14, 3, 'en-US', 'Rotate objective turret, immerse oil lens into oil', 'Rotate slowly to avoid collision'),
(141, 14, 4, 'en-US', 'Focus with fine focus knob until clear', 'Only fine adjustment needed'),
(142, 14, 5, 'en-US', 'After observation, clean oil lens with lens paper', 'Wipe in one direction'),
(143, 15, 1, 'zh-CN', '妫?鏌ヨ?澶囪繛鎺ュ拰姘旀簮', '纭?繚CO鈧傛皵婧愬厖瓒?'),
(144, 15, 2, 'zh-CN', '灏嗗姩鐗╂斁鍏ラ夯閱夌?', '閬垮厤杩囧害鎷ユ尋'),
(145, 15, 3, 'zh-CN', '閫氬叆CO鈧傛皵浣?', '鎸夎?鑼冭皟鑺傛祦閫?'),
(146, 15, 4, 'zh-CN', '瑙傚療鍔ㄧ墿鍙嶅簲锛岀‘璁ら夯閱夌姸鎬?', '鏃犺嚜涓绘椿鍔ㄥ悗绛夊緟5鍒嗛挓'),
(147, 15, 5, 'zh-CN', '鍏抽棴姘旀簮锛屽彇鍑哄姩鐗?', '纭??姝讳骸鍚庡?鐞?'),
(148, 15, 1, 'en-US', 'Check equipment connection and gas supply', 'Ensure CO鈧? supply is sufficient'),
(149, 15, 2, 'en-US', 'Place animal into anesthesia chamber', 'Avoid overcrowding'),
(150, 15, 3, 'en-US', 'Flow CO鈧? gas', 'Adjust flow rate according to protocol'),
(151, 15, 4, 'en-US', 'Observe animal response, confirm anesthesia', 'Wait 5 minutes after no spontaneous movement'),
(152, 15, 5, 'en-US', 'Turn off gas, remove animal', 'Confirm death before disposal'),
(153, 16, 1, 'zh-CN', '灏嗗姞鐑?澘缃?簬骞崇ǔ鍙伴潰', '杩滅?鏄撶噧鐗?'),
(154, 16, 2, 'zh-CN', '璁惧畾鎵?闇?娓╁害', '鏍规嵁瀹為獙瑕佹眰'),
(155, 16, 3, 'zh-CN', '绛夊緟娓╁害绋冲畾', '閫氬父闇?瑕?10-15鍒嗛挓'),
(156, 16, 4, 'zh-CN', '灏嗘牱鍝佹垨瀹瑰櫒鏀惧湪鍔犵儹鏉夸笂', '浣跨敤闅旂儹鍨?'),
(157, 16, 5, 'zh-CN', '瀹為獙缁撴潫鍚庡叧闂?數婧?', '娉ㄦ剰楂樻俯琛ㄩ潰'),
(158, 16, 1, 'en-US', 'Place heating plate on stable table', 'Keep away from flammable materials'),
(159, 16, 2, 'en-US', 'Set desired temperature', 'Follow experiment requirements'),
(160, 16, 3, 'en-US', 'Wait for temperature to stabilize', 'Usually takes 10-15 minutes'),
(161, 16, 4, 'en-US', 'Place sample or container on heating plate', 'Use heat-insulating pad'),
(162, 16, 5, 'en-US', 'Turn off power after experiment', 'Beware of hot surface'),
(163, 17, 1, 'zh-CN', '妫?鏌ヨ?澶囪繛鎺ュ拰姘旀簮', '纭?繚CO鈧傛皵婧愬厖瓒?'),
(164, 17, 2, 'zh-CN', '灏嗗姩鐗╂斁鍏ョ獟鎭??', '閬垮厤杩囧害鎷ユ尋'),
(165, 17, 3, 'zh-CN', '閫氬叆CO鈧傛皵浣?', '鎸夎?鑼冭皟鑺傛祦閫?'),
(166, 17, 4, 'zh-CN', '瑙傚療鍔ㄧ墿鍙嶅簲锛岀‘璁ゆ?浜?', '5鍒嗛挓鍚庣‘璁?'),
(167, 17, 5, 'zh-CN', '鍏抽棴姘旀簮锛屽彇鍑哄姩鐗?', '鎸夎?瀹氬?鐞嗗案浣?'),
(168, 17, 1, 'en-US', 'Check equipment connection and gas supply', 'Ensure CO鈧? supply is sufficient'),
(169, 17, 2, 'en-US', 'Place animal into asphyxiation chamber', 'Avoid overcrowding'),
(170, 17, 3, 'en-US', 'Flow CO鈧? gas', 'Adjust flow rate according to protocol'),
(171, 17, 4, 'en-US', 'Observe animal response, confirm death', 'Confirm after 5 minutes'),
(172, 17, 5, 'en-US', 'Turn off gas, remove animal', 'Dispose according to regulations'),
(173, 18, 1, 'zh-CN', '鎵撳紑鏄惧井闀滃拰鍏夋簮锛岄?鐑?10-15鍒嗛挓', '棰勭儹淇濊瘉鍏夋簮绋冲畾'),
(174, 18, 2, 'zh-CN', '灏嗗煿鍏荤毧鏀剧疆鍦ㄨ浇鐗╁彴涓?', '纭?繚鍩瑰吇鐨垮簳閮ㄦ竻娲?'),
(175, 18, 3, 'zh-CN', '浣跨敤鏄庡満鎵惧埌鐩?爣缁嗚優', '浠庝綆鍊嶉暅寮?濮?'),
(176, 18, 4, 'zh-CN', '鍒囨崲鑷宠崸鍏夋ā寮忥紝閫夋嫨婵?鍙戞尝闀?', '閬垮厤闀挎椂闂寸収灏勫?鑷磋崸鍏夋番鐏?'),
(177, 18, 5, 'zh-CN', '璋冭妭鏇濆厜鏃堕棿锛屾媿鎽勫浘鍍?', '淇濆瓨鍘熷?鏁版嵁'),
(178, 18, 6, 'zh-CN', '浣跨敤鍚庡叧闂?厜婧愶紝娓呮磥闀滃ご', '閬垮厤娈嬬暀鐗╂薄鏌?'),
(179, 18, 1, 'en-US', 'Turn on microscope and light source, warm up for 10-15 min', 'Preheating ensures light source stability'),
(180, 18, 2, 'en-US', 'Place culture dish on stage', 'Ensure dish bottom is clean'),
(181, 18, 3, 'en-US', 'Find target cells using bright field', 'Start with low power'),
(182, 18, 4, 'en-US', 'Switch to fluorescence mode, select excitation wavelength', 'Avoid prolonged exposure to prevent photobleaching'),
(183, 18, 5, 'en-US', 'Adjust exposure time, capture image', 'Save raw data'),
(184, 18, 6, 'en-US', 'Turn off light source after use, clean objective', 'Avoid residue contamination'),
(185, 19, 1, 'zh-CN', '寮?鏈洪?鐑?20鍒嗛挓', '纭?繚鍏夋簮绋冲畾'),
(186, 19, 2, 'zh-CN', '鎵撳紑杞?欢锛岄?夋嫨妫?娴嬫ā寮?', '鏍规嵁瀹為獙閫夋嫨'),
(187, 19, 3, 'zh-CN', '璁剧疆妫?娴嬫尝闀垮拰澧炵泭', '鏍规嵁璇曞墏鐩掕?鏄?'),
(188, 19, 4, 'zh-CN', '灏嗗井瀛旀澘鏀惧叆浠?櫒', '纭?繚瀛旀澘鏂瑰悜姝ｇ‘'),
(189, 19, 5, 'zh-CN', '杩愯?妫?娴嬶紝淇濆瓨鏁版嵁', '閬垮厤绉诲姩瀛旀澘'),
(190, 19, 1, 'en-US', 'Turn on and warm up for 20 minutes', 'Ensure light source stability'),
(191, 19, 2, 'en-US', 'Open software, select detection mode', 'Choose based on experiment'),
(192, 19, 3, 'en-US', 'Set detection wavelength and gain', 'Follow kit instructions'),
(193, 19, 4, 'en-US', 'Place microplate into instrument', 'Ensure correct orientation'),
(194, 19, 5, 'en-US', 'Run assay, save data', 'Avoid moving plate during reading'),
(195, 20, 1, 'zh-CN', '寮?鏈洪?鐑?15鍒嗛挓', '绛夊緟鍏夋簮绋冲畾'),
(196, 20, 2, 'zh-CN', '璁惧畾妫?娴嬫尝闀?', '鏍规嵁瀹為獙瑕佹眰'),
(197, 20, 3, 'zh-CN', '鏀惧叆绌虹櫧瀛旀澘璋冮浂', '浣跨敤鐩稿悓缂撳啿娑?'),
(198, 20, 4, 'zh-CN', '鏀惧叆鏍峰搧瀛旀澘锛岃?鍙栧惛鍏夊害', '璁板綍鏁板??'),
(199, 20, 5, 'zh-CN', '鍙栧嚭瀛旀澘锛屽叧闂?华鍣?', '娓呮磥浠?櫒'),
(200, 20, 1, 'en-US', 'Turn on and warm up for 15 minutes', 'Wait for light source to stabilize'),
(201, 20, 2, 'en-US', 'Set detection wavelength', 'Follow experiment requirements'),
(202, 20, 3, 'en-US', 'Insert blank plate to zero', 'Use same buffer'),
(203, 20, 4, 'en-US', 'Insert sample plate, read absorbance', 'Record values'),
(204, 20, 5, 'en-US', 'Remove plate, turn off instrument', 'Clean the instrument'),
(205, 21, 1, 'zh-CN', '鎵撳紑鎴愬儚绯荤粺鐢垫簮锛屽惎鍔ㄨ蒋浠?', '绛夊緟绯荤粺鍒濆?鍖?'),
(206, 21, 2, 'zh-CN', '灏嗗嚌鑳舵斁缃?湪閫忓皠鍙颁笂', '纭?繚鏃犳皵娉?'),
(207, 21, 3, 'zh-CN', '閫夋嫨鍖栧?鍙戝厜鎴栬崸鍏夋ā寮?', '鏍规嵁瀹為獙閫夋嫨'),
(208, 21, 4, 'zh-CN', '璋冭妭鏇濆厜鏃堕棿锛岄?瑙堝浘鍍?', '閬垮厤杩囨洕'),
(209, 21, 5, 'zh-CN', '鎷嶆憚骞朵繚瀛樺浘鍍?', '淇濆瓨鍘熷?鏁版嵁'),
(210, 21, 6, 'zh-CN', '娓呮磥閫忓皠鍙?', '浣跨敤鏃犲皹绾?'),
(211, 21, 1, 'en-US', 'Turn on imaging system power, launch software', 'Wait for system initialization'),
(212, 21, 2, 'en-US', 'Place gel on transilluminator', 'Ensure no bubbles'),
(213, 21, 3, 'en-US', 'Select chemiluminescence or fluorescence mode', 'Choose based on experiment'),
(214, 21, 4, 'en-US', 'Adjust exposure time, preview image', 'Avoid overexposure'),
(215, 21, 5, 'en-US', 'Capture and save image', 'Save raw data'),
(216, 21, 6, 'en-US', 'Clean transilluminator', 'Use lint-free wipes'),
(217, 22, 1, 'zh-CN', '鎵撳紑鏄惧井闀滃拰鍏夋簮锛岄?鐑?10-15鍒嗛挓', '棰勭儹淇濊瘉鍏夋簮绋冲畾鎬?'),
(218, 22, 2, 'zh-CN', '灏嗗煿鍏荤毧鏀剧疆鍦ㄨ浇鐗╁彴涓?', '纭?繚鍩瑰吇鐨垮簳閮ㄦ竻娲?'),
(219, 22, 3, 'zh-CN', '閫夋嫨鍚堥?傜墿闀滐紝璋冭妭鐒﹁窛', '浠庝綆鍊嶉暅寮?濮?'),
(220, 22, 4, 'zh-CN', '鍒囨崲鑷宠崸鍏夋ā寮忥紝閫夋嫨鍚堥?傛縺鍙戞尝闀?', '閬垮厤闀挎椂闂寸収灏勫?鑷磋崸鍏夋番鐏?'),
(221, 22, 5, 'zh-CN', '璋冭妭鏇濆厜鏃堕棿鍜屽?鐩婏紝鎷嶆憚鍥惧儚', '淇濆瓨鍘熷?鏁版嵁'),
(222, 22, 1, 'en-US', 'Turn on microscope and light source, warm up for 10-15 min', 'Preheating ensures light source stability'),
(223, 22, 2, 'en-US', 'Place culture dish on stage', 'Ensure dish bottom is clean'),
(224, 22, 3, 'en-US', 'Select appropriate objective and focus', 'Start with low power'),
(225, 22, 4, 'en-US', 'Switch to fluorescence mode, select excitation wavelength', 'Avoid prolonged exposure to prevent photobleaching'),
(226, 22, 5, 'en-US', 'Adjust exposure time and gain, capture image', 'Save raw data'),
(227, 23, 1, 'zh-CN', '閰嶅埗PCR鍙嶅簲浣撶郴锛屽姞鍏?96瀛旀澘', '鍦ㄦ磥鍑?鍖烘搷浣滐紝閬垮厤姹℃煋'),
(228, 23, 2, 'zh-CN', '灏佸ソ鍏夊?鑶滐紝纭?繚瀵嗗皝', '閬垮厤姘旀场褰卞搷淇″彿'),
(229, 23, 3, 'zh-CN', '灏嗗瓟鏉挎斁鍏ヤ华鍣?紝鍏抽棴鐩栧瓙', '纭?繚鏀剧疆骞虫暣'),
(230, 23, 4, 'zh-CN', '璁剧疆鍙嶅簲绋嬪簭鍜屾?娴嬮?氶亾', '鏍规嵁璇曞墏鐩掕?鏄庤?缃?'),
(231, 23, 5, 'zh-CN', '杩愯?绋嬪簭锛屽垎鏋愭墿澧炴洸绾垮拰CT鍊?', '妫?鏌ョ啍瑙ｆ洸绾跨‘璁ょ壒寮傛??'),
(232, 23, 1, 'en-US', 'Prepare PCR reaction mix, add to 96-well plate', 'Operate in clean area, avoid contamination'),
(233, 23, 2, 'en-US', 'Seal with optical film, ensure tight seal', 'Avoid bubbles that may affect signal'),
(234, 23, 3, 'en-US', 'Place plate into instrument and close lid', 'Ensure plate is flat'),
(235, 23, 4, 'en-US', 'Set reaction program and detection channels', 'Follow kit instructions for settings'),
(236, 23, 5, 'en-US', 'Run program, analyze amplification curve and Ct values', 'Check melt curve to confirm specificity'),
(237, 24, 1, 'zh-CN', '閰嶅埗PCR鍙嶅簲浣撶郴', '浣跨敤鏃犳牳閰搁叾璇曞墏'),
(238, 24, 2, 'zh-CN', '鍔犲叆384瀛旀澘锛屽皝鑶?', '閬垮厤姘旀场'),
(239, 24, 3, 'zh-CN', '灏嗗瓟鏉挎斁鍏ヤ华鍣?', '纭?繚鏂瑰悜姝ｇ‘'),
(240, 24, 4, 'zh-CN', '璁剧疆鍙嶅簲绋嬪簭鍜屾?娴嬮?氶亾', '璁剧疆澶氶噸鑽у厜妫?娴?'),
(241, 24, 5, 'zh-CN', '杩愯?绋嬪簭锛屽垎鏋愭暟鎹?', '妫?鏌ユ墿澧炴洸绾?'),
(242, 24, 1, 'en-US', 'Prepare PCR reaction mix', 'Use nuclease-free reagents'),
(243, 24, 2, 'en-US', 'Add to 384-well plate, seal', 'Avoid bubbles'),
(244, 24, 3, 'en-US', 'Place plate into instrument', 'Ensure correct orientation'),
(245, 24, 4, 'en-US', 'Set reaction program and detection channels', 'Set multiplex detection'),
(246, 24, 5, 'en-US', 'Run program, analyze data', 'Check amplification curves'),
(247, 25, 1, 'zh-CN', '棰勫喎杞?瓙鑷宠?瀹氭俯搴?', '鎻愬墠璁剧疆娓╁害'),
(248, 25, 2, 'zh-CN', '鏍峰搧绠′弗鏍奸厤骞?', '閲嶉噺宸?皬浜?0.1g'),
(249, 25, 3, 'zh-CN', '瀵圭О鏀剧疆鏍峰搧绠?', '浣跨敤涓撶敤杞?瓙'),
(250, 25, 4, 'zh-CN', '鐩栫揣杞?瓙鐩栧瓙', '纭?繚閿佺揣'),
(251, 25, 5, 'zh-CN', '璁惧畾杞??熷拰鏃堕棿锛屽惎鍔?', '涓嶅彲瓒呰繃杞?瓙鏈?澶ц浆閫?'),
(252, 25, 6, 'zh-CN', '瀹屽叏鍋滄?鍚庡紑鐩栵紝鍙栧嚭鏍峰搧', '妫?鏌ユ牱鍝佺?'),
(253, 25, 1, 'en-US', 'Pre-cool rotor to set temperature', 'Set temperature in advance'),
(254, 25, 2, 'en-US', 'Balance sample tubes precisely', 'Weight difference <0.1g'),
(255, 25, 3, 'en-US', 'Place sample tubes symmetrically', 'Use proper rotor'),
(256, 25, 4, 'en-US', 'Tighten rotor lid', 'Ensure it is locked'),
(257, 25, 5, 'en-US', 'Set speed and time, start', 'Do not exceed rotor maximum speed'),
(258, 25, 6, 'en-US', 'Open lid after complete stop, remove samples', 'Check sample tubes'),
(259, 26, 1, 'zh-CN', '鎵撳紑浠?櫒鍜岃蒋浠?', '绛夊緟鍒濆?鍖?'),
(260, 26, 2, 'zh-CN', '灏嗚啘鏀剧疆鍦ㄦ壂鎻忓彴涓?', '纭?繚鑶滃钩鏁存棤姘旀场'),
(261, 26, 3, 'zh-CN', '璁剧疆鎵?弿鍙傛暟锛堥?氶亾銆佸垎杈ㄧ巼锛?', '鏍规嵁瀹為獙閫夋嫨'),
(262, 26, 4, 'zh-CN', '杩愯?鎵?弿', '閬垮厤绉诲姩'),
(263, 26, 5, 'zh-CN', '淇濆瓨鍥惧儚锛岃繘琛屽畾閲忓垎鏋?', '閬垮厤淇″彿楗卞拰'),
(264, 26, 1, 'en-US', 'Turn on instrument and software', 'Wait for initialization'),
(265, 26, 2, 'en-US', 'Place membrane on scanning stage', 'Ensure membrane is flat without bubbles'),
(266, 26, 3, 'en-US', 'Set scanning parameters (channels, resolution)', 'Choose based on experiment'),
(267, 26, 4, 'en-US', 'Run scan', 'Avoid moving during scan'),
(268, 26, 5, 'en-US', 'Save image, perform quantitative analysis', 'Avoid signal saturation'),
(269, 27, 1, 'zh-CN', '鎵撳紑鏄惧井闀滃拰婵?鍏夊櫒', '棰勭儹10-15鍒嗛挓'),
(270, 27, 2, 'zh-CN', '鏀剧疆鏍峰搧锛岃皟鐒?', '浣跨敤浣庡?嶉暅瀹氫綅'),
(271, 27, 3, 'zh-CN', '閫夋嫨婵?鍏夊拰妫?娴嬮?氶亾', '鏍规嵁鑽у厜鏌撴枡閫夋嫨'),
(272, 27, 4, 'zh-CN', '璁剧疆鎵?弿鍙傛暟锛堝垎杈ㄧ巼銆佹壂鎻忛?熷害锛?', '鏍规嵁鏍峰搧璋冩暣'),
(273, 27, 5, 'zh-CN', '閲囬泦Z-stack鎴栨椂闂村簭鍒?', '璁剧疆灞傞棿璺?'),
(274, 27, 6, 'zh-CN', '淇濆瓨鍥惧儚锛屽叧闂?縺鍏夊櫒', '閬垮厤婵?鍏夐暱鏃堕棿鐓у皠'),
(275, 27, 1, 'en-US', 'Turn on microscope and lasers', 'Warm up for 10-15 minutes'),
(276, 27, 2, 'en-US', 'Place sample, focus', 'Locate with low power objective'),
(277, 27, 3, 'en-US', 'Select laser and detection channels', 'Choose based on fluorescent dyes'),
(278, 27, 4, 'en-US', 'Set scanning parameters (resolution, speed)', 'Adjust based on sample'),
(279, 27, 5, 'en-US', 'Acquire Z-stack or time series', 'Set step size'),
(280, 27, 6, 'en-US', 'Save images, turn off lasers', 'Avoid prolonged laser exposure'),
(281, 28, 1, 'zh-CN', '瀹夎?绌哄績闃存瀬鐏?紝棰勭儹30鍒嗛挓', '鐏?數娴佹寜璇存槑璁剧疆'),
(282, 28, 2, 'zh-CN', '璋冭妭鍏夎矾锛屼紭鍖栦俊鍙?', '纭?繚鏈?澶ч?忚繃鐜?'),
(283, 28, 3, 'zh-CN', '閰嶅埗鏍囧噯婧舵恫锛屽缓绔嬫爣鍑嗘洸绾?', '鑷冲皯5涓?祿搴︾偣'),
(284, 28, 4, 'zh-CN', '灏嗘牱鍝侀浘鍖栵紝娴嬮噺鍚稿厜搴?', '姣忔?娴嬮噺鍚庢竻娲?'),
(285, 28, 5, 'zh-CN', '鏍规嵁鏍囧噯鏇茬嚎璁＄畻娴撳害', 'R虏搴斿ぇ浜?0.995'),
(286, 28, 1, 'en-US', 'Install hollow cathode lamp, warm up for 30 min', 'Set lamp current as per instructions'),
(287, 28, 2, 'en-US', 'Adjust light path, optimize signal', 'Ensure maximum transmission'),
(288, 28, 3, 'en-US', 'Prepare standard solutions, create calibration curve', 'At least 5 concentration points'),
(289, 28, 4, 'en-US', 'Atomize sample, measure absorbance', 'Clean after each measurement'),
(290, 28, 5, 'en-US', 'Calculate concentration from calibration curve', 'R虏 should be >0.995'),
(291, 29, 1, 'zh-CN', '杩囨护骞惰劚姘旀祦鍔ㄧ浉', '浣跨敤0.45渭m婊よ啘'),
(292, 29, 2, 'zh-CN', '鍚?姩娉碉紝鎺掗櫎绯荤粺姘旀场', '娉ㄦ剰瑙傚療鍘嬪姏'),
(293, 29, 3, 'zh-CN', '骞宠　鑹茶氨鏌辫嚦鍘嬪姏绋冲畾', '閫氬父闇?瑕?20-30鍒嗛挓'),
(294, 29, 4, 'zh-CN', '杩涙牱鍒嗘瀽', '璁板綍淇濈暀鏃堕棿'),
(295, 29, 5, 'zh-CN', '杩愯?缁撴潫鍚庡啿娲楄壊璋辨煴', '闃叉?鐩愭瀽'),
(296, 29, 6, 'zh-CN', '鍏抽棴浠?櫒锛岃?褰曟棩蹇?', '濉?啓浣跨敤璁板綍'),
(297, 29, 1, 'en-US', 'Filter and degas mobile phase', 'Use 0.45渭m filter'),
(298, 29, 2, 'en-US', 'Start pump, purge air bubbles from system', 'Monitor pressure'),
(299, 29, 3, 'en-US', 'Equilibrate column until pressure stable', 'Usually takes 20-30 minutes'),
(300, 29, 4, 'en-US', 'Inject sample for analysis', 'Record retention time'),
(301, 29, 5, 'en-US', 'Flush column after run', 'Prevent salt precipitation'),
(302, 29, 6, 'en-US', 'Turn off instrument, log usage', 'Fill in usage log'),
(303, 30, 1, 'zh-CN', '鎵撳紑浠?櫒锛岄?鐑?30鍒嗛挓', '绛夊緟娓╁害绋冲畾'),
(304, 30, 2, 'zh-CN', '鏍峰搧杩囨护闄ゅ皹', '浣跨敤0.22渭m婊よ啘'),
(305, 30, 3, 'zh-CN', '灏嗘牱鍝佸姞鍏ユ瘮鑹茬毧', '鏃犳皵娉?'),
(306, 30, 4, 'zh-CN', '鏀惧叆浠?櫒锛屽紑濮嬫祴閲?', '閫夋嫨鍚堥?傚弬鏁?'),
(307, 30, 5, 'zh-CN', '璁板綍绮掑緞鍜孭DI鍊?', '閲嶅?娴嬮噺3娆?'),
(308, 30, 1, 'en-US', 'Turn on instrument, warm up for 30 minutes', 'Wait for temperature stabilization'),
(309, 30, 2, 'en-US', 'Filter sample to remove dust', 'Use 0.22渭m filter'),
(310, 30, 3, 'en-US', 'Add sample to cuvette', 'No bubbles'),
(311, 30, 4, 'en-US', 'Place in instrument, start measurement', 'Select appropriate parameters'),
(312, 30, 5, 'en-US', 'Record size and PDI', 'Measure 3 times for consistency'),
(313, 31, 1, 'zh-CN', '鎵撳紑FTIR鍜孴GA锛岄?鐑?30鍒嗛挓', '绛夊緟绾㈠?绋冲畾'),
(314, 31, 2, 'zh-CN', '妫?鏌ユ皵浣撴祦閫?', '纭?繚鍚规壂姘斿厖瓒?'),
(315, 31, 3, 'zh-CN', '灏嗘牱鍝佹斁鍏ュ潻鍩氾紝褰掗浂', '璁板綍鏍峰搧璐ㄩ噺'),
(316, 31, 4, 'zh-CN', '璁剧疆鍗囨俯绋嬪簭', '鏍规嵁鏍峰搧鐗规?ц?缃?'),
(317, 31, 5, 'zh-CN', '鍚?姩娴嬮噺锛屽疄鏃剁洃娴?', '瑙傚療绾㈠?鍥捐氨鍙樺寲'),
(318, 31, 6, 'zh-CN', '鍒嗘瀽鏁版嵁锛屾竻娲佷华鍣?', '浣跨敤鍚庢竻娲?'),
(319, 31, 1, 'en-US', 'Turn on FTIR and TGA, warm up for 30 min', 'Wait for IR stabilization'),
(320, 31, 2, 'en-US', 'Check gas flow rate', 'Ensure purge gas is sufficient'),
(321, 31, 3, 'en-US', 'Place sample in crucible, tare', 'Record sample mass'),
(322, 31, 4, 'en-US', 'Set temperature program', 'Choose based on sample properties'),
(323, 31, 5, 'en-US', 'Start measurement, monitor in real-time', 'Observe IR spectral changes'),
(324, 31, 6, 'en-US', 'Analyze data, clean instrument', 'Clean after use'),
(325, 32, 1, 'zh-CN', '杩囨护骞惰劚姘旀祦鍔ㄧ浉', '浣跨敤UPLC涓撶敤婧跺墏'),
(326, 32, 2, 'zh-CN', '瀹夎?UPLC涓撶敤鑹茶氨鏌?', '娉ㄦ剰鍘嬪姏涓婇檺'),
(327, 32, 3, 'zh-CN', '骞宠　鑹茶氨鏌?', '瑙傚療鍘嬪姏绋冲畾'),
(328, 32, 4, 'zh-CN', '杩涙牱鍒嗘瀽', '浣跨敤灏忎綋绉?繘鏍?'),
(329, 32, 5, 'zh-CN', '杩愯?缁撴潫鍚庡啿娲楄壊璋辨煴', '閬垮厤娈嬬暀'),
(330, 32, 6, 'zh-CN', '鍏抽棴浠?櫒', '濉?啓浣跨敤璁板綍'),
(331, 32, 1, 'en-US', 'Filter and degas mobile phase', 'Use UPLC-grade solvents'),
(332, 32, 2, 'en-US', 'Install UPLC-specific column', 'Note maximum pressure limit'),
(333, 32, 3, 'en-US', 'Equilibrate column', 'Monitor pressure stability'),
(334, 32, 4, 'en-US', 'Inject sample for analysis', 'Use small injection volume'),
(335, 32, 5, 'en-US', 'Flush column after run', 'Prevent carryover'),
(336, 32, 6, 'en-US', 'Turn off instrument', 'Fill in usage log'),
(337, 33, 1, 'zh-CN', '妫?鏌ヨ浇姘斿帇鍔涘拰绾?害', '纭?繚鏃犳硠婕?'),
(338, 33, 2, 'zh-CN', '璁剧疆杩涙牱鍙ｃ?佹煴绠便?佹?娴嬪櫒娓╁害', '绋嬪簭鍗囨俯璁剧疆'),
(339, 33, 3, 'zh-CN', '绛夊緟娓╁害绋冲畾', '閫氬父闇?瑕?30鍒嗛挓'),
(340, 33, 4, 'zh-CN', '杩涙牱鍒嗘瀽', '蹇??熷噯纭?'),
(341, 33, 5, 'zh-CN', '鏁版嵁鍒嗘瀽锛岃?绠椾繚鐣欐椂闂?', '浣跨敤鍐呮爣鎴栧?鏍囨硶'),
(342, 33, 6, 'zh-CN', '闄嶆俯鍚庡叧鏈?', '淇濇姢鑹茶氨鏌?'),
(343, 33, 1, 'en-US', 'Check carrier gas pressure and purity', 'Ensure no leaks'),
(344, 33, 2, 'en-US', 'Set inlet, oven, detector temperatures', 'Set temperature program'),
(345, 33, 3, 'en-US', 'Wait for temperature to stabilize', 'Usually takes 30 minutes'),
(346, 33, 4, 'en-US', 'Inject sample for analysis', 'Quick and accurate injection'),
(347, 33, 5, 'en-US', 'Analyze data, calculate retention time', 'Use internal or external standard'),
(348, 33, 6, 'en-US', 'Cool down before shutdown', 'Protect column'),
(349, 34, 1, 'zh-CN', '鎵撳紑浠?櫒鐢垫簮锛岄?鐑?15鍒嗛挓', '妫?鏌ラ灅娑叉《娑蹭綅'),
(350, 34, 2, 'zh-CN', '娓呮礂绠¤矾锛岃繍琛岃川鎺у井鐞?', '楠岃瘉浠?櫒鎬ц兘'),
(351, 34, 3, 'zh-CN', '璁剧疆妫?娴嬪弬鏁帮紙鐢靛帇銆佽ˉ鍋匡級', '鏍规嵁鑽у厜鏌撴枡璁剧疆'),
(352, 34, 4, 'zh-CN', '灏嗘牱鍝佽繃婊や负鍗曠粏鑳炴偓娑?', '浣跨敤缁嗚優婊ょ綉'),
(353, 34, 5, 'zh-CN', '涓婃牱锛岄噰闆嗘暟鎹?', '璁板綍浜嬩欢鏁?'),
(354, 34, 6, 'zh-CN', '娓呮礂绠¤矾锛屽叧闂?华鍣?', '闃叉?鍫靛?'),
(355, 34, 1, 'en-US', 'Turn on instrument, warm up for 15 min', 'Check sheath fluid level'),
(356, 34, 2, 'en-US', 'Clean fluidics, run quality control beads', 'Verify instrument performance'),
(357, 34, 3, 'en-US', 'Set detection parameters (voltage, compensation)', 'Adjust based on fluorescent dyes'),
(358, 34, 4, 'en-US', 'Filter sample to single-cell suspension', 'Use cell strainer'),
(359, 34, 5, 'en-US', 'Load sample, acquire data', 'Record event count'),
(360, 34, 6, 'en-US', 'Clean fluidics, turn off instrument', 'Prevent clogging'),
(361, 35, 1, 'zh-CN', '鐧诲綍闆嗙兢鐧诲綍鑺傜偣', '浣跨敤SSH鎴栬繙绋嬫?闈?'),
(362, 35, 2, 'zh-CN', '鍔犺浇鎵?闇?杞?欢妯″潡', 'module load鍛戒护'),
(363, 35, 3, 'zh-CN', '鍑嗗?杈撳叆鏂囦欢鍜屼綔涓氳剼鏈?', '鎸囧畾璁＄畻璧勬簮'),
(364, 35, 4, 'zh-CN', '鎻愪氦浣滀笟鍒拌?绠楄妭鐐?', '浣跨敤sbatch鎴杚sub'),
(365, 35, 5, 'zh-CN', '鐩戞帶浣滀笟杩愯?鐘舵??', '浣跨敤squeue鎴杚stat'),
(366, 35, 6, 'zh-CN', '浣滀笟瀹屾垚鍚庝笅杞界粨鏋?', '鍙婃椂娓呯悊涓存椂鏂囦欢'),
(367, 35, 1, 'en-US', 'Login to cluster login node', 'Use SSH or remote desktop'),
(368, 35, 2, 'en-US', 'Load required software modules', 'Use module load command'),
(369, 35, 3, 'en-US', 'Prepare input files and job script', 'Specify computing resources'),
(370, 35, 4, 'en-US', 'Submit job to compute nodes', 'Use sbatch or qsub'),
(371, 35, 5, 'en-US', 'Monitor job status', 'Use squeue or qstat'),
(372, 35, 6, 'en-US', 'Download results after job completion', 'Clean up temporary files'),
(373, 36, 1, 'zh-CN', '鎵撳紑UPLC鍜孧S鐢垫簮', '鍚?姩宸ヤ綔绔?'),
(374, 36, 2, 'zh-CN', '妫?鏌ョ湡绌哄害鍜屾爱姘斿帇鍔?', '鐪熺┖搴﹂渶杈炬爣'),
(375, 36, 3, 'zh-CN', '鏍″噯璐ㄩ噺杞?', '浣跨敤鏍囧噯娑叉牎鍑?'),
(376, 36, 4, 'zh-CN', '璁剧疆鑹茶氨鍜岃川璋辨柟娉?', '鏍规嵁鍒嗘瀽鐗╅?夋嫨'),
(377, 36, 5, 'zh-CN', '杩涙牱鍒嗘瀽', '浣跨敤楂樼函搴︽憾鍓?'),
(378, 36, 6, 'zh-CN', '杩愯?缁撴潫鍚庡啿娲楄壊璋辨煴鍜岀?瀛愭簮', '閬垮厤鐩愬垎娈嬬暀'),
(379, 36, 1, 'en-US', 'Turn on UPLC and MS power', 'Start workstation'),
(380, 36, 2, 'en-US', 'Check vacuum level and nitrogen pressure', 'Vacuum must reach required level'),
(381, 36, 3, 'en-US', 'Calibrate mass axis', 'Use calibration standard'),
(382, 36, 4, 'en-US', 'Set LC and MS methods', 'Choose based on analyte'),
(383, 36, 5, 'en-US', 'Inject sample for analysis', 'Use high-purity solvents'),
(384, 36, 6, 'en-US', 'Flush column and ion source after run', 'Prevent salt buildup'),
(385, 37, 1, 'zh-CN', '妫?鏌ョ紦鍐叉恫鍜岀?璺?', '纭?繚鏃犳皵娉?'),
(386, 37, 2, 'zh-CN', '瀹夎?灞傛瀽鏌憋紝杩炴帴妫?娴嬪櫒', '璁板綍鏌变俊鎭?'),
(387, 37, 3, 'zh-CN', '鐢ㄨ捣濮嬬紦鍐叉恫骞宠　鏌卞瓙', '瑙傚療鍩虹嚎绋冲畾'),
(388, 37, 4, 'zh-CN', '鏍峰搧杩囨护鍚庝笂鏍?', '浣跨敤0.45渭m婊よ啘'),
(389, 37, 5, 'zh-CN', '姊?害娲楄劚锛屾敹闆嗛?鍒?', '璁惧畾鏀堕泦浣撶Н'),
(390, 37, 6, 'zh-CN', '鍒嗘瀽娲楄劚宄帮紝娓呮礂灞傛瀽鏌?', '淇濆瓨鑹茶氨鍥?'),
(391, 37, 1, 'en-US', 'Check buffer and tubing', 'Ensure no bubbles'),
(392, 37, 2, 'en-US', 'Install column, connect detector', 'Record column info'),
(393, 37, 3, 'en-US', 'Equilibrate column with starting buffer', 'Monitor baseline stability'),
(394, 37, 4, 'en-US', 'Filter sample before loading', 'Use 0.45渭m filter'),
(395, 37, 5, 'en-US', 'Gradient elution, collect fractions', 'Set collection volume'),
(396, 37, 6, 'en-US', 'Analyze elution peaks, clean column', 'Save chromatogram'),
(397, 38, 1, 'zh-CN', '寮?鏈洪?鐑?30鍒嗛挓', '绛夊緟鍏夋簮绋冲畾'),
(398, 38, 2, 'zh-CN', '杩涜?绌虹櫧鑳屾櫙鎵?弿', '浣跨敤绌烘瘮鑹茬毧'),
(399, 38, 3, 'zh-CN', '灏嗘牱鍝佹斁鍏ュ厜璺?', '鎿︽嫮姣旇壊鐨垮?澹?'),
(400, 38, 4, 'zh-CN', '鎵?弿鏍峰搧鍏夎氨', '璁惧畾娉㈤暱鑼冨洿'),
(401, 38, 5, 'zh-CN', '璁板綍鍚稿厜搴︽垨閫忚繃鐜?', '淇濆瓨鍏夎氨鏁版嵁'),
(402, 38, 1, 'en-US', 'Turn on and warm up for 30 minutes', 'Wait for light source to stabilize'),
(403, 38, 2, 'en-US', 'Run blank background scan', 'Use empty cuvette'),
(404, 38, 3, 'en-US', 'Place sample in light path', 'Wipe cuvette outer surface'),
(405, 38, 4, 'en-US', 'Scan sample spectrum', 'Set wavelength range'),
(406, 38, 5, 'en-US', 'Record absorbance or transmittance', 'Save spectral data'),
(407, 39, 1, 'zh-CN', '閰嶅埗PCR棰勬贩娑?', '浣跨敤鑷?姩鍖栧姞鏍风郴缁?'),
(408, 39, 2, 'zh-CN', '鍒嗚?鑷?384瀛旀澘', '閬垮厤浜ゅ弶姹℃煋'),
(409, 39, 3, 'zh-CN', '灏佽啘锛岀?蹇?', '鍘婚櫎姘旀场'),
(410, 39, 4, 'zh-CN', '鏀惧叆浠?櫒锛岃?缃?▼搴?', '閫夋嫨楂橀?氶噺妯″紡'),
(411, 39, 5, 'zh-CN', '杩愯?PCR锛屽垎鏋愭暟鎹?', '妫?鏌ョ啍瑙ｆ洸绾?'),
(412, 39, 1, 'en-US', 'Prepare PCR master mix', 'Use automated dispensing system'),
(413, 39, 2, 'en-US', 'Dispense to 384-well plate', 'Avoid cross-contamination'),
(414, 39, 3, 'en-US', 'Seal plate, centrifuge', 'Remove bubbles'),
(415, 39, 4, 'en-US', 'Place in instrument, set program', 'Select high-throughput mode'),
(416, 39, 5, 'en-US', 'Run PCR, analyze data', 'Check melt curves'),
(417, 40, 1, 'zh-CN', '寮?鏈猴紝绛夊緟纾佸満绋冲畾', '閫氬父闇?瑕?10-15鍒嗛挓'),
(418, 40, 2, 'zh-CN', '鏍峰搧婧惰В鍚庡姞鍏ユ牳纾佺?', '纭?繚鏍峰搧婢勬竻'),
(419, 40, 3, 'zh-CN', '灏嗘牳纾佺?鏀惧叆鏍峰搧鑵?', '鍨傜洿鏀惧叆'),
(420, 40, 4, 'zh-CN', '璁剧疆鎵?弿鍙傛暟锛堟憾鍓傘?佽剦鍐插簭鍒楋級', '姘樹唬婧跺墏閿佸満'),
(421, 40, 5, 'zh-CN', '寮?濮嬮噰闆嗭紝杩涜?鍌呴噷鍙跺彉鎹?', '绱?姞閫傚綋娆℃暟'),
(422, 40, 6, 'zh-CN', '鍒嗘瀽璋卞浘锛岃緭鍑虹粨鏋?', '鍩虹嚎鏍℃?鍜岀Н鍒?'),
(423, 40, 1, 'en-US', 'Turn on, wait for magnetic field to stabilize', 'Usually takes 10-15 minutes'),
(424, 40, 2, 'en-US', 'Dissolve sample, add to NMR tube', 'Ensure sample is clear'),
(425, 40, 3, 'en-US', 'Insert NMR tube into sample chamber', 'Insert vertically'),
(426, 40, 4, 'en-US', 'Set acquisition parameters (solvent, pulse sequence)', 'Lock using deuterated solvent'),
(427, 40, 5, 'en-US', 'Start acquisition, perform Fourier transform', 'Accumulate appropriate scans'),
(428, 40, 6, 'en-US', 'Analyze spectrum, output results', 'Baseline correction and integration');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` varchar(50) NOT NULL,
  `selected_answer` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_answers`
--

INSERT INTO `quiz_answers` (`id`, `attempt_id`, `question_id`, `selected_answer`, `is_correct`) VALUES
(1, 1, 'q1', 1, 1),
(2, 1, 'q2', 0, 1),
(3, 1, 'q3', 0, 1),
(4, 1, 'q4', 0, 1),
(5, 1, 'q5', 0, 1),
(6, 1, 'q6', 0, 1),
(7, 1, 'q7', 0, 1),
(8, 1, 'q8', 0, 1),
(9, 2, 'q1', 1, 1),
(10, 2, 'q2', 0, 1),
(11, 2, 'q3', 0, 1),
(12, 2, 'q4', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `quiz_type` varchar(50) NOT NULL DEFAULT 'safety'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_attempts`
--

INSERT INTO `quiz_attempts` (`id`, `student_id`, `score`, `total_questions`, `submitted_at`, `quiz_type`) VALUES
(1, 4, 8, 8, '2026-05-24 18:34:13', 'safety'),
(2, 4, 4, 4, '2026-05-25 07:22:42', 'safety');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_number` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password_hash` char(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_number`, `name`, `password_hash`, `created_at`) VALUES
(1, '20260001', '寮犲悓瀛?', 'b8ec2b70b6a689be008a1568f3628cd89176d50a80189c7e479f81b9e8b4f687', '2026-05-24 18:23:24'),
(2, '20260002', '鏉庡悓瀛?', 'da13ef6f75dab6c675b1fbcd13b61eb5954b44ef8a0ff82398d8665184f1ec85', '2026-05-24 18:23:24'),
(3, '123456', 'Amy', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '2026-05-24 18:29:00'),
(4, '1306042', 'Vikcy', '8bf4dec545e105bb54dafcfe6436b67ab8bf0c01d7b575d865810661b858d86f', '2026-05-24 18:31:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_translations`
--
ALTER TABLE `equipment_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Indexes for table `operation_steps`
--
ALTER TABLE `operation_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attempt_id` (`attempt_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_number` (`student_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `equipment_translations`
--
ALTER TABLE `equipment_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `operation_steps`
--
ALTER TABLE `operation_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipment_translations`
--
ALTER TABLE `equipment_translations`
  ADD CONSTRAINT `equipment_translations_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `operation_steps`
--
ALTER TABLE `operation_steps`
  ADD CONSTRAINT `operation_steps_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `quiz_attempts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
