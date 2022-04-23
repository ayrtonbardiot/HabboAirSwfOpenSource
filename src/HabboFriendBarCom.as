// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//HabboFriendBarCom

package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboFriendBarBootstrap;
    import com.sulake.iid.IIDHabboFriendBar;

    [SecureSWF(rename="false")]
    public class HabboFriendBarCom extends SimpleApplication 
    {

        public static var manifest:Class = manifest_xml$a9a0345113fa914485cdeca8c5272d6c1136218562;
        public static var bar_xml:Class = bar_xml$933a95f006ced7457c0dda35d62d3f4c287888671;
        public static var new_bar_xml:Class = _SafeStr_2675;
        public static var entity_xml:Class = _SafeStr_2072;
        public static var new_friend_entity_xml:Class = new_friend_entity_xml$1f3e7715078a1dfea5bb5de302fed19d880894541;
        public static var add_friends_tab_xml:Class = add_friends_tab_xml$c0481392325f5f26e4582926683c3d4d1990703941;
        public static var friend_requests_tab_xml:Class = friend_requests_tab_xml$6fcbb44004feece288ca5f8524ac23dd1989223063;
        public static var friend_request_tab_xml:Class = _SafeStr_2109;
        public static var toggle_xml:Class = toggle_xml$d27ed2e5bab4d23231f86b107479c0ba1646885166;
        public static var facebook_piece_xml:Class = facebook_xml$4a377b36feb568a4b22401a18a6275e11223301493;
        public static var controls_piece_xml:Class = _SafeStr_2013;
        public static var new_controls_piece_xml:Class = new_controls_xml$d7917af4019431306327187c83e78f251986040358;
        public static var message_piece_xml:Class = message_xml$68babec9dc6319e26a5e72ab245ac01f958981706;
        public static var search_friends_tab_xml:Class = _SafeStr_2832;
        public static var new_search_friends_tab_xml:Class = _SafeStr_2679;
        public static var all_friends_tab_xml:Class = _SafeStr_1777;
        public static var new_all_friends_tab_xml:Class = _SafeStr_2674;
        public static var new_open_messenger_tab_xml:Class = _SafeStr_2678;
        public static var ach_notification_icon_png:Class = _SafeStr_1760;
        public static var plus_friend_icon_png:Class = _SafeStr_2737;
        public static var add_friends_icon_png:Class = _SafeStr_1773;
        public static var find_friends_icon_png:Class = _SafeStr_1772;
        public static var fb_icon_small_png:Class = _SafeStr_2085;
        public static var friends_icon_png:Class = friends_icon_png$ba89ec2d4acccaeeab887064d609cd4b770850710;
        public static var icon_friendlist_png:Class = friendlist_png$449a3de2c3a91a4a02830ae619c0d77c1988835839;
        public static var icon_friendlist_notify_0_png:Class = _SafeStr_2115;
        public static var icon_friendlist_notify_1_png:Class = _SafeStr_2116;
        public static var icon_friendlist_hover_0_png:Class = friendlist_hover_0_png$c808ad107234a2e4fb909e46d666dca72067634733;
        public static var icon_friendlist_hover_1_png:Class = friendlist_hover_1_png$634ac78c57456edd9e0e1eda870d142a2064642734;
        public static var icon_friendlist_hover_2_png:Class = friendlist_hover_2_png$ccd6be8889d4d1a2403de7d4723d981f2064764207;
        public static var icon_friendlist_hover_3_png:Class = friendlist_hover_3_png$507cb6b39a829bb028f5c7ba0c5d1e9a2069898664;
        public static var icon_messenger_png:Class = _SafeStr_2633;
        public static var icon_messenger_notify_0_png:Class = messenger_notify_0_png$5a2e5435f14613540b63163295bec7541814713489;
        public static var icon_messenger_notify_1_png:Class = messenger_notify_1_png$0713cd5641c721c1074e751fb33e8dee1815916306;
        public static var search_friends_icon_png:Class = _SafeStr_2831;
        public static var all_friends_icon_png:Class = all_friends_icon_png$30be61d90604e9b5cb250b8e018798b6524598516;
        public static var user_list_xml:Class = user_list_xml$d3358fdd5a2c34a2ba24fad7a99440ca2061806968;
        public static var user_entry_xml:Class = user_entry_xml$6e20e7742f2e6fb04d7fb90d1daba2fb1753012836;
        public static var competition_user_popup_xml:Class = competition_user_popup_xml$2cd466650e86cc54be5eae64fd0875f5842182690;
        public static var on_duty_guide_user_popup_xml:Class = _SafeStr_2698;
        public static var achievement_competition_prizes_xml:Class = achievement_competition_prizes_xml$ecdccdae2ce00ff552f24e45883e24921968810537;
        public static var avatar_image_xml:Class = avatar_image_xml$50c4fb43f054841c07299dcae86f5c6e317549037;
        public static var community_goal_xml:Class = community_goal_xml$02015d0f8e65cae7f6dd0f0c391ede9f110413969;
        public static var community_goal_voting_xml:Class = _SafeStr_2010;
        public static var daily_quest_xml:Class = _SafeStr_2024;
        public static var element_dailyquest_xml:Class = _SafeStr_2067;
        public static var expiring_catalog_page_xml:Class = _SafeStr_2078;
        public static var expiring_catalog_page_small_xml:Class = _SafeStr_2077;
        public static var landing_view_generic_reception_xml:Class = landing_view_generic_reception_xml$5e91844a484b9026e87909eef4c2acb1168051309;
        public static var catalog_promo_xml:Class = _SafeStr_1887;
        public static var catalog_promo_small_xml:Class = _SafeStr_1886;
        public static var campaign_promo_xml:Class = _SafeStr_1884;
        public static var moving_object_xml:Class = _SafeStr_2657;
        public static var moving_object_floating_xml:Class = moving_object_floating_xml$a298f89e6a73026dbd4bc9dbab25173e1260570381;
        public static var next_ltd_available_xml:Class = next_ltd_available_xml$4dc8b81d18325bf7c170f92405ab0d9082005824;
        public static var safety_quiz_promo_xml:Class = _SafeStr_2824;
        public static var citizenship_welcome_xml:Class = _SafeStr_1986;
        public static var level_up_xml:Class = _SafeStr_2569;
        public static var talent_track_xml:Class = talent_track_xml$f8845831fa894425d54b606a50517f831325293730;
        public static var track_promo_xml:Class = track_promo_xml$0a6a82241a6e16132133644404efb7071854444663;
        public static var task_progress_dialog_xml:Class = task_progress_dialog_xml$07c55292d73a2e9dee3df392202e8c9e2049621082;
        public static var tour_task_progress_dialog_xml:Class = _SafeStr_3003;
        public static var landing_view_default_dynamic_layout_xml:Class = _SafeStr_2540;
        public static var habbo_moderation_promo_xml:Class = habbo_moderation_promo_xml$3bed7ad8be73a3ad28087ee5a63c33f41800630331;
        public static var habbo_talents_promo_xml:Class = habbo_talents_promo_xml$9c09c8339723c94182c5c0cbbd93fe8c1816904132;
        public static var habbo_way_promo_xml:Class = habbo_way_promo_xml$e2e84b7175b30faa6f82083aa2a384de1211268156;
        public static var dynamic_widget_grid_xml:Class = dynamic_widget_grid_xml$eefc487fd4ee6c6264ea64469fabcee11641730249;
        public static var pixel_removal_credit_promo_xml:Class = _SafeStr_2725;
        public static var pixel_removal_promo_xml:Class = _SafeStr_2726;
        public static var fast_food_game_promo_xml:Class = _SafeStr_2083;
        public static var room_hopper_network_xml:Class = room_hopper_network_xml$e79dd15c5598cf2859442d28805269b4802493795;
        public static var landing_view_jetset_xml:Class = landing_view_jetset_xml$b6b714db7f9b23cac0fce121f2cd3638614244919;
        public static var generic_widget_xml:Class = _SafeStr_2265;
        public static var widget_container_widget_xml:Class = widget_container_widget_xml$c6a06563735d43c7844155c89d2aace629731509;
        public static var element_bodytext_xml:Class = _SafeStr_2064;
        public static var element_button_xml:Class = element_button_xml$e575244d367e671eb590dacf8638f6291107022541;
        public static var element_caption_xml:Class = element_caption_xml$d2be11eaedaf734950b39454ccc0d67c175002127;
        public static var element_image_xml:Class = element_image_xml$0f2f1d102cfc0874db66d87d3a30fc481834874930;
        public static var element_link_xml:Class = _SafeStr_2068;
        public static var element_spacing_xml:Class = element_spacing_xml$1f076b5402f24bb0fdf4c1f1b7183739217777898;
        public static var element_subcaption_xml:Class = element_subcaption_xml$7ece97699f1a1e5dc07f4ea186095cec8878001;
        public static var element_timer_xml:Class = element_timer_xml$d63db6df34c53f38cc206621327615cd651235624;
        public static var element_title_xml:Class = _SafeStr_2070;
        public static var element_rewardbadge_xml:Class = _SafeStr_2069;
        public static var element_concurrentusersmeter_xml:Class = element_concurrentusersmeter_xml$6ad018f2bdca854a7ee28b400a19daf51750888647;
        public static var element_concurrentusersinfo_xml:Class = _SafeStr_2066;
        public static var dynamic_widget_grid_separator_xml:Class = dynamic_widget_grid_separator_xml$e41a4fd287ef02e7b0be6bc930114285498696163;
        public static var epic_popup_frame_xml:Class = _SafeStr_2073;
        public static var landing_view_furnimatic_xml:Class = _SafeStr_2541;
        public static var initialization_error_xml:Class = _SafeStr_2517;
        public static var element_community_goal_score_xml:Class = _SafeStr_2065;
        public static var promo_article_xml:Class = _SafeStr_2761;
        public static var bonus_rare_promo_xml:Class = bonus_rare_promo_xml$d3ed4f23638713885f7beb499e6c49731316060104;
        public static var groupforum_thread_list_item_xml:Class = _SafeStr_2967;
        public static var groupforum_forum_list_item_xml:Class = forum_list_item_xml$156bb7d644988743d4b304ed4407bb991732142182;
        public static var groupforum_main_view_xml:Class = main_view_xml$968f00d3d9a71685f2d58f441555f5501149044073;
        public static var groupforum_message_list_item_xml:Class = _SafeStr_2632;
        public static var groupforum_compose_message_xml:Class = compose_message_view_xml$e4a61dfe66ca113d58229a0b4fe49bb7317840526;
        public static var groupforum_forum_settings_xml:Class = _SafeStr_2098;
        public static var requiredClasses:Array = new Array(HabboFriendBarBootstrap, IIDHabboFriendBar);


    }
}//package 

