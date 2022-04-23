// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.AssetTypeDeclaration

package com.sulake.core.assets
{
    public class AssetTypeDeclaration 
    {

        private var _SafeStr_8018:String;
        private var _SafeStr_8019:Class;
        private var _SafeStr_8020:Class;
        private var _SafeStr_8021:Array;

        public function AssetTypeDeclaration(_arg_1:String, _arg_2:Class, _arg_3:Class=null, ... _args)
        {
            _SafeStr_8018 = _arg_1;
            _SafeStr_8019 = _arg_2;
            _SafeStr_8020 = _arg_3;
            if (_args == null)
            {
                _SafeStr_8021 = [];
            }
            else
            {
                _SafeStr_8021 = _args;
            };
        }

        public function get mimeType():String
        {
            return (_SafeStr_8018);
        }

        public function get assetClass():Class
        {
            return (_SafeStr_8019);
        }

        public function get loaderClass():Class
        {
            return (_SafeStr_8020);
        }

        public function get fileTypes():Array
        {
            return (_SafeStr_8021);
        }


    }
}//package com.sulake.core.assets

// _SafeStr_8018 = "_-s12" (String#10176, DoABC#3)
// _SafeStr_8019 = "_-LS" (String#7974, DoABC#3)
// _SafeStr_8020 = "_-ua" (String#10357, DoABC#3)
// _SafeStr_8021 = "_-GS" (String#7632, DoABC#3)


