// by nota

//com.sulake.habbo.ui.widget.avatarinfo.RentableBotMenuView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import _-6L._SafeStr_1630;
    import com.sulake.core.assets.XmlAsset;
    import _-j1G._SafeStr_282;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import _-T1V._SafeStr_849;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class RentableBotMenuView extends AvatarContextInfoButtonView 
    {

        protected var _SafeStr_3740:_SafeStr_3344;

        public function RentableBotMenuView(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
        }

        public static function setup(_arg_1:RentableBotMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:_SafeStr_3344):void
        {
            _arg_1._SafeStr_3740 = _arg_6;
            AvatarContextInfoButtonView.setup(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override public function dispose():void
        {
            if (_window)
            {
                _window.removeEventListener("WME_OVER", onMouseHoverEvent);
                _window.removeEventListener("WME_OUT", onMouseHoverEvent);
            };
            _SafeStr_3740 = null;
            super.dispose();
        }

        protected function updateButtons():void
        {
            var _local_6:int;
            var _local_9:* = null;
            var _local_4:* = null;
            var _local_10:int;
            if (((!(_window)) || (!(_SafeStr_3740))))
            {
                return;
            };
            var _local_2:IItemListWindow = (_window.findChildByName("buttons") as IItemListWindow);
            if (!_local_2)
            {
                return;
            };
            var _local_3:_SafeStr_3133 = (_buttons.getListItemByName("link_template") as _SafeStr_3133);
            var _local_1:_SafeStr_3133 = (_buttons.getListItemByName("nux_proceed_1") as _SafeStr_3133);
            _local_2.procedure = buttonEventProc;
            _local_2.autoArrangeItems = false;
            var _local_5:int = _local_2.numListItems;
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _local_2.getListItemAt(_local_6).visible = false;
                _local_6++;
            };
            var _local_7:Boolean = ((_SafeStr_3740.amIOwner) || (_SafeStr_3740.amIAnyRoomController));
            showButton("pick", ((_SafeStr_3740.botSkills) ? ((_SafeStr_3740.botSkills.indexOf(12) == -1) && (_local_7)) : _local_7));
            if (_SafeStr_3740.botSkills)
            {
                showButton("donate_to_all", (!(_SafeStr_3740.botSkills.indexOf(25) == -1)));
                showButton("donate_to_user", (!(_SafeStr_3740.botSkills.indexOf(24) == -1)));
                if (_SafeStr_3740.amIOwner)
                {
                    showButton("change_bot_name", (!(_SafeStr_3740.botSkills.indexOf(5) == -1)));
                    showButton("dress_up", (!(_SafeStr_3740.botSkills.indexOf(1) == -1)));
                    showButton("random_walk", (!(_SafeStr_3740.botSkills.indexOf(3) == -1)));
                    showButton("setup_chat", (!(_SafeStr_3740.botSkills.indexOf(2) == -1)));
                    showButton("dance", (!(_SafeStr_3740.botSkills.indexOf(4) == -1)));
                };
                showButton("nux_take_tour", (!(_SafeStr_3740.botSkills.indexOf(10) == -1)));
            };
            for each (var _local_8:_SafeStr_1630 in _SafeStr_3740.botSkillsWithCommands)
            {
                if (_local_8.id == 7)
                {
                    _local_4 = (_local_3.clone() as _SafeStr_3133);
                    _local_9 = _local_8.data.split(",");
                    if (_local_9.length == 2)
                    {
                        _local_4.findChildByName("label").caption = _local_9[0];
                        _local_4.name = (":link " + _local_9[1]);
                        _local_4.visible = true;
                        _local_2.addListItem(_local_4);
                    };
                };
                if (_local_8.id == 8)
                {
                    if (_local_8.data == "")
                    {
                        showButton("nux_proceed_1", true);
                    }
                    else
                    {
                        _local_9 = _local_8.data.split(",");
                        if (_local_9.length == 2)
                        {
                            _local_10 = parseInt(_local_9[1]);
                            if (_local_10 == 1)
                            {
                                showButton("nux_proceed_1", true);
                                _SafeStr_3133(_local_2.getListItemByName("nux_proceed_1")).findChildByName("label").caption = _local_9[0];
                            }
                            else
                            {
                                _local_4 = (_local_1.clone() as _SafeStr_3133);
                                _local_4.visible = true;
                                _local_4.name = ("nux_proceed_" + _local_10);
                                _local_4.findChildByName("label").caption = _local_9[0];
                                _local_2.addListItemAt(_local_4, ((_local_2.getListItemIndex(_local_2.getListItemByName("nux_proceed_1")) + _local_10) - 1));
                            };
                        };
                    };
                };
                if (_local_8.id == 14)
                {
                    _local_4 = (_local_3.clone() as _SafeStr_3133);
                    _local_9 = _local_8.data.split(",");
                    if (_local_9.length == 2)
                    {
                        _local_4.findChildByName("label").caption = _local_9[0];
                        _local_4.name = (":link navigator/search/" + _local_9[1]);
                        _local_4.visible = true;
                        _local_2.addListItem(_local_4);
                    };
                };
            };
            _local_2.autoArrangeItems = true;
            _local_2.visible = true;
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
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("avatar_menu_widget")).content as XML);
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
                _window.findChildByName("name").caption = _userName;
                _window.visible = false;
                activeView = _window;
                updateButtons();
            };
        }

        override protected function buttonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_6:* = null;
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
                    _local_5 = null;
                    switch (_arg_2.parent.name)
                    {
                        case "pick":
                            _local_3 = true;
                            widget.handler.container.connection.send(new _SafeStr_282(_SafeStr_3740.id));
                            break;
                        case "setup_chat":
                            _local_3 = true;
                            _local_5 = new Rectangle();
                            _window.getGlobalRectangle(_local_5);
                            _local_4 = new Point((_local_5.x + (_local_5.width / 2)), (_local_5.y + _local_5.height));
                            widget.openBotSkillConfigurationView(_SafeStr_3740.id, 2, _local_4);
                            break;
                        case "random_walk":
                            _local_3 = true;
                            widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 3, ""));
                            break;
                        case "dress_up":
                            _local_3 = true;
                            widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 1, ""));
                            break;
                        case "dance":
                            _local_3 = true;
                            widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 4, ""));
                            break;
                        case "donate_to_all":
                            _local_3 = true;
                            widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 25, ""));
                            break;
                        case "donate_to_user":
                            _local_3 = true;
                            widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 24, ""));
                            break;
                        case "nux_take_tour":
                            _local_3 = true;
                            widget.component.context.createLinkEvent("help/tour");
                            widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 10, ""));
                            break;
                        case "change_bot_name":
                            _local_3 = true;
                            _local_5 = new Rectangle();
                            _window.getGlobalRectangle(_local_5);
                            _local_4 = new Point((_local_5.x + (_local_5.width / 2)), (_local_5.y + _local_5.height));
                            widget.openBotSkillConfigurationView(_SafeStr_3740.id, 5, _local_4);
                    };
                    if (_arg_2.parent.name.indexOf(":link ") != -1)
                    {
                        _local_7 = _arg_2.parent.name.substr(6, (_arg_2.parent.name.length - 6));
                        widget.component.context.createLinkEvent(_local_7);
                        _local_3 = true;
                    };
                    if (_arg_2.parent.name.indexOf("nux_proceed_") != -1)
                    {
                        _local_6 = _arg_2.parent.name.substr(12, (_arg_2.parent.name.length - 12));
                        widget.handler.container.connection.send(new _SafeStr_849(_SafeStr_3740.id, 8, _local_6));
                        _local_3 = true;
                    };
                };
                updateButtons();
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

        private function get widget():AvatarInfoWidget
        {
            return (_SafeStr_4981 as AvatarInfoWidget);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_1630 = "_-N1E" (String#30603, DoABC#4)
// _SafeStr_282 = "_-v1d" (String#12925, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3344 = "_-f1h" (String#7944, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_849 = "_-E1I" (String#4167, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)


