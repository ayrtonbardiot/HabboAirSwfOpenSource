// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.localization.LocalizationDefinition

package com.sulake.core.localization
{
    public class LocalizationDefinition implements ILocalizationDefinition 
    {

        private var _SafeStr_8036:String;
        private var _SafeStr_8037:String;
        private var _SafeStr_8038:String;
        private var _name:String;
        private var _SafeStr_5275:String;

        public function LocalizationDefinition(_arg_1:String, _arg_2:String, _arg_3:String)
        {
            var _local_4:Array = _arg_1.split("_");
            _SafeStr_8036 = _local_4[0];
            var _local_5:Array = _local_4[1].split(".");
            _SafeStr_8037 = _local_5[0];
            _SafeStr_8038 = _local_5[1];
            _name = _arg_2;
            _SafeStr_5275 = _arg_3;
        }

        public function get id():String
        {
            return ((((_SafeStr_8036 + "_") + _SafeStr_8037) + ".") + _SafeStr_8038);
        }

        public function get languageCode():String
        {
            return (_SafeStr_8036);
        }

        public function get countryCode():String
        {
            return (_SafeStr_8037);
        }

        public function get encoding():String
        {
            return (_SafeStr_8038);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }


    }
}//package com.sulake.core.localization

// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_8036 = "_-a1C" (String#8962, DoABC#3)
// _SafeStr_8037 = "_-ms" (String#9843, DoABC#3)
// _SafeStr_8038 = "_-6D" (String#6982, DoABC#3)


