// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.furniture.FurnitureData

package com.sulake.habbo.session.furniture
{
    public class FurnitureData implements _SafeStr_3130 
    {

        public static const _SafeStr_8918:String = "i";
        public static const _SafeStr_8919:String = "s";

        private var _SafeStr_4028:String;
        private var _SafeStr_3820:int;
        private var _className:String;
        private var _hasIndexedColor:Boolean;
        private var _SafeStr_6206:int;
        private var _revision:int;
        private var _SafeStr_6207:int;
        private var _SafeStr_6208:int;
        private var _SafeStr_6209:int;
        private var _colours:Array;
        private var _localizedName:String;
        private var _description:String;
        private var _SafeStr_6210:String;
        private var _SafeStr_5901:int;
        private var _SafeStr_5903:int;
        private var _customParams:String;
        private var _SafeStr_4158:int;
        private var _purchaseCouldBeUsedForBuyout:Boolean;
        private var _rentCouldBeUsedForBuyout:Boolean;
        private var _SafeStr_5904:Boolean;
        private var _fullName:String;
        private var _SafeStr_6211:Boolean;
        private var _SafeStr_6212:Boolean;
        private var _SafeStr_6213:Boolean;
        private var _SafeStr_6214:Boolean;
        private var _SafeStr_6215:String;

        public function FurnitureData(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int, _arg_11:Array, _arg_12:Boolean, _arg_13:int, _arg_14:String, _arg_15:int, _arg_16:Boolean, _arg_17:int, _arg_18:Boolean, _arg_19:Boolean, _arg_20:String, _arg_21:int, _arg_22:Boolean, _arg_23:Boolean, _arg_24:Boolean, _arg_25:Boolean, _arg_26:String)
        {
            _SafeStr_4028 = _arg_1;
            _SafeStr_3820 = _arg_2;
            _fullName = _arg_3;
            _className = _arg_4;
            _revision = _arg_7;
            _SafeStr_6207 = _arg_8;
            _SafeStr_6208 = _arg_9;
            _SafeStr_6209 = _arg_10;
            _colours = _arg_11;
            _hasIndexedColor = _arg_12;
            _SafeStr_6206 = _arg_13;
            _localizedName = _arg_5;
            _description = _arg_6;
            _SafeStr_6210 = _arg_14;
            _SafeStr_5901 = _arg_15;
            _purchaseCouldBeUsedForBuyout = _arg_16;
            _SafeStr_5903 = _arg_17;
            _rentCouldBeUsedForBuyout = _arg_18;
            _customParams = _arg_20;
            _SafeStr_4158 = _arg_21;
            _SafeStr_5904 = _arg_19;
            _SafeStr_6211 = _arg_22;
            _SafeStr_6212 = _arg_23;
            _SafeStr_6213 = _arg_24;
            _SafeStr_6214 = _arg_25;
            _SafeStr_6215 = _arg_26;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get className():String
        {
            return (_className);
        }

        public function get fullName():String
        {
            return (_fullName);
        }

        public function get hasIndexedColor():Boolean
        {
            return (_hasIndexedColor);
        }

        public function get colourIndex():int
        {
            return (_SafeStr_6206);
        }

        public function get revision():int
        {
            return (_revision);
        }

        public function get tileSizeX():int
        {
            return (_SafeStr_6207);
        }

        public function get tileSizeY():int
        {
            return (_SafeStr_6208);
        }

        public function get tileSizeZ():int
        {
            return (_SafeStr_6209);
        }

        public function get colours():Array
        {
            return (_colours);
        }

        public function get localizedName():String
        {
            return (_localizedName);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get adUrl():String
        {
            return (_SafeStr_6210);
        }

        public function get purchaseOfferId():int
        {
            return (_SafeStr_5901);
        }

        public function get customParams():String
        {
            return (_customParams);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function set className(_arg_1:String):void
        {
            _className = _arg_1;
        }

        public function get rentOfferId():int
        {
            return (_SafeStr_5903);
        }

        public function get purchaseCouldBeUsedForBuyout():Boolean
        {
            return (_purchaseCouldBeUsedForBuyout);
        }

        public function get rentCouldBeUsedForBuyout():Boolean
        {
            return (_rentCouldBeUsedForBuyout);
        }

        public function get availableForBuildersClub():Boolean
        {
            return (_SafeStr_5904);
        }

        public function get canStandOn():Boolean
        {
            return (_SafeStr_6211);
        }

        public function get canSitOn():Boolean
        {
            return (_SafeStr_6212);
        }

        public function get canLayOn():Boolean
        {
            return (_SafeStr_6213);
        }

        public function get isExternalImageType():Boolean
        {
            return (!(_className.indexOf("external_image") == -1));
        }

        public function get excludedFromDynamic():Boolean
        {
            return (_SafeStr_6214);
        }

        public function get furniLine():String
        {
            return (_SafeStr_6215);
        }


    }
}//package com.sulake.habbo.session.furniture

// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_5901 = "_-Qn" (String#6174, DoABC#4)
// _SafeStr_5903 = "_-711" (String#6064, DoABC#4)
// _SafeStr_5904 = "_-y1E" (String#6516, DoABC#4)
// _SafeStr_6206 = "_-M1V" (String#22305, DoABC#4)
// _SafeStr_6207 = "_-oZ" (String#18169, DoABC#4)
// _SafeStr_6208 = "_-5w" (String#22250, DoABC#4)
// _SafeStr_6209 = "_-L8" (String#18938, DoABC#4)
// _SafeStr_6210 = "_-lV" (String#18205, DoABC#4)
// _SafeStr_6211 = "_-e1L" (String#16582, DoABC#4)
// _SafeStr_6212 = "_-eR" (String#19003, DoABC#4)
// _SafeStr_6213 = "_-RY" (String#18623, DoABC#4)
// _SafeStr_6214 = "_-R10" (String#20882, DoABC#4)
// _SafeStr_6215 = "_-ew" (String#19145, DoABC#4)
// _SafeStr_8918 = "_-M1K" (String#39073, DoABC#4)
// _SafeStr_8919 = "_-IA" (String#39816, DoABC#4)


