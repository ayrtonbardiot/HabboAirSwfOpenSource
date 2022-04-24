// by nota

//com.sulake.habbo.ui.widget.furniture.contextmenu.RandomTeleportContextMenuView

package com.sulake.habbo.ui.widget.furniture.contextmenu
{
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class RandomTeleportContextMenuView extends FurnitureContextInfoView 
    {

        private var _SafeStr_4750:int;

        public function RandomTeleportContextMenuView(_arg_1:_SafeStr_3149)
        {
            super(_arg_1);
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            if (_SafeStr_5538)
            {
                activeView = getMinimizedView();
            }
            else
            {
                if (!_window)
                {
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("random_teleport_menu")).content as XML);
                    _window = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                    if (!_window)
                    {
                        return;
                    };
                    _window.addEventListener("WME_OVER", onMouseHoverEvent);
                    _window.addEventListener("WME_OUT", onMouseHoverEvent);
                    _window.findChildByName("minimize").addEventListener("WME_CLICK", onMinimize);
                    _window.findChildByName("minimize").addEventListener("WME_OVER", onMinimizeHover);
                    _window.findChildByName("minimize").addEventListener("WME_OUT", onMinimizeHover);
                };
                _window.findChildByName("furni_name").caption = "${furni.random_teleport.name}";
                _window.findChildByName("buttons").procedure = buttonEventProc;
                _window.visible = false;
                activeView = _window;
                _lockPosition = false;
            };
        }

        override protected function buttonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((disposed) || (!(_window))) || (_window.disposed)))
            {
                return;
            };
            var _local_3:Boolean;
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.name == "button")
                {
                    switch (_arg_2.parent.name)
                    {
                        case "use":
                            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetFurniActionMessage("RWFAM_USE", _SafeStr_3984.getId(), _SafeStr_4750));
                    };
                };
                _local_3 = true;
            }
            else
            {
                super.buttonEventProc(_arg_1, _arg_2);
            };
            if (_local_3)
            {
                _SafeStr_4981.removeView(this, false);
            };
        }

        public function set objectCategory(_arg_1:int):void
        {
            _SafeStr_4750 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.contextmenu

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)
// _SafeStr_4750 = "_-E1d" (String#2700, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)


