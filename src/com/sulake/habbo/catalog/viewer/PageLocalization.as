// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.PageLocalization

package com.sulake.habbo.catalog.viewer
{
    import flash.utils.Dictionary;

    public class PageLocalization implements IPageLocalization 
    {

        public static const HEADER_IMAGE:String = "catalog.header.image";
        public static const _SafeStr_8362:String = "catalog.header.icon";
        public static const HEADER_TITLE:String = "catalog.header.title";
        public static const _SafeStr_8363:String = "catalog.header.description";
        private static const DEFAULT_TEXT_FIELDS:Array = ["catalog.header.description", "ctlg_description", "ctlg_special_txt", "ctlg_text_1", "ctlg_text_2"];
        private static const DEFAULT_IMAGE_FIELDS:Array = ["catalog.header.image", "ctlg_teaserimg_1", "ctlg_special_img", "ctlg_teaserimg_2", "ctlg_teaserimg_3"];
        private static const LAYOUTS_IMAGE_FIELDS:Dictionary = new Dictionary();
        private static const LAYOUTS_TEXT_FIELDS:Dictionary = new Dictionary();
        private static const LAYOUT_LINKS:Dictionary = new Dictionary();

        private var _SafeStr_5380:Array;
        private var _SafeStr_5381:Array;

        {
            LAYOUTS_IMAGE_FIELDS["frontpage4"] = ["catalog.header.image", "ctlg_teaserimg_1"];
            LAYOUTS_TEXT_FIELDS["camera1"] = ["catalog.header.description", "ctlg_text_1"];
            LAYOUTS_TEXT_FIELDS["presents"] = ["catalog.header.description", "ctlg_text1"];
            LAYOUTS_TEXT_FIELDS["pets"] = ["catalog.header.description", "ctlg_text_1", "ctlg_text_2", "ctlg_text_3"];
            LAYOUTS_TEXT_FIELDS["pets2"] = ["catalog.header.description", "ctlg_text_1", "ctlg_text_2", "ctlg_text_3"];
            LAYOUTS_TEXT_FIELDS["pets3"] = ["catalog.header.description", "ctlg_text_1", "ctlg_text_2", "ctlg_text_3"];
            LAYOUTS_TEXT_FIELDS["info_rentables"] = ["catalog.header.description", "ctlg_text_1", "ctlg_text_2", "ctlg_text_3", "ctlg_text_4", "ctlg_text_5"];
            LAYOUTS_TEXT_FIELDS["info_duckets"] = ["ctlg_description"];
            LAYOUTS_TEXT_FIELDS["info_loyalty"] = ["ctlg_description"];
            LAYOUTS_TEXT_FIELDS["trophies"] = ["trophy.description", "trophy.enscription"];
            LAYOUTS_TEXT_FIELDS["frontpage4"] = ["ctlg_txt1", "ctlg_txt2"];
            LAYOUTS_TEXT_FIELDS["builders_club_frontpage"] = ["ctlg_description"];
            LAYOUTS_TEXT_FIELDS["builders_club_addons"] = ["ctlg_description"];
            LAYOUTS_TEXT_FIELDS["builders_club_loyalty"] = ["ctlg_description"];
            LAYOUT_LINKS["club_buy"] = ["club_link"];
            LAYOUT_LINKS["mad_money"] = ["ctlg_madmoney_button"];
            LAYOUT_LINKS["monkey"] = ["ctlg_teaserimg_1_region", "ctlg_special_img_region"];
            LAYOUT_LINKS["niko"] = ["ctlg_teaserimg_1_region", "ctlg_special_img_region"];
            LAYOUT_LINKS["pets3"] = ["ctlg_text_3"];
        }

        public function PageLocalization(_arg_1:Array, _arg_2:Array)
        {
            _SafeStr_5380 = _arg_1;
            _SafeStr_5381 = _arg_2;
        }

        public function get imageCount():int
        {
            return (_SafeStr_5380.length);
        }

        public function get textCount():int
        {
            return (_SafeStr_5381.length);
        }

        public function dispose():void
        {
            _SafeStr_5380 = null;
            _SafeStr_5381 = null;
        }

        public function hasLinks(_arg_1:String):Boolean
        {
            return (!(LAYOUT_LINKS[_arg_1] == null));
        }

        public function getLinks(_arg_1:String):Array
        {
            return (LAYOUT_LINKS[_arg_1]);
        }

        public function getTextElementName(_arg_1:int, _arg_2:String):String
        {
            var _local_3:Array = LAYOUTS_TEXT_FIELDS[_arg_2];
            if (_local_3 == null)
            {
                _local_3 = DEFAULT_TEXT_FIELDS;
            };
            if (_arg_1 < _local_3.length)
            {
                return (_local_3[_arg_1]);
            };
            return ("");
        }

        public function getImageElementName(_arg_1:int, _arg_2:String):String
        {
            var _local_3:Array = LAYOUTS_IMAGE_FIELDS[_arg_2];
            if (_local_3 == null)
            {
                _local_3 = DEFAULT_IMAGE_FIELDS;
            };
            if (_arg_1 < _local_3.length)
            {
                return (_local_3[_arg_1]);
            };
            return ("");
        }

        public function getTextElementContent(_arg_1:int):String
        {
            if (_arg_1 < _SafeStr_5381.length)
            {
                return (_SafeStr_5381[_arg_1]);
            };
            return ("");
        }

        public function getImageElementContent(_arg_1:int):String
        {
            if (_arg_1 < _SafeStr_5380.length)
            {
                return (_SafeStr_5380[_arg_1]);
            };
            return ("");
        }

        public function getColorUintFromText(_arg_1:int):uint
        {
            var _local_2:* = null;
            if (_arg_1 < _SafeStr_5381.length)
            {
                return (_SafeStr_5381[_arg_1].replace("#", "0x"));
            };
            return (0);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_5380 = "_-2r" (String#2590, DoABC#4)
// _SafeStr_5381 = "_-ks" (String#7729, DoABC#4)
// _SafeStr_8362 = "_-6w" (String#38451, DoABC#4)
// _SafeStr_8363 = "_-a3" (String#32020, DoABC#4)


