// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//HabboGamesCom

package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboGameManagerBootstrap;
    import com.sulake.iid.IIDHabboGameManager;

    [SecureSWF(rename="false")]
    public class HabboGamesCom extends SimpleApplication 
    {

        private static var _logEnabled:Boolean = true;

        public static var manifest:Class = manifest_xml$3404cd0acd810b208b6d7352b21006b51398425470;
        public static const explosion0001:Class = explosion0001_png$b4c6ea0aed6fbd6e78b7a85931b313bb578342418;
        public static const explosion0002:Class = explosion0002_png$94ca5bac13cfa951a13bf2a56062ef17575350419;
        public static const explosion0003:Class = explosion0003_png$29fd664afab7007188e8dcf74e422813576532780;
        public static const explosion0004:Class = explosion0004_png$cb38e2cf38099b25e30407e3a1329587565119405;
        public static const explosion0005:Class = explosion0005_png$34b9d302277721ac87a56dd95507e609565272622;
        public static const explosion0006:Class = explosion0006_png$45e5161653fe3de65df6e7a955e444fa562264239;
        public static const explosion0007:Class = explosion0007_png$a5e9335a35ba16dde413db4d30a08a0f563434280;
        public static const explosion0008:Class = explosion0008_png$c9458ed00510c68d1323de214865de82568830889;
        public static const explosion0009:Class = explosion0009_png$fa04f94d0152c58af903195ae5fd04fb568951338;
        public static const explosion0010:Class = explosion0010_png$658054f590a56f6414c2b005c0f0f50e539201328;
        public static const explosion0011:Class = explosion0011_png$002c5c5bdcb16565f5dfc5f6dbecca1f540403633;
        public static const explosion0012:Class = explosion0012_png$0e36a1e2b0c37ce330bca60c826288ce537394738;
        public static const hc_icon:Class = _SafeStr_2412;
        public static const btn_more_games_10:Class = _SafeStr_1819;
        public static const btn_more_games_10_hi:Class = btn_more_games_10_hi_png$1e9868112b5b723dc2d720ccb3a3af96358047520;
        public static const btn_more_games_100:Class = _SafeStr_1818;
        public static const btn_more_games_100_hi:Class = btn_more_games_100_hi_png$ac2c03f8e1b1e571dc55d6318af3a40d1503473014;
        public static const btn_more_games_300:Class = btn_more_games_300_png$13b8a4384d41be8476c42f64c981913f1417077234;
        public static const btn_more_games_300_hi:Class = _SafeStr_1820;
        public static const bg_sky:Class = bg_sky_png$999a3feaa8ccf54069a29aaa20eaca551624320859;
        public static const bg_sunshine:Class = bg_sunshine_png$11386109becfdd0afe0d68d06ebc968d1786447795;
        public static const bg_vista_1:Class = _SafeStr_1803;
        public static const bg_vista_2:Class = _SafeStr_1804;
        public static const bg_vista_3:Class = _SafeStr_1805;
        public static const blue_ball:Class = blue_ball_png$01476d01571ed43918ca28c14c5b5a11275877606;
        public static const blue_ball_rematch:Class = blue_ball_rematch_png$2dcca02fab653a28e83b4f7045d8d49c297301777;
        public static const blue_glove:Class = _SafeStr_1808;
        public static const blue_infobox:Class = blue_infobox_png$fa6eaacd5f55e66bcbdeb1fcc67f094d1902429284;
        public static const blue_square:Class = blue_square_png$ed1f477dababc72cebdf46d812d6743b1437288068;
        public static const gray_ball:Class = _SafeStr_2273;
        public static const gray_infobox:Class = _SafeStr_2274;
        public static const gray_square:Class = gray_square_png$30d6f04b128d68df421d7c344928c3661368109139;
        public static const green_square:Class = _SafeStr_2275;
        public static const load_1:Class = _SafeStr_2573;
        public static const load_2:Class = _SafeStr_2574;
        public static const load_3:Class = _SafeStr_2575;
        public static const load_4:Class = _SafeStr_2576;
        public static const load_5:Class = _SafeStr_2577;
        public static const load_6:Class = _SafeStr_2578;
        public static const load_7:Class = _SafeStr_2579;
        public static const load_8:Class = _SafeStr_2580;
        public static const red_ball:Class = red_ball_png$29ab6c55954e454ed328e6c504d98ac0871279313;
        public static const red_ball_rematch:Class = red_ball_rematch_png$7d3fba8d8599ae6ea2e42b9bb063c4ed978826268;
        public static const red_glove:Class = red_glove_png$0ccbf8f2cf0889531ba66754fd1ed6c41423862749;
        public static const red_infobox:Class = _SafeStr_2782;
        public static const red_square:Class = _SafeStr_2783;
        public static const snowstorm_logo:Class = _SafeStr_2887;
        public static const ui_ball_indicator_bg:Class = _SafeStr_3035;
        public static const ui_ball:Class = _SafeStr_3036;
        public static const ui_exit_down:Class = ui_exit_down_png$bf2081c9afabe84caf6dfb4909ecc0852011389092;
        public static const ui_exit_up:Class = _SafeStr_3037;
        public static const ui_make_balls_down:Class = _SafeStr_3038;
        public static const ui_make_balls_up:Class = _SafeStr_3039;
        public static const ui_me_bg:Class = _SafeStr_3040;
        public static const rematch_1:Class = _SafeStr_2785;
        public static const rematch_2:Class = _SafeStr_2786;
        public static const rematch_3:Class = _SafeStr_2787;
        public static const rematch_4:Class = _SafeStr_2788;
        public static const rematch_5:Class = _SafeStr_2789;
        public static const rematch_6:Class = _SafeStr_2790;
        public static const ui_me_health_0:Class = ui_me_health_0_png$1bd3609adcaa6ce5d087f339e26c44c7382601429;
        public static const ui_me_health_1:Class = ui_me_health_1_png$f571a7e8857a13b167113fa8b8a0a543382755670;
        public static const ui_me_health_2:Class = ui_me_health_2_png$a38d505ebc6b2cdcc43cb7b1fe143248371358679;
        public static const ui_me_health_3:Class = ui_me_health_3_png$e0b2172c67c01b1af8e6e3c0dba5ed01372527696;
        public static const ui_me_health_4:Class = ui_me_health_4_png$96c8ed7a98906326dedb7de8a3ff92a4369535697;
        public static const ui_me_health_5:Class = ui_me_health_5_png$15ee17cabf4ad9227cf90e677b28ac27369657170;
        public static const ui_me_minus_1:Class = _SafeStr_3041;
        public static const ui_me_minus_2:Class = _SafeStr_3042;
        public static const ui_me_minus_3:Class = _SafeStr_3043;
        public static const ui_me_minus_4:Class = _SafeStr_3044;
        public static const ui_me_plus_1:Class = _SafeStr_3045;
        public static const ui_me_plus_2:Class = _SafeStr_3046;
        public static const ui_me_plus_3:Class = _SafeStr_3047;
        public static const ui_me_plus_4:Class = _SafeStr_3048;
        public static const ui_no_balls_1:Class = _SafeStr_3049;
        public static const ui_no_balls_2:Class = _SafeStr_3050;
        public static const ui_no_balls_3:Class = _SafeStr_3051;
        public static const ui_no_balls_4:Class = _SafeStr_3052;
        public static const ui_timer_and_points:Class = _SafeStr_3053;
        public static const arena_8_preview:Class = arena_8_preview_png$1c635fd05c0668b36edf5a5bf31682a81278216419;
        public static const arena_9_preview:Class = _SafeStr_1779;
        public static const arena_10_preview:Class = arena_10_preview_png$f6a6f74776585422326a75aad4437791373600348;
        public static const arena_11_preview:Class = arena_11_preview_png$f3d284e5f4b33b751b85b3058257ef67130268125;
        public static const arena_12_preview:Class = arena_12_preview_png$51f4be662b0146619b7b02fdf97a72382035189086;
        public static const star_empty:Class = _SafeStr_2914;
        public static const star_filled_bronze:Class = _SafeStr_2915;
        public static const star_filled_silver:Class = star_filled_silver_png$fdfade177f86771ecce12076ef756d7c1481734273;
        public static const star_filled_gold:Class = _SafeStr_2916;
        public static const quick_play_background:Class = quick_play_background_png$a9bb3e930f7a04bf311a500666dd1556605556449;
        public static const quick_play_instructions:Class = quick_play_instructions_png$d0bc6a90320a8b862ccebc99caa1cfb9678224616;
        public static const quick_play_teaser:Class = quick_play_teaser_png$49689a06e5796708bac2183a2124df8a1036882051;
        public static const free_games_bg:Class = free_games_bg_png$64bae4c429d372bd592c200dc55a1351250867472;
        public static const leaderboard_bg:Class = leaderboard_bg_png$bcfa3efb065ac63b2c09e4568206523e159809659;
        public static const leaderboard_divider:Class = _SafeStr_2564;
        public static const leaderboard_highlighter:Class = _SafeStr_2565;
        public static const left_black:Class = left_black_png$e2c9f561f46a94da2de36478de3b1ae3494671995;
        public static const left_blue:Class = left_blue_png$e68c76e51c9ae734c5bc2ab14afb4245695806260;
        public static const right_black:Class = _SafeStr_2797;
        public static const right_blue:Class = right_blue_png$92d56c7a6130113cdb6aa723a891f7f61214311489;
        public static const add_friend_icon_blue:Class = _SafeStr_1771;
        public static const add_friend_icon_red:Class = add_friend_icon_red_png$cdf42908793ffe6210df114c7121c4761998516632;
        public static const add_friend_icon_green:Class = add_friend_icon_green_png$f3fdaee145ac3d11947cdc1b746d37a0675324938;
        public static const scroll_down_normal:Class = scroll_down_normal_png$6299bc684f0e00b3601bdbfc7f01a0f11022470638;
        public static const scroll_down_click:Class = scroll_down_click_png$e19892dbc01c83f8f608fc391cff9995411380879;
        public static const scroll_down_hilite:Class = scroll_down_hilite_png$4ec5ffba1d2a09f88cca857c7b9aeba01384900006;
        public static const scroll_down_inactive:Class = _SafeStr_2827;
        public static const scroll_up_normal:Class = _SafeStr_2829;
        public static const scroll_up_click:Class = _SafeStr_2828;
        public static const scroll_up_hilite:Class = scroll_up_hilite_png$9119c7d0f7ff275073a6f72b172d7b751026215517;
        public static const scroll_up_inactive:Class = scroll_up_inactive_png$b5decc0e87fc9d845f567ddbbce9bb4a129991361;
        public static const scroll_left:Class = scroll_left_png$d30d7a08a9d9101ef3bc9b9d5d3aec922141936787;
        public static const scroll_right:Class = scroll_right_png$1ece46859b4dfe8cb609c2dfd1ae3e0b1095732886;
        public static const throw_1_1:Class = _SafeStr_2968;
        public static const throw_1_2:Class = _SafeStr_2969;
        public static const throw_1_3:Class = _SafeStr_2970;
        public static const throw_1_4:Class = _SafeStr_2971;
        public static const throw_2_1:Class = _SafeStr_2972;
        public static const throw_2_2:Class = _SafeStr_2973;
        public static const throw_2_3:Class = _SafeStr_2974;
        public static const throw_2_4:Class = _SafeStr_2975;
        public static const throw_2_5:Class = _SafeStr_2976;
        public static const throw_3_1:Class = _SafeStr_2977;
        public static const throw_3_2:Class = _SafeStr_2978;
        public static const throw_3_3:Class = _SafeStr_2979;
        public static const throw_3_4:Class = _SafeStr_2980;
        public static const throw_3_5:Class = _SafeStr_2981;
        public static const balls_1:Class = balls_1_png$a32225dbe6e85be22c5bb3bdbe4d2e62141072177;
        public static const balls_2:Class = balls_2_png$7cfed3f47acfa16c6950b05be1319522142274482;
        public static const balls_3:Class = balls_3_png$f8935bcadd8f4678cdaf57d7ed4e9f54139249203;
        public static const balls_4:Class = balls_4_png$e8e48b67f2439ad9e62e8cb971edae25140435020;
        public static const balls_5:Class = balls_5_png$73cacf5d21dd909ad54609ebe979dc41128005837;
        public static const move_1:Class = move_1_png$1377a3c18f2e31db4dd28f8b17d09604931163662;
        public static const move_2:Class = move_2_png$35641181ebd4d2cafe3ade59e84c9f48932333199;
        public static const move_3:Class = move_3_png$ac622ddc2e620f6eb9b2e72305708f72937709832;
        public static const move_4:Class = move_4_png$41dbffe6f4e2d1d5f0667b98da5b1d95938912137;
        public static const pagination_ball:Class = pagination_ball_png$5c7f59cde1863571423286cdcfd57e271262836663;
        public static const pagination_ball_hilite:Class = _SafeStr_2707;
        public static const games_main:Class = games_main_xml$5393af59d2c712c582c009236145c7f11853491351;
        public static const instructions_list_item:Class = _SafeStr_2519;
        public static const counter:Class = counter_xml$6bd49e5e52eccbf731d19703e7fb7f83297606489;
        public static const figure:Class = figure_xml$806b7953bc08c732ab7fc35177902cb21567349579;
        public static const snowwar_ending:Class = _SafeStr_2888;
        public static const snowwar_exit:Class = snowwar_exit_xml$1a6a07bf37e09e76defa2910ce45370552247487;
        public static const snowwar_lobby_player:Class = _SafeStr_2891;
        public static const snowwar_lobby_player_team_1:Class = snowwar_lobby_player_team_1_xml$bf3473f124ffcc58de0ad67fcccb1b9a94803051;
        public static const snowwar_lobby_player_team_2:Class = snowwar_lobby_player_team_2_xml$9ca38fbaad2d7540af2ce207fe77a9e895456490;
        public static const snowwar_results_player_team_1:Class = snowwar_results_player_team_1_xml$7b27dcc3e1e27bcb3e2cd644dd3d7760234347723;
        public static const snowwar_results_player_team_2:Class = snowwar_results_player_team_2_xml$931c4fdb537de04c346b1be89ccc1eab226571082;
        public static const snowwar_own_stats:Class = snowwar_own_stats_xml$e34f739e9b69fffb1cfce45fa94f5fd71688016265;
        public static const snowwar_snowballs:Class = _SafeStr_2892;
        public static const snowwar_team_scores:Class = snowwar_team_scores_xml$08b3bb6ed134ea566ec301551aa70409742703060;
        public static const snowwar_timer:Class = snowwar_timer_xml$9fef53f69eff26dc18d8a96b96837f151654852394;
        public static var snowwar_loading_background_xml:Class = snowwar_loading_background_xml$b00e2fe6c58f058f04a4a24eb61bf00e1599510892;
        public static var snowwar_exit_confirmation:Class = snowwar_exit_confirmation_xml$a28110ef5daddc5c44e5ca664d208055609955225;
        public static var snowwar_leaderboard:Class = _SafeStr_2890;
        public static var snowwar_leaderboard_entry:Class = _SafeStr_2889;
        public static var requiredClasses:Array = new Array(HabboGameManagerBootstrap, IIDHabboGameManager);


        public static function set logEnabled(_arg_1:Boolean):void
        {
            _logEnabled = _arg_1;
        }

        public static function get logEnabled():Boolean
        {
            return (false);
        }

        public static function log(... _args):void
        {
        }


    }
}//package 

