// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//HabboUserDefinedRoomEventsCom

package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboUserDefinedRoomEventsBootstrap;
    import com.sulake.iid.IIDHabboUserDefinedRoomEvents;

    [SecureSWF(rename="false")]
    public class HabboUserDefinedRoomEventsCom extends SimpleApplication 
    {

        public static var icon_action_png:Class = _SafeStr_2432;
        public static var icon_condition_png:Class = _SafeStr_2438;
        public static var icon_trigger_png:Class = _SafeStr_2478;
        public static var move_0_png:Class = move_0_png$e310679021be610a714974ba64ab2ad41358528612;
        public static var move_2_png:Class = move_2_png$5fa91618f618c94100046d750a7f38d01356723046;
        public static var move_4_png:Class = move_4_png$c950a06a21b9fa2e486aacf8692c589f1346249312;
        public static var move_6_png:Class = move_6_png$df0954afe1bb8c03531ead40ab9c8b201343362402;
        public static var move_diag_png:Class = move_diag_png$3616bb0a7dfb421ad210de2fcffeeec01662653957;
        public static var move_rnd_png:Class = _SafeStr_2655;
        public static var move_vrt_png:Class = _SafeStr_2656;
        public static var rotate_ccw_png:Class = rotate_ccw_png$1513cd6bb04ad4c460ea55af2ce46e85673295957;
        public static var rotate_cw_png:Class = rotate_cw_png$8aa0291222b4c08d9fc0ac1bb4f11ac4276917956;
        public static var slider_bg_png:Class = slider_bg_png$20b6762de38488e5db5d79cfabde77f5248668127;
        public static var slider_obj_png:Class = _SafeStr_2877;
        public static var manifest:Class = manifest_xml$9ecd1b2ae13215e42f6a0f363e49c8cd1215141357;
        public static var ude_main_xml:Class = _SafeStr_3029;
        public static var ude_help_xml:Class = ude_help_xml$5fe802f4ade8f98c913fcbacfa71ee21752365621;
        public static var ude_slider_xml:Class = ude_slider_xml$2b9302c7e51d7e67f16825c99f43f2101408484821;
        public static var ude_trigger_inputs_0_xml:Class = ude_trigger_inputs_0_xml$41ae549b2b27b7958bef7589d7eb6ccf882763253;
        public static var ude_trigger_inputs_3_xml:Class = ude_trigger_inputs_3_xml$4b6f02a838941b0822d6a69daac92262994782346;
        public static var ude_trigger_inputs_6_xml:Class = ude_trigger_inputs_6_xml$898f93baebd59a41f689bee822d8a775996233743;
        public static var ude_trigger_inputs_7_xml:Class = ude_trigger_inputs_7_xml$b011fd18a35640353d5dcacb34414ddb997411470;
        public static var ude_trigger_inputs_12_xml:Class = _SafeStr_3031;
        public static var ude_trigger_inputs_10_xml:Class = _SafeStr_3030;
        public static var ude_trigger_inputs_13_xml:Class = _SafeStr_3032;
        public static var ude_trigger_inputs_14_xml:Class = _SafeStr_3033;
        public static var ude_action_inputs_3_xml:Class = _SafeStr_3024;
        public static var ude_action_inputs_4_xml:Class = _SafeStr_3025;
        public static var ude_action_inputs_6_xml:Class = _SafeStr_3026;
        public static var ude_action_inputs_7_xml:Class = _SafeStr_3027;
        public static var ude_action_inputs_9_xml:Class = _SafeStr_3028;
        public static var ude_action_inputs_13_xml:Class = _SafeStr_3010;
        public static var ude_action_inputs_14_xml:Class = _SafeStr_3011;
        public static var ude_action_inputs_16_xml:Class = _SafeStr_3012;
        public static var ude_action_inputs_17_xml:Class = _SafeStr_3014;
        public static var ude_action_inputs_17_reward_xml:Class = _SafeStr_3013;
        public static var ude_action_inputs_19_xml:Class = _SafeStr_3015;
        public static var ude_action_inputs_20_xml:Class = _SafeStr_3016;
        public static var ude_action_inputs_21_xml:Class = _SafeStr_3017;
        public static var ude_action_inputs_22_xml:Class = _SafeStr_3018;
        public static var ude_action_inputs_23_xml:Class = _SafeStr_3019;
        public static var ude_action_inputs_24_xml:Class = _SafeStr_3020;
        public static var ude_action_inputs_25_xml:Class = _SafeStr_3021;
        public static var ude_action_inputs_26_xml:Class = _SafeStr_3022;
        public static var ude_action_inputs_27_xml:Class = _SafeStr_3023;
        public static var ude_condition_inputs_0_xml:Class = ude_condition_inputs_0_xml$5cac1b5feb838eb37422e7f77c0466921103004016;
        public static var ude_condition_inputs_3_xml:Class = ude_condition_inputs_3_xml$823ded5b274e36fa0e1a526660ce26881079298293;
        public static var ude_condition_inputs_4_xml:Class = ude_condition_inputs_4_xml$b35010bc4e16fabc06d323ce8a503e661080442740;
        public static var ude_condition_inputs_5_xml:Class = ude_condition_inputs_5_xml$566d5920f2414241b4705f90f8c0b7ba1081087755;
        public static var ude_condition_inputs_6_xml:Class = ude_condition_inputs_6_xml$5f2de4e33a4c3105570287c7bdbdced41073876874;
        public static var ude_condition_inputs_7_xml:Class = ude_condition_inputs_7_xml$fbbab154dd7b3aaebfdc5ee1afbb9e841075602953;
        public static var ude_condition_inputs_9_xml:Class = ude_condition_inputs_9_xml$deca3275dd12e63fd20eb298b7da549e1077916943;
        public static var ude_condition_inputs_11_xml:Class = ude_condition_inputs_11_xml$4f6bb9def14b05aa739764fd4aa41537505741932;
        public static var ude_condition_inputs_12_xml:Class = ude_condition_inputs_12_xml$0e023d91143ff0f575779a18ede1d19f506952419;
        public static var ude_condition_inputs_18_xml:Class = ude_condition_inputs_18_xml$7c000f8153dea3bb55d008836fe5bfd0513468389;
        public static var ude_condition_inputs_24_xml:Class = ude_condition_inputs_24_xml$204ee9838900031866b1c902d7929a1d470180482;
        public static var ude_condition_inputs_25_xml:Class = ude_condition_inputs_25_xml$286ef23f9d5e8d1007063c4f1dd93851470833409;
        public static var requiredClasses:Array = new Array(HabboUserDefinedRoomEventsBootstrap, IIDHabboUserDefinedRoomEvents);


    }
}//package 

