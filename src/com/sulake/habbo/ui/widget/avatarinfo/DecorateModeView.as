// by nota

//com.sulake.habbo.ui.widget.avatarinfo.DecorateModeView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class DecorateModeView extends AvatarContextInfoButtonView 
    {

        public function DecorateModeView(_arg_1:AvatarInfoWidget, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
            AvatarContextInfoButtonView.setup(this, _arg_2, _arg_3, _arg_4, 1);
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            if (!_window)
            {
                _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("own_avatar_decorating")).content as XML);
                _window = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                if (!_window)
                {
                    return;
                };
                _window.addEventListener("WME_OVER", onMouseHoverEvent);
                _window.addEventListener("WME_OUT", onMouseHoverEvent);
                _buttons = (_window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = eventProc;
                updateButtons();
            };
            activeView = _window;
        }

        override public function show():void
        {
            if (_SafeStr_5531 != null)
            {
                _SafeStr_5531.visible = true;
                _SafeStr_5531.activate();
            };
        }

        override public function hide(_arg_1:Boolean):void
        {
            if (_SafeStr_5531 != null)
            {
                _SafeStr_5531.visible = false;
            };
            _lockPosition = false;
        }

        override protected function set activeView(_arg_1:_SafeStr_3133):void
        {
            if (!_arg_1)
            {
                return;
            };
            _SafeStr_5531 = _arg_1;
        }

        public function isVisible():Boolean
        {
            return ((_SafeStr_5531) && (_SafeStr_5531.visible));
        }

        public function updateButtons():void
        {
            showButton("decorate");
        }

        private function eventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (disposed)
            {
                return;
            };
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            };
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.name == "button")
                {
                    switch (_arg_2.parent.name)
                    {
                        case "decorate":
                            widget.isUserDecorating = false;
                    };
                };
            }
            else
            {
                if (_arg_1.type == "WME_OVER")
                {
                    super.buttonEventProc(_arg_1, _arg_2);
                    _lockPosition = true;
                }
                else
                {
                    if (_arg_1.type == "WME_OUT")
                    {
                        super.buttonEventProc(_arg_1, _arg_2);
                        _lockPosition = false;
                    }
                    else
                    {
                        super.buttonEventProc(_arg_1, _arg_2);
                    };
                };
            };
        }

        override public function get maximumBlend():Number
        {
            return (0.8);
        }

        private function get widget():AvatarInfoWidget
        {
            return (_SafeStr_4981 as AvatarInfoWidget);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5531 = "_-V14" (String#2652, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)


