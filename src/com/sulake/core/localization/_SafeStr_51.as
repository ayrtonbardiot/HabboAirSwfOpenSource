// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.localization._SafeStr_51

package com.sulake.core.localization
{
    public class _SafeStr_51 implements _SafeStr_40 
    {

        private var _SafeStr_8031:String;
        private var _externalTextsHash:String;
        private var _SafeStr_3950:String;
        private var _externalVariablesHash:String;
        private var _SafeStr_8032:String;
        private var _furniDataHash:String;
        private var _SafeStr_8033:String;
        private var _productDataHash:String;


        public static function parse(_arg_1:String):_SafeStr_51
        {
            var _local_2:Object = JSON.parse(_arg_1);
            var _local_4:_SafeStr_51 = new (_SafeStr_51)();
            for each (var _local_3:Object in _local_2.hashes)
            {
                if (_local_3.name == "external_texts")
                {
                    _local_4._SafeStr_8031 = _local_3.url;
                    _local_4._externalTextsHash = _local_3.hash;
                }
                else
                {
                    if (_local_3.name == "external_variables")
                    {
                        _local_4._SafeStr_3950 = _local_3.url;
                        _local_4._externalVariablesHash = _local_3.hash;
                    }
                    else
                    {
                        if (_local_3.name == "furnidata")
                        {
                            _local_4._SafeStr_8032 = _local_3.url;
                            _local_4._furniDataHash = _local_3.hash;
                        }
                        else
                        {
                            if (_local_3.name == "productdata")
                            {
                                _local_4._SafeStr_8033 = _local_3.url;
                                _local_4._productDataHash = _local_3.hash;
                            };
                        };
                    };
                };
            };
            return (_local_4);
        }


        public function isValid():Boolean
        {
            return ((((((((_SafeStr_8031) && (_externalTextsHash)) && (_SafeStr_3950)) && (_externalVariablesHash)) && (_SafeStr_8032)) && (_furniDataHash)) && (_SafeStr_8033)) && (_productDataHash));
        }

        public function getExternalTextsUrl():String
        {
            return (_SafeStr_8031);
        }

        public function getExternalTextsHash():String
        {
            return (_externalTextsHash);
        }

        public function getExternalVariablesUrl():String
        {
            return (_SafeStr_3950);
        }

        public function getExternalVariablesHash():String
        {
            return (_externalVariablesHash);
        }

        public function getFurniDataUrl():String
        {
            return (_SafeStr_8032);
        }

        public function getFurniDataHash():String
        {
            return (_furniDataHash);
        }

        public function getProductDataUrl():String
        {
            return (_SafeStr_8033);
        }

        public function getProductDataHash():String
        {
            return (_productDataHash);
        }


    }
}//package com.sulake.core.localization

// _SafeStr_3950 = "_-xb" (String#10566, DoABC#3)
// _SafeStr_40 = "_-dT" (String#9239, DoABC#3)
// _SafeStr_51 = "_-OI" (String#8176, DoABC#3)
// _SafeStr_8031 = "_-D1u" (String#7437, DoABC#3)
// _SafeStr_8032 = "_-E1e" (String#7478, DoABC#3)
// _SafeStr_8033 = "_-ng" (String#9912, DoABC#3)