// _SafeStr_2432 = "icon_action_png$1becf57b7755bfa5e0327f5aa70eeb70-1482602144" (String#16312, DoABC#4)
// _SafeStr_2438 = "icon_condition_png$7c29ae03cec576f4b0401260eb844e7f-612371081" (String#17495, DoABC#4)
// _SafeStr_2478 = "icon_trigger_png$7878abb39fb44eba9bdb3fb523017b3b-617923116" (String#16950, DoABC#4)
// _SafeStr_2655 = "move_rnd_png$a3f02513cf8bdbe8c5b1f6e45ef4690f-1703268820" (String#22686, DoABC#4)
// _SafeStr_2656 = "move_vrt_png$c40790bcdc8622deafa8c8dec083d40b-24119620" (String#18698, DoABC#4)
// _SafeStr_2877 = "slider_obj_png$af4d187a36c5f6ed0eb55d998389e55d-657138637" (String#20106, DoABC#4)
// _SafeStr_3010 = "ude_action_inputs_13_xml$7701e0e51cd030dcdfb7d627562a3209-86786713" (String#22573, DoABC#4)
// _SafeStr_3011 = "ude_action_inputs_14_xml$8271ab15ea3ee4373705f618231ad7db-85092890" (String#16041, DoABC#4)
// _SafeStr_3012 = "ude_action_inputs_16_xml$3dfd9625cc453a5c534333d39e1b197c-91626268" (String#20354, DoABC#4)
// _SafeStr_3013 = "ude_action_inputs_17_reward_xml$043cfcb81563a9a3c4fea3219c8eea29-910906021" (String#17239, DoABC#4)
// _SafeStr_3014 = "ude_action_inputs_17_xml$8f05c437bc59e8d0620ecaca4dd3767a-90449029" (String#15950, DoABC#4)
// _SafeStr_3015 = "ude_action_inputs_19_xml$81161969cedf1f6cbb08484984907e78-89707911" (String#17356, DoABC#4)
// _SafeStr_3016 = "ude_action_inputs_20_xml$d1d6b6f6f3f42fb8d860bc5c31f1e741-127332221" (String#21087, DoABC#4)
// _SafeStr_3017 = "ude_action_inputs_21_xml$3a9edb228a65bdfcdbfdfb08baff88d6-126155006" (String#20478, DoABC#4)
// _SafeStr_3018 = "ude_action_inputs_22_xml$3978107d904af5755dddc87b6bd63bcd-126517375" (String#21813, DoABC#4)
// _SafeStr_3019 = "ude_action_inputs_23_xml$1c41ef65a0adc2431f2bc086fb23e359-133736960" (String#20119, DoABC#4)
// _SafeStr_3020 = "ude_action_inputs_24_xml$f6cdc62784f41ff763ca42cecdcfa260-133083513" (String#19499, DoABC#4)
// _SafeStr_3021 = "ude_action_inputs_25_xml$04d36c2a1f6586896d0e43f20ad4dffa-131947258" (String#18911, DoABC#4)
// _SafeStr_3022 = "ude_action_inputs_26_xml$f01e5d776be26560234259a369d0ab1d-130245243" (String#16915, DoABC#4)
// _SafeStr_3023 = "ude_action_inputs_27_xml$219db18716c3314747e7c69d61405d20-120654844" (String#22727, DoABC#4)
// _SafeStr_3024 = "ude_action_inputs_3_xml$4fec12ced40e42c0a0590e56baca3f64-1748963184" (String#18179, DoABC#4)
// _SafeStr_3025 = "ude_action_inputs_4_xml$82f09b7f76f187bd96689a99c21049d7-1747785961" (String#22029, DoABC#4)
// _SafeStr_3026 = "ude_action_inputs_6_xml$f1cc131f8347a20944079aecc0f9806f-1744947691" (String#21744, DoABC#4)
// _SafeStr_3027 = "ude_action_inputs_7_xml$6a24d6c1a0c48491110f92b89c7cd896-1752682860" (String#19645, DoABC#4)
// _SafeStr_3028 = "ude_action_inputs_9_xml$7cd95832a974394237c0194de1e54dca-1751876182" (String#19582, DoABC#4)
// _SafeStr_3029 = "ude_main_xml$cc8869ee7e28ecfe9f62f6ec298ddc15-579990595" (String#22680, DoABC#4)
// _SafeStr_3030 = "ude_trigger_inputs_10_xml$5cb128fc3388bac86c37e672350aebb0-941074232" (String#21713, DoABC#4)
// _SafeStr_3031 = "ude_trigger_inputs_12_xml$8eae87bd0f6510ddc6471613054dc46a-947148850" (String#21722, DoABC#4)
// _SafeStr_3032 = "ude_trigger_inputs_13_xml$0b976393e3e0ddefc66c037adc2b5f87-947544499" (String#17011, DoABC#4)
// _SafeStr_3033 = "ude_trigger_inputs_14_xml$af5b7a86e6dad5bc1cdc07754db5a3cc-946342196" (String#19284, DoABC#4)


