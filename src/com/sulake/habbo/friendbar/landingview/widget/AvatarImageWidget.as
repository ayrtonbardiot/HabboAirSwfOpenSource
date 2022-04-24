// by nota

//com.sulake.habbo.friendbar.landingview.widget.AvatarImageWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.components._SafeStr_3199;
    import _-yL._SafeStr_528;
    import _-Ol._SafeStr_327;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.avatar.events.AvatarUpdateEvent;
    import com.sulake.habbo.window.widgets._SafeStr_3289;

    public class AvatarImageWidget implements ILandingViewWidget 
    {

        private var _landingView:HabboLandingView;
        private var _SafeStr_6928:_SafeStr_3199;
        private var _SafeStr_6790:_SafeStr_528;
        private var _SafeStr_6927:_SafeStr_327;

        public function AvatarImageWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
            _SafeStr_6790 = new _SafeStr_528(onUserObject);
            _SafeStr_6927 = new _SafeStr_327(onUserChange);
            _landingView.communicationManager.addHabboConnectionMessageEvent(_SafeStr_6790);
            _landingView.communicationManager.addHabboConnectionMessageEvent(_SafeStr_6927);
            _landingView.avatarEditor.events.addEventListener("AVATAR_FIGURE_UPDATED", onAvatarFigureUpdated);
        }

        public function get container():_SafeStr_3109
        {
            return (_SafeStr_6928);
        }

        public function dispose():void
        {
            if (_SafeStr_6790 != null)
            {
                _landingView.communicationManager.removeHabboConnectionMessageEvent(_SafeStr_6790);
                _SafeStr_6790 = null;
            };
            if (_SafeStr_6927 != null)
            {
                _landingView.communicationManager.removeHabboConnectionMessageEvent(_SafeStr_6927);
                _SafeStr_6927 = null;
            };
            if (_landingView != null)
            {
                _landingView.avatarEditor.events.removeEventListener("AVATAR_FIGURE_UPDATED", onAvatarFigureUpdated);
                _landingView = null;
            };
            _SafeStr_6928 = null;
        }

        public function initialize():void
        {
            _SafeStr_6928 = _SafeStr_3199(_landingView.getXmlWindow("avatar_image"));
        }

        public function refresh():void
        {
            refreshAvatarInfo();
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        private function onUserObject(_arg_1:_SafeStr_528):void
        {
            refreshAvatarInfo(_arg_1.getParser().figure);
        }

        private function onUserChange(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_327 = (_arg_1 as _SafeStr_327);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.id == -1)
            {
                refreshAvatarInfo(_local_2.figure);
            };
        }

        private function onAvatarFigureUpdated(_arg_1:AvatarUpdateEvent):void
        {
            refreshAvatarInfo(_arg_1.figure);
        }

        private function refreshAvatarInfo(_arg_1:String=null):void
        {
            var _local_2:* = null;
            if (((!(_arg_1)) && (_landingView.sessionDataManager)))
            {
                _arg_1 = _landingView.sessionDataManager.figure;
            };
            if (_SafeStr_6928 != null)
            {
                _local_2 = (_SafeStr_6928.widget as _SafeStr_3289);
                if (_local_2 != null)
                {
                    _local_2.figure = _arg_1;
                };
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_327 = "_-Uf" (String#3336, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_6790 = "_-QC" (String#3295, DoABC#4)
// _SafeStr_6927 = "_-K1g" (String#4761, DoABC#4)
// _SafeStr_6928 = "_-l1f" (String#9666, DoABC#4)


