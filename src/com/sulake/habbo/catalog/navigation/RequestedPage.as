// by nota

//com.sulake.habbo.catalog.navigation.RequestedPage

package com.sulake.habbo.catalog.navigation
{
    public class RequestedPage 
    {

        public static const REQUEST_TYPE_NONE:int = 0;
        public static const REQUEST_TYPE_ID:int = 1;
        public static const REQUEST_TYPE_NAME:int = 2;

        private var _SafeStr_4312:int;
        private var _SafeStr_4313:int;
        private var _SafeStr_4314:int;
        private var _requestName:String;

        public function RequestedPage()
        {
            _SafeStr_4312 = 0;
        }

        public function set requestById(_arg_1:int):void
        {
            _SafeStr_4312 = 1;
            _SafeStr_4313 = _arg_1;
        }

        public function set requestByName(_arg_1:String):void
        {
            _SafeStr_4312 = 2;
            _requestName = _arg_1;
        }

        public function resetRequest():void
        {
            _SafeStr_4312 = 0;
            _SafeStr_4314 = -1;
        }

        public function get requestType():int
        {
            return (_SafeStr_4312);
        }

        public function get requestId():int
        {
            return (_SafeStr_4313);
        }

        public function get requestedOfferId():int
        {
            return (_SafeStr_4314);
        }

        public function set requestedOfferId(_arg_1:int):void
        {
            _SafeStr_4314 = _arg_1;
        }

        public function get requestName():String
        {
            return (_requestName);
        }


    }
}//package com.sulake.habbo.catalog.navigation

// _SafeStr_4312 = "_-Y1J" (String#4374, DoABC#4)
// _SafeStr_4313 = "_-B7" (String#2703, DoABC#4)
// _SafeStr_4314 = "_-Sa" (String#12451, DoABC#4)


