// by nota

//com.sulake.habbo.session.events.BadgeImageReadyEvent

package com.sulake.habbo.session.events
{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class BadgeImageReadyEvent extends Event 
    {

        public static const BADGE_READY:String = "BIRE_BADGE_IMAGE_READY";

        private var _SafeStr_4615:String;
        private var _SafeStr_4204:BitmapData;

        public function BadgeImageReadyEvent(_arg_1:String, _arg_2:BitmapData, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("BIRE_BADGE_IMAGE_READY", _arg_3, _arg_4);
            _SafeStr_4615 = _arg_1;
            _SafeStr_4204 = _arg_2;
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get badgeImage():BitmapData
        {
            return (_SafeStr_4204);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)


