// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.StaticAnimatedBackgroundObject

package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;

    public class StaticAnimatedBackgroundObject extends BackgroundObject 
    {

        private var _SafeStr_6980:uint = 0;
        private var _imageBaseUri:String;
        private var _SafeStr_6078:int;
        private var _fps:int;
        private var _SafeStr_6978:int;
        private var _SafeStr_6979:int;
        private var _SafeStr_6982:Array;
        private var _SafeStr_6981:uint = 0;

        public function StaticAnimatedBackgroundObject(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            var _local_6:Array = _arg_5.split(";");
            _imageBaseUri = ("${image.library.url}reception/" + _local_6[0]);
            _SafeStr_6078 = _local_6[2];
            _fps = _local_6[3];
            _SafeStr_6978 = _local_6[4];
            _SafeStr_6979 = _local_6[5];
            _SafeStr_6982 = _local_6[6].split(",");
            _arg_3.addEventListener("LWMOPRE_MOVING_OBJECT_PATH_RESET", onPathResetEvent);
            sprite.x = _SafeStr_6978;
            sprite.y = _SafeStr_6979;
        }

        override public function dispose():void
        {
            events.removeEventListener("LWMOPRE_MOVING_OBJECT_PATH_RESET", onPathResetEvent);
            super.dispose();
        }

        override public function update(_arg_1:uint):void
        {
            super.update(_arg_1);
            var _local_4:int = int((1000 / _fps));
            var _local_2:uint = (_SafeStr_6980 - _SafeStr_6981);
            var _local_3:int = (_SafeStr_6078 - 1);
            if (_SafeStr_6982.length > 0)
            {
                if (_local_2 < (_SafeStr_6078 * _local_4))
                {
                    _local_3 = int((_local_2 / _local_4));
                };
            }
            else
            {
                _local_3 = (_SafeStr_6980 % _local_4);
            };
            sprite.assetUri = ((_imageBaseUri + (_local_3 + 1)) + ".png");
            _SafeStr_6980 = (_SafeStr_6980 + _arg_1);
        }

        private function onPathResetEvent(_arg_1:PathResetEvent):void
        {
            if (_SafeStr_6982.indexOf(_arg_1.objectId.toString()) != -1)
            {
                _SafeStr_6981 = _SafeStr_6980;
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_6078 = "_-H1Z" (String#2266, DoABC#4)
// _SafeStr_6978 = "_-E1x" (String#3593, DoABC#4)
// _SafeStr_6979 = "_-T1b" (String#3546, DoABC#4)
// _SafeStr_6980 = "_-H17" (String#11175, DoABC#4)
// _SafeStr_6981 = "_-q17" (String#22371, DoABC#4)
// _SafeStr_6982 = "_-Im" (String#14413, DoABC#4)


