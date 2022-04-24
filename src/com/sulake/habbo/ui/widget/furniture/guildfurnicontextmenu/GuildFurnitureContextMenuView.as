// by nota

//com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu.GuildFurnitureContextMenuView

package com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu
{
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
    import com.sulake.habbo.groups._SafeStr_1757;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;

    public class GuildFurnitureContextMenuView extends FurnitureContextInfoView 
    {

        protected var _SafeStr_5061:_SafeStr_1757;
        protected var _windowManager:_SafeStr_1695;
        public var _SafeStr_4332:int = -1;
        public var _SafeStr_4333:int = -1;
        public var _SafeStr_4334:Boolean = false;
        public var _SafeStr_4335:Boolean = false;

        public function GuildFurnitureContextMenuView(_arg_1:_SafeStr_3149, _arg_2:_SafeStr_1757, _arg_3:_SafeStr_1695)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
            _SafeStr_5061 = _arg_2;
            _windowManager = _arg_3;
        }

        override public function dispose():void
        {
            _SafeStr_5061 = null;
            _windowManager = null;
            super.dispose();
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
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
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("guild_furni_menu")).content as XML);
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
                _buttons = (_window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = buttonEventProc;
                _local_2 = (_window.findChildByName("profile_link") as IRegionWindow);
                if (_local_2)
                {
                    _local_2.procedure = buttonEventProc;
                    _local_2.toolTipCaption = widget.localizations.getLocalization("infostand.profile.link.tooltip", "Click to view profile");
                    _local_2.toolTipDelay = 100;
                };
                _window.findChildByName("name").caption = _SafeStr_4004;
                _window.visible = false;
                activeView = _window;
                updateButtons();
                _lockPosition = false;
            };
        }

        protected function updateButtons():void
        {
            if (((!(_window)) || (!(_buttons))))
            {
                return;
            };
            _buttons.autoArrangeItems = false;
            showButton("join", (!(_SafeStr_4334)), true);
            showButton("open_forum", _SafeStr_4335, true);
            _buttons.autoArrangeItems = true;
            _buttons.visible = true;
        }

        override protected function buttonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            if (disposed)
            {
                return;
            };
            if (((!(_window)) || (_window.disposed)))
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
                        case "join":
                            widget.handler.sendJoinToGroupMessage(_SafeStr_4332);
                            showButton("join", (!(_SafeStr_4334)), false);
                            break;
                        case "home_room":
                            widget.handler.sendGoToHomeRoomMessage(_SafeStr_4333);
                            break;
                        case "open_forum":
                            if (((!(widget == null)) && (!(widget.roomEngine == null))))
                            {
                                _local_4 = (widget.roomEngine as _SafeStr_20);
                                if (_local_4.context != null)
                                {
                                    _local_4.context.createLinkEvent(("groupforum/" + _SafeStr_4332));
                                    break;
                                };
                            };
                    };
                };
                if (_arg_2.name == "profile_link")
                {
                    _SafeStr_5061.openGroupInfo(_SafeStr_4332);
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

        private function get widget():FurnitureContextMenuWidget
        {
            return (_SafeStr_4981 as FurnitureContextMenuWidget);
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.guildfurnicontextmenu

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1757 = "_-h1P" (String#4520, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_4004 = "_-41o" (String#1978, DoABC#4)
// _SafeStr_4332 = "_-lq" (String#5644, DoABC#4)
// _SafeStr_4333 = "_-uF" (String#23601, DoABC#4)
// _SafeStr_4334 = "_-YN" (String#19264, DoABC#4)
// _SafeStr_4335 = "_-z3" (String#23139, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5061 = "_-v1S" (String#5449, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)


