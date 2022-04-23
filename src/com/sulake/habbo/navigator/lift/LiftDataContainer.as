// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.lift.LiftDataContainer

package com.sulake.habbo.navigator.lift
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import __AS3__.vec.Vector;
    import _-21f._SafeStr_1586;

    public class LiftDataContainer 
    {

        private static const DEFAULT_IMAGE:String = "${image.library.url}officialrooms_hq/nav_teaser_wl.png";

        private var _navigator:HabboNewNavigator;
        private var _liftedRooms:Vector.<_SafeStr_1586> = new Vector.<_SafeStr_1586>(0);

        public function LiftDataContainer(_arg_1:HabboNewNavigator)
        {
            _navigator = _arg_1;
        }

        public function setLiftedRooms(_arg_1:Vector.<_SafeStr_1586>):void
        {
            _liftedRooms = _arg_1;
        }

        public function get liftedRooms():Vector.<_SafeStr_1586>
        {
            return (_liftedRooms);
        }

        public function getUrlForLiftImageAtIndex(_arg_1:int):String
        {
            if (((_arg_1 < 0) || (_arg_1 > (_liftedRooms.length - 1))))
            {
                return ("");
            };
            if (_liftedRooms[_arg_1].image == "")
            {
                return ("${image.library.url}officialrooms_hq/nav_teaser_wl.png");
            };
            return (_navigator.imageLibraryBaseUrl + _liftedRooms[_arg_1].image);
        }


    }
}//package com.sulake.habbo.navigator.lift

// _SafeStr_1586 = "_-G1J" (String#19172, DoABC#4)


