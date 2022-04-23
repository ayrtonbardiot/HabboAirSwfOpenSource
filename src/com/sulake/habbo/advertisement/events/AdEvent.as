// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.advertisement.events.AdEvent

package com.sulake.habbo.advertisement.events
{
    import flash.events.Event;
    import flash.display.BitmapData;

    public class AdEvent extends Event 
    {

        public static const ROOM_AD_IMAGE_LOADED:String = "AE_ROOM_AD_IMAGE_LOADED";
        public static const ROOM_AD_IMAGE_LOADING_FAILED:String = "AE_ROOM_AD_IMAGE_LOADING_FAILED";
        public static const ROOM_AD_SHOW:String = "AE_ROOM_AD_SHOW";

        private var _SafeStr_4204:BitmapData;
        private var _SafeStr_3693:int;
        private var _SafeStr_4295:String;
        private var _SafeStr_4177:String;
        private var _SafeStr_5391:BitmapData;
        private var _SafeStr_5392:BitmapData;
        private var _SafeStr_4157:int;
        private var _SafeStr_4750:int;

        public function AdEvent(_arg_1:String, _arg_2:int, _arg_3:BitmapData=null, _arg_4:String="", _arg_5:String="", _arg_6:BitmapData=null, _arg_7:BitmapData=null, _arg_8:int=-1, _arg_9:int=-1, _arg_10:Boolean=false, _arg_11:Boolean=false)
        {
            super(_arg_1, _arg_10, _arg_11);
            _SafeStr_4204 = _arg_3;
            _SafeStr_3693 = _arg_2;
            _SafeStr_4295 = _arg_4;
            _SafeStr_4177 = _arg_5;
            _SafeStr_5391 = _arg_6;
            _SafeStr_5392 = _arg_7;
            _SafeStr_4157 = _arg_8;
            _SafeStr_4750 = _arg_9;
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get imageUrl():String
        {
            return (_SafeStr_4295);
        }

        public function get clickUrl():String
        {
            return (_SafeStr_4177);
        }

        public function get adWarningL():BitmapData
        {
            return (_SafeStr_5391);
        }

        public function get adWarningR():BitmapData
        {
            return (_SafeStr_5392);
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectCategory():int
        {
            return (_SafeStr_4750);
        }


    }
}//package com.sulake.habbo.advertisement.events

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4177 = "_-G1Y" (String#3681, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4295 = "_-GL" (String#2673, DoABC#4)
// _SafeStr_4750 = "_-E1d" (String#2700, DoABC#4)
// _SafeStr_5391 = "_-y18" (String#19995, DoABC#4)
// _SafeStr_5392 = "_-qy" (String#17953, DoABC#4)


