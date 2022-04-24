// by nota

//com.sulake.habbo.ui.widget.avatarinfo.UserNameView

package com.sulake.habbo.ui.widget.avatarinfo
{
    public class UserNameView extends AvatarContextInfoView 
    {

        public static const DEFAULT_BG_COLOR:uint = 4288528218;
        public static const DEFAULT_FADE_DELAY_MS:int = 8000;

        private var _SafeStr_4157:int;
        private var _SafeStr_5610:Boolean;

        public function UserNameView(_arg_1:AvatarInfoWidget, _arg_2:Boolean=false)
        {
            super(_arg_1);
            _SafeStr_5610 = _arg_2;
        }

        public static function setup(_arg_1:UserNameView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:uint=4288528218, _arg_8:int=8000):void
        {
            _arg_1._SafeStr_4157 = _arg_6;
            _arg_1._SafeStr_8960 = _arg_8;
            AvatarContextInfoView.setup(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, false);
            _arg_1._window.color = _arg_7;
        }


        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get isGameRoomMode():Boolean
        {
            return (_SafeStr_5610);
        }

        override public function get maximumBlend():Number
        {
            if (_SafeStr_5610)
            {
                return (0.75);
            };
            return (super.maximumBlend);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_5610 = "_-o12" (String#14402, DoABC#4)
// _SafeStr_8960 = "_-pq" (String#14751, DoABC#4)


