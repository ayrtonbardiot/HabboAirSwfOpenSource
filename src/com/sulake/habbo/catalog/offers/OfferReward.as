// by nota

//com.sulake.habbo.catalog.offers.OfferReward

package com.sulake.habbo.catalog.offers
{
    public class OfferReward 
    {

        private var _name:String;
        private var _SafeStr_4320:String;
        private var _SafeStr_4862:int;

        public function OfferReward(_arg_1:String, _arg_2:String, _arg_3:int)
        {
            _name = _arg_1;
            _SafeStr_4320 = _arg_2;
            _SafeStr_4862 = _arg_3;
        }

        public function get name():String
        {
            return (_name);
        }

        public function get contentType():String
        {
            return (_SafeStr_4320);
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }


    }
}//package com.sulake.habbo.catalog.offers

// _SafeStr_4320 = "_-i17" (String#10028, DoABC#4)
// _SafeStr_4862 = "_-Q1H" (String#2645, DoABC#4)


