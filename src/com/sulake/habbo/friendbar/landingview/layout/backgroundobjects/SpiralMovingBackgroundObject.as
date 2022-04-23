// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.SpiralMovingBackgroundObject

package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.window._SafeStr_3133;
    import flash.events.EventDispatcher;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.events.PathResetEvent;

    public class SpiralMovingBackgroundObject extends BackgroundObject 
    {

        private var _startRadius:int;
        private var _SafeStr_6969:int;
        private var _posRadius:Number;
        private var _SafeStr_6970:Number;
        private var _speedRadius:Number;
        private var _SafeStr_6971:Number;
        private var _SafeStr_3991:Number;
        private var _SafeStr_3992:Number;

        public function SpiralMovingBackgroundObject(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            var _local_7:Array = _arg_5.split(";");
            var _local_6:String = _local_7[0];
            _startRadius = _local_7[2];
            _SafeStr_6969 = _local_7[3];
            _speedRadius = _local_7[4];
            _SafeStr_6971 = _local_7[5];
            _SafeStr_3991 = _local_7[6];
            _SafeStr_3992 = _local_7[7];
            _posRadius = _startRadius;
            _SafeStr_6970 = _SafeStr_6969;
            sprite.assetUri = (("${image.library.url}reception/" + _local_6) + ".png");
        }

        override public function update(_arg_1:uint):void
        {
            super.update(_arg_1);
            var _local_2:Number = (_startRadius / _posRadius);
            var _local_3:Number = (1 + ((_startRadius / _posRadius) / 8));
            _posRadius = (_posRadius + (_arg_1 * _speedRadius));
            _SafeStr_6970 = (_SafeStr_6970 + ((_arg_1 * _SafeStr_6971) * _local_2));
            if (sprite.bitmapData)
            {
                if (_posRadius <= 0)
                {
                    _posRadius = _startRadius;
                    sprite.width = sprite.bitmapData.width;
                    sprite.height = sprite.bitmapData.height;
                    events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET", id));
                };
            };
            if (_posRadius > _startRadius)
            {
                _posRadius = 0;
                sprite.width = 0;
                sprite.height = 0;
                events.dispatchEvent(new PathResetEvent("LWMOPRE_MOVING_OBJECT_PATH_RESET", id));
            };
            if (_SafeStr_6970 < 0)
            {
                _SafeStr_6970 = (3.14159265358979 * 2);
            };
            if (_SafeStr_6970 > (3.14159265358979 * 2))
            {
                _SafeStr_6970 = 0;
            };
            sprite.x = (_SafeStr_3991 + (Math.sin(_SafeStr_6970) * _posRadius));
            sprite.y = (_SafeStr_3992 + (Math.cos(_SafeStr_6970) * _posRadius));
            if (sprite.bitmapData)
            {
                sprite.pivotPoint = 4;
                sprite.stretchedX = true;
                sprite.stretchedY = true;
                sprite.width = (sprite.bitmapData.width / _local_3);
                sprite.height = (sprite.bitmapData.height / _local_3);
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3991 = "_-k17" (String#6208, DoABC#4)
// _SafeStr_3992 = "_-pX" (String#6202, DoABC#4)
// _SafeStr_6969 = "_-Oa" (String#18902, DoABC#4)
// _SafeStr_6970 = "_-LY" (String#5316, DoABC#4)
// _SafeStr_6971 = "_-ev" (String#19067, DoABC#4)


