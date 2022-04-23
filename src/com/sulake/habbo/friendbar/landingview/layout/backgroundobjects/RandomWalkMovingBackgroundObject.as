// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.RandomWalkMovingBackgroundObject

package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.utils._SafeStr_401;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;

    public class RandomWalkMovingBackgroundObject extends BackgroundObject 
    {

        private var _SafeStr_5811:int;
        private var _SafeStr_5813:int;
        private var _SafeStr_6929:Number;
        private var _SafeStr_6930:Number;
        private var _SafeStr_6967:Number;
        private var _SafeStr_6968:Number;
        private var _SafeStr_6984:Number;
        private var _SafeStr_4582:uint = 0;
        private var _SafeStr_6978:Number;
        private var _SafeStr_6979:Number;
        private var _SafeStr_6985:Number = 0;
        private var _SafeStr_6986:Number = 0;
        private var _SafeStr_6987:Number = 0;
        private var _SafeStr_6988:Number = 0;
        private var _SafeStr_6983:uint;

        public function RandomWalkMovingBackgroundObject(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, false);
            var _local_7:Array = _arg_5.split(";");
            var _local_6:String = _local_7[0];
            _SafeStr_5811 = _local_7[2];
            _SafeStr_5813 = _local_7[3];
            _SafeStr_6967 = _local_7[4];
            _SafeStr_6968 = _local_7[5];
            _SafeStr_6929 = _local_7[6];
            _SafeStr_6930 = _local_7[7];
            _SafeStr_6984 = _local_7[8];
            _SafeStr_6978 = _SafeStr_5811;
            _SafeStr_6979 = _SafeStr_5813;
            sprite.assetUri = (("${image.library.url}" + _local_6) + ".png");
        }

        override public function update(_arg_1:uint):void
        {
            super.update(_arg_1);
            if (!sprite)
            {
                return;
            };
            _SafeStr_4582 = (_SafeStr_4582 + _arg_1);
            if ((_SafeStr_4582 - _SafeStr_6983) > _SafeStr_6984)
            {
                _SafeStr_6987 = _SafeStr_6985;
                _SafeStr_6988 = _SafeStr_6986;
                _SafeStr_6985 = (((Math.random() * 2) - 1) * _SafeStr_6929);
                _SafeStr_6986 = (((Math.random() * 2) - 1) * _SafeStr_6930);
                _SafeStr_6983 = _SafeStr_4582;
            };
            var _local_4:int = window.width;
            var _local_2:int = window.height;
            var _local_3:Number = ((_SafeStr_4582 - _SafeStr_6983) / _SafeStr_6984);
            _SafeStr_6978 = (_SafeStr_6978 + ((_arg_1 / 1000) * (_SafeStr_6967 + _SafeStr_401.lerp(_local_3, _SafeStr_6987, _SafeStr_6985))));
            _SafeStr_6979 = (_SafeStr_6979 + ((_arg_1 / 1000) * (_SafeStr_6968 + _SafeStr_401.lerp(_local_3, _SafeStr_6988, _SafeStr_6986))));
            sprite.x = _SafeStr_6978;
            sprite.y = _SafeStr_6979;
            if ((((((_SafeStr_6967 > 0) && (sprite.x > _local_4)) || ((_SafeStr_6967 < 0) && ((sprite.x + sprite.width) < 0))) || ((_SafeStr_6968 > 0) && (sprite.y > _local_2))) || ((_SafeStr_6968 < 0) && ((sprite.y + sprite.height) < 0))))
            {
                _SafeStr_6978 = _SafeStr_5811;
                _SafeStr_6979 = _SafeStr_5813;
                events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET", id));
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_401 = "_-e1d" (String#5870, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5811 = "_-YO" (String#4024, DoABC#4)
// _SafeStr_5813 = "_-OD" (String#4044, DoABC#4)
// _SafeStr_6929 = "_-61b" (String#9907, DoABC#4)
// _SafeStr_6930 = "_-1W" (String#8931, DoABC#4)
// _SafeStr_6967 = "_-a17" (String#4032, DoABC#4)
// _SafeStr_6968 = "_-z1N" (String#4111, DoABC#4)
// _SafeStr_6978 = "_-E1x" (String#3593, DoABC#4)
// _SafeStr_6979 = "_-T1b" (String#3546, DoABC#4)
// _SafeStr_6983 = "_-FU" (String#13893, DoABC#4)
// _SafeStr_6984 = "_-6i" (String#14863, DoABC#4)
// _SafeStr_6985 = "_-R1w" (String#14050, DoABC#4)
// _SafeStr_6986 = "_-o1f" (String#14420, DoABC#4)
// _SafeStr_6987 = "_-Zu" (String#19250, DoABC#4)
// _SafeStr_6988 = "_-D1q" (String#18988, DoABC#4)


