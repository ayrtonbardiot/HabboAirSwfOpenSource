// by nota

//com.sulake.habbo.ui.widget.friendrequest.FriendRequestDialog

package com.sulake.habbo.ui.widget.friendrequest
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class FriendRequestDialog 
    {

        private var _window:_SafeStr_3133;
        private var _SafeStr_4981:FriendRequestWidget;
        private var _SafeStr_4313:int;
        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _lockPosition:Boolean = false;
        private var _SafeStr_6175:Boolean = false;
        private var _SafeStr_6176:Boolean = false;

        public function FriendRequestDialog(_arg_1:FriendRequestWidget, _arg_2:int, _arg_3:int, _arg_4:String)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_4313 = _arg_2;
            _SafeStr_4128 = _arg_3;
            _userName = _arg_4;
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            if (_window)
            {
                _window.dispose();
            };
            _window = null;
        }

        private function addMouseClickListener(_arg_1:_SafeStr_3109, _arg_2:Function):void
        {
            if (_arg_1 != null)
            {
                _arg_1.setParamFlag(1, true);
                _arg_1.addEventListener("WME_CLICK", _arg_2);
            };
        }

        private function createWindow():void
        {
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            var _local_3:XmlAsset = (_SafeStr_4981.assets.getAssetByName("instant_friend_request") as XmlAsset);
            if (!_local_3)
            {
                return;
            };
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_3.content as XML), 0) as _SafeStr_3133);
            if (!_window)
            {
                return;
            };
            _window.addEventListener("WE_DEACTIVATED", onDeactivated);
            var _local_6:IRegionWindow = (_window.findChildByName("profile_region") as IRegionWindow);
            if (_local_6)
            {
                _local_6.procedure = onProfile;
                _local_6.toolTipCaption = _SafeStr_4981.localizations.getLocalization("infostand.profile.link.tooltip", "");
                _local_6.toolTipDelay = 100;
            };
            var _local_4:ITextWindow = (_window.findChildByName("text") as ITextWindow);
            if (_local_4)
            {
                _local_4.text = _SafeStr_4981.localizations.registerParameter("widget.friendrequest.from", "username", _userName);
            };
            var _local_7:_SafeStr_3109 = _window.findChildByName("accept_button");
            addMouseClickListener(_local_7, onAccept);
            var _local_5:_SafeStr_3109 = _window.findChildByName("decline_button");
            addMouseClickListener(_local_5, onDecline);
            var _local_2:_SafeStr_3109 = _window.findChildByName("close_button");
            addMouseClickListener(_local_2, onClose);
            var _local_1:IIconWindow = (_window.findChildByName("profile_icon") as IIconWindow);
            _local_1.procedure = onProfileIcon;
            _window.procedure = windowEventHandler;
            _window.visible = false;
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (!_arg_1)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "WME_OVER":
                    _lockPosition = true;
                    return;
                case "WME_OUT":
                    _lockPosition = false;
                    return;
                case "WME_DOWN":
                    _SafeStr_6175 = true;
                    return;
                case "WME_UP":
                case "WME_UP_OUTSIDE":
                    _SafeStr_6175 = false;
                    return;
            };
        }

        public function setImageAsset(_arg_1:_SafeStr_3264, _arg_2:String):void
        {
            if ((((!(_arg_1)) || (!(_SafeStr_4981))) || (!(_SafeStr_4981.assets))))
            {
                return;
            };
            var _local_4:BitmapDataAsset = (_SafeStr_4981.assets.getAssetByName(_arg_2) as BitmapDataAsset);
            if (!_local_4)
            {
                return;
            };
            var _local_3:BitmapData = (_local_4.content as BitmapData);
            if (!_local_3)
            {
                return;
            };
            if (_arg_1.bitmap)
            {
                _arg_1.bitmap.dispose();
            };
            _arg_1.bitmap = new BitmapData(_arg_1.width, _arg_1.height, true, 0);
            _arg_1.bitmap.draw(_local_3);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function show():void
        {
            if (_window != null)
            {
                _window.visible = true;
                _window.activate();
            };
        }

        public function set targetRect(_arg_1:Rectangle):void
        {
            var _local_4:* = null;
            if (!_arg_1)
            {
                _SafeStr_4981.ignoreRequest(_SafeStr_4313);
                return;
            };
            if (((_lockPosition) || (_SafeStr_6175)))
            {
                return;
            };
            var _local_2:Boolean = true;
            if (!_window)
            {
                createWindow();
                _local_2 = false;
            };
            if (!_window)
            {
                return;
            };
            var _local_5:Point = new Point(((_arg_1.left + (_arg_1.width / 2)) - (_window.width / 2)), ((_arg_1.top - _window.height) + 10));
            var _local_3:Number = Point.distance(_window.position, _local_5);
            if (((_local_2) && (_local_3 > 5)))
            {
                _local_4 = Point.interpolate(_window.position, _local_5, 0.5);
                _window.x = _local_4.x;
                _window.y = _local_4.y;
            }
            else
            {
                _window.x = _local_5.x;
                _window.y = _local_5.y;
            };
            if (!_window.visible)
            {
                show();
            };
            if (_SafeStr_6176)
            {
                show();
                _SafeStr_6176 = false;
            };
        }

        private function onDeactivated(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_6176 = true;
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.ignoreRequest(_SafeStr_4313);
            };
        }

        private function onAccept(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.acceptRequest(_SafeStr_4313);
            };
        }

        private function onDecline(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.declineRequest(_SafeStr_4313);
            };
        }

        private function onProfile(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4981.showProfile(_SafeStr_4128, "instantFriendRequest_name");
            };
            if (_arg_1.type == "WME_OVER")
            {
                _local_3 = (_window.findChildByName("text") as ITextWindow);
                _local_3.underline = true;
            };
            if (_arg_1.type == "WME_OUT")
            {
                _local_3 = (_window.findChildByName("text") as ITextWindow);
                _local_3.underline = false;
            };
        }

        private function onProfileIcon(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_4981.showProfile(_SafeStr_4128, "instantFriendRequest_icon");
            };
            if (_arg_1.type == "WME_OVER")
            {
                _local_3 = (_window.findChildByName("profile_icon") as IIconWindow);
                _local_3.style = 22;
                _local_3.invalidate();
            };
            if (_arg_1.type == "WME_OUT")
            {
                _local_3 = (_window.findChildByName("profile_icon") as IIconWindow);
                _local_3.style = 21;
                _local_3.invalidate();
            };
        }


    }
}//package com.sulake.habbo.ui.widget.friendrequest

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4313 = "_-B7" (String#2703, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6175 = "_-p12" (String#11802, DoABC#4)
// _SafeStr_6176 = "_-jo" (String#13383, DoABC#4)


