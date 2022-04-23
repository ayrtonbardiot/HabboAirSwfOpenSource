// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.utils.FriendListIcon

package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.events.TimerEvent;

    public class FriendListIcon extends Icon 
    {

        private static const _SafeStr_8582:int = 200;
        private static const _SafeStr_8583:int = 500;

        private var _assets:_SafeStr_21;

        public function FriendListIcon(_arg_1:_SafeStr_21, _arg_2:_SafeStr_3264)
        {
            _assets = _arg_1;
            alignment = (0x01 | 0x08);
            image = (_arg_1.getAssetByName("icon_friendlist_png") as BitmapDataAsset);
            canvas = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                _assets = null;
                super.dispose();
            };
        }

        override public function notify(_arg_1:Boolean):void
        {
            super.notify(_arg_1);
            enable(_arg_1);
            toggleTimer(((_arg_1) || (_hover)), ((_hover) ? 200 : 500));
            if (((!(_SafeStr_4135)) && (!(_hover))))
            {
                image = (_assets.getAssetByName("icon_friendlist_png") as BitmapDataAsset);
            };
        }

        override public function hover(_arg_1:Boolean):void
        {
            super.hover(_arg_1);
            toggleTimer(((_arg_1) || (_SafeStr_4135)), ((_hover) ? 200 : 500));
            if (((!(_SafeStr_4135)) && (!(_hover))))
            {
                image = (_assets.getAssetByName("icon_friendlist_png") as BitmapDataAsset);
            };
        }

        override public function enable(_arg_1:Boolean):void
        {
            canvas.blend = ((disabled) ? 0.5 : 1);
        }

        override protected function onTimerEvent(_arg_1:TimerEvent):void
        {
            if (_hover)
            {
                _frame = (++_frame % 4);
                image = (_assets.getAssetByName((("icon_friendlist_hover_" + _frame) + "_png")) as BitmapDataAsset);
            }
            else
            {
                if (_SafeStr_4135)
                {
                    _frame = (++_frame % 2);
                    image = (_assets.getAssetByName((("icon_friendlist_notify_" + _frame) + "_png")) as BitmapDataAsset);
                };
            };
        }


    }
}//package com.sulake.habbo.friendbar.view.utils

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4135 = "_-C1J" (String#5687, DoABC#4)
// _SafeStr_8582 = "_-I13" (String#39384, DoABC#4)
// _SafeStr_8583 = "_-12q" (String#29454, DoABC#4)