// _SafeStr_1771 = "add_friend_icon_blue_png$b824826d3809788ce7f81fa07c45d09e-1121944255" (String#20618, DoABC#4)
// _SafeStr_1779 = "arena_9_preview_png$8e0ecc030d1ddff44ac3fed79bd473cd-1111551364" (String#18467, DoABC#4)
// _SafeStr_1803 = "bg_vista_1_png$8d51433d4c687a66bdc6cb078439bb44-1506484167" (String#17728, DoABC#4)
// _SafeStr_1804 = "bg_vista_2_png$c97ebeb0426d8d2d69970afd2e17937c-1509492550" (String#16075, DoABC#4)
// _SafeStr_1805 = "bg_vista_3_png$8b56d0728130a75f0adb3d48cd42cb66-1509371077" (String#19834, DoABC#4)
// _SafeStr_1808 = "blue_glove_png$948f22f4f7f73fe125b90d787c889655-429222808" (String#17780, DoABC#4)
// _SafeStr_1818 = "btn_more_games_100_png$91178e64795ced836532b0a645d684aa-39684496" (String#16775, DoABC#4)
// _SafeStr_1819 = "btn_more_games_10_png$98de1188c8d660cbe17872b1369be6c5-1424754426" (String#20274, DoABC#4)
// _SafeStr_1820 = "btn_more_games_300_hi_png$3c53f3f2d7f02caef5db9ece537ce012-1318335692" (String#21975, DoABC#4)
// _SafeStr_2273 = "gray_ball_png$0ab740122e589e7ea2a7ac20a19610cc-439767411" (String#19498, DoABC#4)
// _SafeStr_2274 = "gray_infobox_png$3dcc57033d03ac3c1afa94f70221aed4-250654211" (String#18624, DoABC#4)
// _SafeStr_2275 = "green_square_png$241199d12e664cd3e15d6fd251d47ab6-426291643" (String#17793, DoABC#4)
// _SafeStr_2412 = "hc_icon_png$0e3868e96b0bbb45a558e35c2dff4c60-396571089" (String#22357, DoABC#4)
// _SafeStr_2519 = "instructions_list_item_xml$192919caa5030d3001abb8ed434f7b60-744725356" (String#22448, DoABC#4)
// _SafeStr_2564 = "leaderboard_divider_png$cce10f64762169cce73f91a29c31ba20-1532990287" (String#16453, DoABC#4)
// _SafeStr_2565 = "leaderboard_highlighter_png$0539409967baa1b8de659e75270b0877-1867958903" (String#22352, DoABC#4)
// _SafeStr_2573 = "load_1_png$a2d9d85160a3b63a7d1b3c0f14bb3249-1242879804" (String#15929, DoABC#4)
// _SafeStr_2574 = "load_2_png$87150333a73c24135e00bfc1ae4cf91b-1241709755" (String#15841, DoABC#4)
// _SafeStr_2575 = "load_3_png$89ba9350a3ee7ae584fd31664840cb00-1244718138" (String#21862, DoABC#4)
// _SafeStr_2576 = "load_4_png$db49beb2bac3974acd46a4a67532c4cf-1244564921" (String#18568, DoABC#4)
// _SafeStr_2577 = "load_5_png$1f858984ecf4a26cd2ed43b1a4dedbec-1255978304" (String#17539, DoABC#4)
// _SafeStr_2578 = "load_6_png$065c15c4af7496b4da5d40d11cf1421a-1254775487" (String#16788, DoABC#4)
// _SafeStr_2579 = "load_7_png$8828b58e41c3a60534ee5a2738109889-1257783870" (String#15918, DoABC#4)
// _SafeStr_2580 = "load_8_png$a5583d76f0aef0293f2adfa27ec7f83a-1257663421" (String#22783, DoABC#4)
// _SafeStr_2707 = "pagination_ball_hilite_png$4d1f67e8e1b36d3546eb489f03208b43-792655227" (String#21532, DoABC#4)
// _SafeStr_2782 = "red_infobox_png$d71c23f2747f81e6bfb83a4b94c75235-1135103207" (String#21849, DoABC#4)
// _SafeStr_2783 = "red_square_png$8f0d1e1ad239a5d9e115afc0a05741e4-1837943369" (String#17427, DoABC#4)
// _SafeStr_2785 = "rematch_1_png$a1d594f2b8414102b1e88e2fcf2aa4d3-879064378" (String#22171, DoABC#4)
// _SafeStr_2786 = "rematch_2_png$1f624c7ebfeb38e982de835dc71ff087-873667257" (String#18926, DoABC#4)
// _SafeStr_2787 = "rematch_3_png$9c53abbdfa01105f70d3b4d7599ed83b-872481344" (String#17660, DoABC#4)
// _SafeStr_2788 = "rematch_4_png$35a1e6491d16946d5aa0608122c68081-876555199" (String#21003, DoABC#4)
// _SafeStr_2789 = "rematch_5_png$96d1f48c318961d70de9ce284a912931-875352894" (String#21681, DoABC#4)
// _SafeStr_2790 = "rematch_6_png$2854933ad97400b04de333d29c408953-886765757" (String#20699, DoABC#4)
// _SafeStr_2797 = "right_black_png$2815898cee33439255b7d1b76648a78d-2125467634" (String#22041, DoABC#4)
// _SafeStr_2827 = "scroll_down_inactive_png$87b0dc91495b0eff3b05f9dbfe98d931-2109142422" (String#16515, DoABC#4)
// _SafeStr_2828 = "scroll_up_click_png$a115412774b8585e97190205d1fcda59-1444871440" (String#17550, DoABC#4)
// _SafeStr_2829 = "scroll_up_normal_png$cb1d7696866a8c84bb08d7a8c3f134ea-2028957051" (String#22602, DoABC#4)
// _SafeStr_2887 = "snowstorm_logo_png$e14f8045622b799cff37583f2f981bdc-1873708488" (String#18592, DoABC#4)
// _SafeStr_2888 = "snowwar_ending_xml$beff08aff1fa5ab9559d5c71dd172d12-1705489418" (String#19736, DoABC#4)
// _SafeStr_2889 = "snowwar_leaderboard_entry_xml$1ffa0518aa02b6f2a6ad63e68bcd5532-841620729" (String#22564, DoABC#4)
// _SafeStr_2890 = "snowwar_leaderboard_xml$702ef69e8ff1706c95c6726b48354350-1566614254" (String#20938, DoABC#4)
// _SafeStr_2891 = "snowwar_lobby_player_xml$b60456ed5e4f96ff040fdbb2c1400952-1062871541" (String#16649, DoABC#4)
// _SafeStr_2892 = "snowwar_snowballs_xml$2707fe18f5616bf65736268df2d5aebf-2127757562" (String#16638, DoABC#4)
// _SafeStr_2914 = "star_empty_png$a4562419ae0ba85ef8d4c63200704ad8-890501284" (String#22183, DoABC#4)
// _SafeStr_2915 = "star_filled_bronze_png$1a4b8df7d9cc0aea7ef7823d1cc307c6-2035735402" (String#17214, DoABC#4)
// _SafeStr_2916 = "star_filled_gold_png$bf62bc260ea1ef9eeea7ae97fd178d4d-2061688404" (String#17460, DoABC#4)
// _SafeStr_2968 = "throw_1_1_png$060844a662479a10ec09ac66c69d7d6e-890699763" (String#19745, DoABC#4)
// _SafeStr_2969 = "throw_1_2_png$f9d63e524dbdb2dced6cb28e426431cc-889513842" (String#19714, DoABC#4)
// _SafeStr_2970 = "throw_1_3_png$f34540d423553aa174c20fa0fe8baaef-892505329" (String#20173, DoABC#4)
// _SafeStr_2971 = "throw_1_4_png$42a700f7c7ebaa595911ba0d86baab79-891335800" (String#19749, DoABC#4)
// _SafeStr_2972 = "throw_2_1_png$fb506e4cc8a79e178609eb14a49770f4-174897970" (String#21865, DoABC#4)
// _SafeStr_2973 = "throw_2_2_png$d538e0e0ac82c9f4eb39768975eb83a2-169517233" (String#20135, DoABC#4)
// _SafeStr_2974 = "throw_2_3_png$b30eff7d71e3050abcbc710c78e14efd-168314936" (String#17682, DoABC#4)
// _SafeStr_2975 = "throw_2_4_png$d942bf3fc394a723014c0b3db232d229-168194487" (String#16993, DoABC#4)
// _SafeStr_2976 = "throw_2_5_png$f90a2fb7a33604a16c7fb38fd5376215-171186486" (String#16328, DoABC#4)
// _SafeStr_2977 = "throw_3_1_png$2ff63039b79e3ae29c7205d80d60ff4e-1598178417" (String#16735, DoABC#4)
// _SafeStr_2978 = "throw_3_2_png$fc013d2037948bdb8d93df76cc4609aa-1601203704" (String#20170, DoABC#4)
// _SafeStr_2979 = "throw_3_3_png$8b5bf26e037ce71342ed7162ab8292ee-1601049975" (String#16620, DoABC#4)
// _SafeStr_2980 = "throw_3_4_png$8800cabe60ef7a80f882750aaadf5147-1595685622" (String#20306, DoABC#4)
// _SafeStr_2981 = "throw_3_5_png$78ba193c166380c38dce4aaecfa409c1-1594499701" (String#22170, DoABC#4)
// _SafeStr_3035 = "ui_ball_indicator_bg_png$145f3a672012bc09fa1f8a6187abb4b6-128317386" (String#22611, DoABC#4)
// _SafeStr_3036 = "ui_ball_png$f513e8f4e6e42f3dc25174a119564aab-460906692" (String#19782, DoABC#4)
// _SafeStr_3037 = "ui_exit_up_png$a1ae9f17d3bbd5d9c641019f5cfa51d3-1542455187" (String#22342, DoABC#4)
// _SafeStr_3038 = "ui_make_balls_down_png$18f6bdd242de7dce66a1d2568b9b1747-529165777" (String#15849, DoABC#4)
// _SafeStr_3039 = "ui_make_balls_up_png$9c4b48351076f2343364abf5b962ecfd-11475696" (String#18828, DoABC#4)
// _SafeStr_3040 = "ui_me_bg_png$89320b4593b4287d8ecb6b6e54bc3257-1239847203" (String#17848, DoABC#4)
// _SafeStr_3041 = "ui_me_minus_1_png$66f2cbe50f59b09269519cce4e469b1c-339742944" (String#21147, DoABC#4)
// _SafeStr_3042 = "ui_me_minus_2_png$29bbbff7f2af487eea8b15e80d08117c-343816287" (String#19212, DoABC#4)
// _SafeStr_3043 = "ui_me_minus_3_png$4642f2c51044e442ba17588cbdfea50b-342630878" (String#18406, DoABC#4)
// _SafeStr_3044 = "ui_me_minus_4_png$7f0ab8bc92e361ae16d28a18ab7b7188-337496413" (String#22009, DoABC#4)
// _SafeStr_3045 = "ui_me_plus_1_png$2bb4372a8aefe4f31708cf2157187882-1015649196" (String#22042, DoABC#4)
// _SafeStr_3046 = "ui_me_plus_2_png$1be73356c9e76ee7a9c2036d78604bb3-1015528235" (String#21027, DoABC#4)
// _SafeStr_3047 = "ui_me_plus_3_png$d34b31d8e4db8f2348e26ccc334e240c-1018536106" (String#21512, DoABC#4)
// _SafeStr_3048 = "ui_me_plus_4_png$352189a21ebd3bff5656fe27a1d00f1b-1017333801" (String#17512, DoABC#4)
// _SafeStr_3049 = "ui_no_balls_1_png$9f611f880c7c478de506899cb2014d1d-1339748939" (String#20486, DoABC#4)
// _SafeStr_3050 = "ui_no_balls_2_png$be40e7a330ec4da668300b247ed0826f-1338547146" (String#18412, DoABC#4)
// _SafeStr_3051 = "ui_no_balls_3_png$5a97f04408e8ef07d2e8ff470e6b27cc-1338409801" (String#20324, DoABC#4)
// _SafeStr_3052 = "ui_no_balls_4_png$fb926bf088cc1c353ee04f6076c1763e-1341434064" (String#16172, DoABC#4)
// _SafeStr_3053 = "ui_timer_and_points_png$72a16dc4e8909c630a647ded1bd7a21d-781813830" (String#15832, DoABC#4)


