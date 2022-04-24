// by nota

//com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.LinearMovingBackgroundObject

package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;

    public class LinearMovingBackgroundObject extends BackgroundObject 
    {

        private var _SafeStr_5811:int;
        private var _SafeStr_5813:int;
        private var _SafeStr_6978:Number;
        private var _SafeStr_6979:Number;
        private var _SafeStr_6967:Number;
        private var _SafeStr_6968:Number;

        public function LinearMovingBackgroundObject(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            var _local_7:Array = _arg_5.split(";");
            var _local_6:String = _local_7[0];
            _SafeStr_5811 = _local_7[2];
            _SafeStr_5813 = _local_7[3];
            _SafeStr_6967 = _local_7[4];
            _SafeStr_6968 = _local_7[5];
            _SafeStr_6978 = _SafeStr_5811;
            _SafeStr_6979 = _SafeStr_5813;
            sprite.assetUri = (("${image.library.url}reception/" + _local_6) + ".png");
        }

        override public function update(_arg_1:uint):void
        {
            super.update(_arg_1);
            if (!sprite)
            {
                return;
            };
            var _local_3:int = window.width;
            var _local_2:int = window.height;
            _SafeStr_6978 = (_SafeStr_6978 + (_arg_1 * _SafeStr_6967));
            _SafeStr_6979 = (_SafeStr_6979 + (_arg_1 * _SafeStr_6968));
            sprite.x = _SafeStr_6978;
            sprite.y = (_SafeStr_6979 + window.desktop.height);
            if ((((((_SafeStr_6967 > 0) && (sprite.x > _local_3)) || ((_SafeStr_6967 < 0) && ((sprite.x + sprite.width) < 0))) || ((_SafeStr_6968 > 0) && (sprite.y > _local_2))) || ((_SafeStr_6968 < 0) && ((sprite.y + sprite.height) < 0))))
            {
                _SafeStr_6978 = _SafeStr_5811;
                _SafeStr_6979 = _SafeStr_5813;
                events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET", id));
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_5811 = "_-YO" (String#4024, DoABC#4)
// _SafeStr_5813 = "_-OD" (String#4044, DoABC#4)
// _SafeStr_6967 = "_-a17" (String#4032, DoABC#4)
// _SafeStr_6968 = "_-z1N" (String#4111, DoABC#4)
// _SafeStr_6978 = "_-E1x" (String#3593, DoABC#4)
// _SafeStr_6979 = "_-T1b" (String#3546, DoABC#4)


