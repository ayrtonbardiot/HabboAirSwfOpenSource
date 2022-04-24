// by nota

//com.sulake.habbo.catalog.targetedoffers.data.HabboMallOffer

package com.sulake.habbo.catalog.targetedoffers.data
{
    public class HabboMallOffer 
    {

        private var _SafeStr_6198:int;
        private var _SafeStr_6199:String;
        private var _SafeStr_4004:String;
        private var _highlight:String;
        private var _description:String;
        private var _SafeStr_4295:String;
        private var _smallImageUrl:String;
        private var _SafeStr_6200:int;

        public function HabboMallOffer(_arg_1:Object)
        {
            _SafeStr_6198 = parseInt(_arg_1.targetedOfferId);
            _SafeStr_6199 = _arg_1.identifier;
            _SafeStr_4004 = _arg_1.header;
            _highlight = _arg_1.highlight;
            _description = _arg_1.description;
            _SafeStr_4295 = _arg_1.imageUrl;
            _smallImageUrl = _arg_1.smallImageUrl;
            _SafeStr_6200 = parseInt(_arg_1.trackingStateCode);
        }

        public function get targetedOfferId():int
        {
            return (_SafeStr_6198);
        }

        public function get identifier():String
        {
            return (_SafeStr_6199);
        }

        public function get title():String
        {
            return (_SafeStr_4004);
        }

        public function get highlight():String
        {
            return (_highlight);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get imageUrl():String
        {
            return (_SafeStr_4295);
        }

        public function get smallImageUrl():String
        {
            return (_smallImageUrl);
        }

        public function get trackingState():int
        {
            return (_SafeStr_6200);
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers.data

// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4295 = "_-GL" (String#2673, DoABC#4)
// _SafeStr_6198 = "_-r1p" (String#21308, DoABC#4)
// _SafeStr_6199 = "_-z1d" (String#9730, DoABC#4)
// _SafeStr_6200 = "_-EX" (String#22493, DoABC#4)