// _SafeStr_1760 = "ach_notification_icon_png$92ba54327b2de5a862b983cc5fd6a797-551857571" (String#19092, DoABC#4)
// _SafeStr_1772 = "add_friends_icon_png$3e3b897e28f7ff7c09351199641eab1f-257532428" (String#19330, DoABC#4)
// _SafeStr_1773 = "add_friends_icon_png$793192ee2207923531b6b19d8f2c3e54-1312776330" (String#17583, DoABC#4)
// _SafeStr_1777 = "all_friends_tab_xml$90fc93379327b28636285e35a8972cc7-1669219259" (String#22856, DoABC#4)
// _SafeStr_1884 = "campaign_promo_xml$8c905ebddc2aee4ef515c6110d01e5c9-525876070" (String#17192, DoABC#4)
// _SafeStr_1886 = "catalog_promo_small_xml$48bc313a6a7a47736369e1d4c1a894e7-1938672103" (String#21371, DoABC#4)
// _SafeStr_1887 = "catalog_promo_xml$3cafb6d283a9e59ac353b042c1fa7049-938991679" (String#20310, DoABC#4)
// _SafeStr_1986 = "citizenship_welcome_xml$1857e7b96bf6ca7af02c93b5978bcd35-1179054813" (String#19618, DoABC#4)
// _SafeStr_2010 = "community_goal_voting_xml$06858ea058c5d03507bcadd3136a8435-23531307" (String#16404, DoABC#4)
// _SafeStr_2013 = "controls_xml$233a9439ecc7ea74718cab1228030e78-2099876507" (String#21348, DoABC#4)
// _SafeStr_2024 = "daily_quest_xml$4d68d3516868cce83714cf412a1a4c5c-2128381674" (String#22532, DoABC#4)
// _SafeStr_2064 = "element_bodytext_xml$4c6c6e0a2b90d59e517162952105903c-1484209368" (String#17777, DoABC#4)
// _SafeStr_2065 = "element_community_goal_score_xml$a4b2799ae115b2767709f8389d06efe3-1124749349" (String#16259, DoABC#4)
// _SafeStr_2066 = "element_concurrentusersinfo_xml$d4791cc4451bde495b9b1abb24a2a15c-648752138" (String#15969, DoABC#4)
// _SafeStr_2067 = "element_dailyquest_xml$61d78e655bb1c73809cd85ca1183e2ac-1387934474" (String#19333, DoABC#4)
// _SafeStr_2068 = "element_link_xml$c10ffadd791d30ce162fba831a2acb96-299322043" (String#22293, DoABC#4)
// _SafeStr_2069 = "element_rewardbadge_xml$5441756dc1eda2dc3f805a0a652f56ae-147890055" (String#18418, DoABC#4)
// _SafeStr_2070 = "element_title_xml$45114473facbda4a9f5f9dde0638e236-1603580995" (String#16251, DoABC#4)
// _SafeStr_2072 = "entity_xml$ef43ba4740bae0297b4bb3073e4bff99-1199136193" (String#17478, DoABC#4)
// _SafeStr_2073 = "epic_popup_frame_xml$930b256f5910baae2018bd91591a865c-1282361683" (String#18874, DoABC#4)
// _SafeStr_2077 = "expiring_catalog_page_small_xml$7132e96f54f6fb061dd8f42cd0b6ed14-2057503190" (String#20759, DoABC#4)
// _SafeStr_2078 = "expiring_catalog_page_xml$860206770ae3b0445aefe83cc690ce7a-1901339118" (String#20365, DoABC#4)
// _SafeStr_2083 = "fastfood_game_promo_xml$4d9da0779c0cad56cf0c405f5ec25c2f-713715069" (String#18236, DoABC#4)
// _SafeStr_2085 = "fb_icon_small_png$6bab9a2570441862de30309c6493ddc5-1159442961" (String#19826, DoABC#4)
// _SafeStr_2098 = "forum_settings_xml$9f017f93b8f2d6539d5ac0e4c049850d-1697687913" (String#18857, DoABC#4)
// _SafeStr_2109 = "friend_request_tab_xml$de0bd193c9e0dce9dfe3bd878985c231-1161758562" (String#18417, DoABC#4)
// _SafeStr_2115 = "friendlist_notify_0_png$257933fe250633bba37a46895f2c1854-1993582320" (String#19985, DoABC#4)
// _SafeStr_2116 = "friendlist_notify_1_png$0db11cc4918b8cdfc270dcf0375f89bf-1992380015" (String#21792, DoABC#4)
// _SafeStr_2265 = "generic_widget_xml$0be8198b12774ccf160ca55fe34296fa-656033258" (String#18220, DoABC#4)
// _SafeStr_2517 = "initialization_error_xml$81023d092859f2da857873c1742f60c4-350120303" (String#19916, DoABC#4)
// _SafeStr_2540 = "landing_view_default_dynamic_layout_xml$9ffd6f4859a370481b607df188dc00c2-77997968" (String#22687, DoABC#4)
// _SafeStr_2541 = "landing_view_furnimatic_xml$bb5a2c9f1068bd171fbb5e0ad9b8a26a-321929404" (String#18597, DoABC#4)
// _SafeStr_2569 = "level_up_xml$aaf9dced69bcbc1abc02479426e5c81c-847336788" (String#20987, DoABC#4)
// _SafeStr_2632 = "message_list_item_xml$a79e2be9d3e308f4d8004a5f67a9437f-1266593448" (String#22845, DoABC#4)
// _SafeStr_2633 = "messenger_png$e2d920678cd7cd09eeb1d546b7ba15b5-1605172898" (String#19505, DoABC#4)
// _SafeStr_2657 = "moving_object_xml$2a2667bb79ffe3be6e223ed9a03fd1f2-911506886" (String#20570, DoABC#4)
// _SafeStr_2674 = "new_all_friends_tab_xml$e0e2bfadce9f56673784bfd9f23184f5-1608435932" (String#20644, DoABC#4)
// _SafeStr_2675 = "new_bar_xml$c41e19c552d2624c592fb2f7a6cabe93-1332749954" (String#16371, DoABC#4)
// _SafeStr_2678 = "new_open_messenger_tab_xml$4e7f2c57cca3aa4d2f607f8933f91a28-1803225201" (String#22153, DoABC#4)
// _SafeStr_2679 = "new_search_friends_tab_xml$da9b50ba2fb70a130c1535164e95e4bf-1454605009" (String#19341, DoABC#4)
// _SafeStr_2698 = "on_duty_guide_user_popup_xml$999c262e84e444aadb334b2246826a47-432892994" (String#21495, DoABC#4)
// _SafeStr_2725 = "pixel_removal_credit_promo_xml$837e908dbb5847b53ae0b32270001b28-107546931" (String#19628, DoABC#4)
// _SafeStr_2726 = "pixel_removal_promo_xml$501d2fe6e0d2e7f18a5f95cd91ed2800-1146345617" (String#17074, DoABC#4)
// _SafeStr_2737 = "plus_friend_icon_png$c339be52ee717a8842bab1e9eebfc770-1850129278" (String#16709, DoABC#4)
// _SafeStr_2761 = "promo_article_xml$b7f1d970a293a8f4935c9bc9e54c6df8-702869076" (String#17790, DoABC#4)
// _SafeStr_2824 = "safety_quiz_promo_xml$31bab6f724360d5eeb096e36cecdb5f0-624706792" (String#22333, DoABC#4)
// _SafeStr_2831 = "search_friends_icon_png$b12517eaada2bd9f5469703eaccc40c0-1905400619" (String#22722, DoABC#4)
// _SafeStr_2832 = "search_friends_tab_xml$f9a5b5473cab95510693d5022f4d7291-1702367058" (String#20645, DoABC#4)
// _SafeStr_2967 = "thread_list_item_xml$676c85d0c008620fd6e279d4e9e60e7b-1579227215" (String#19312, DoABC#4)
// _SafeStr_3003 = "tour_task_progress_dialog_xml$fdf3751ce40ea6196bf197b5698b16c9-1634449213" (String#21887, DoABC#4)


