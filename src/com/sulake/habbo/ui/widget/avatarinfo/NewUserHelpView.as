// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.avatarinfo.NewUserHelpView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window._SafeStr_3133;

    public class NewUserHelpView extends AvatarContextInfoButtonView 
    {

        private var _caption:String = "";

        public function NewUserHelpView(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
            _caption = _arg_1.localization.getLocalization("room.enter.infostand.caption", "");
            _SafeStr_8960 = _arg_1.configuration.getInteger("room.enter.infostand.fade.start.delay", 5000);
        }

        public static function setup(_arg_1:AvatarContextInfoButtonView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int):void
        {
            AvatarContextInfoButtonView.setup(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override protected function updateWindow():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            if (!_window)
            {
                _local_1 = (_SafeStr_4981.assets.getAssetByName("new_user_help").content as XML);
                _window = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                if (!_window)
                {
                    return;
                };
                _local_2 = _window.findChildByName("help");
                _local_2.caption = _caption;
                _window.invalidate();
            };
            activeView = _window;
        }

        public function get widget():AvatarInfoWidget
        {
            return (_SafeStr_4981 as AvatarInfoWidget);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_8960 = "_-pq" (String#14751, DoABC#4)


