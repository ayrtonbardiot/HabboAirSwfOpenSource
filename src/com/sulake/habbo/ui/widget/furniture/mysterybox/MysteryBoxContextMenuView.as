// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.mysterybox.MysteryBoxContextMenuView

package com.sulake.habbo.ui.widget.furniture.mysterybox
{
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextInfoView;
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.furniture.contextmenu.FurnitureContextMenuWidget;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MysteryBoxContextMenuView extends FurnitureContextInfoView 
    {

        private var _SafeStr_6121:Boolean;

        public function MysteryBoxContextMenuView(_arg_1:_SafeStr_3149)
        {
            super(_arg_1);
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if ((((_SafeStr_4981 == null) || (_SafeStr_4981.assets == null)) || (_SafeStr_4981.windowManager == null)))
            {
                return;
            };
            if (_SafeStr_5538)
            {
                activeView = getMinimizedView();
            }
            else
            {
                if (((_window == null) || (_window.disposed)))
                {
                    _local_1 = (_SafeStr_4981.assets.getAssetByName("mysterybox_menu").content as XML);
                    _window = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                    if (_window == null)
                    {
                        return;
                    };
                    _window.addEventListener("WME_OVER", onMouseHoverEvent);
                    _window.addEventListener("WME_OUT", onMouseHoverEvent);
                    _local_2 = _window.findChildByName("minimize");
                    if (_local_2 != null)
                    {
                        _local_2.addEventListener("WME_CLICK", onMinimize);
                        _local_2.addEventListener("WME_OVER", onMinimizeHover);
                        _local_2.addEventListener("WME_OUT", onMinimizeHover);
                    };
                };
                _window.findChildByName("buttons").procedure = buttonEventProc;
                _window.visible = false;
                activeView = _window;
                _lockPosition = false;
                refreshOwnerMode();
            };
        }

        private function refreshOwnerMode():void
        {
            if (_window == null)
            {
                return;
            };
            _window.findChildByName("label").caption = (("${mysterybox.context." + ((_SafeStr_6121) ? "owner" : "other")) + ".use}");
        }

        override protected function buttonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            if ((((disposed) || (_window == null)) || (_window.disposed)))
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
                            _local_4 = (_SafeStr_4981 as FurnitureContextMenuWidget);
                            if (_local_4 != null)
                            {
                                _local_4.showMysteryBoxOpenDialog(_SafeStr_3984);
                            };
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

        public function set isOwnerMode(_arg_1:Boolean):void
        {
            _SafeStr_6121 = _arg_1;
            refreshOwnerMode();
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.mysterybox

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_6121 = "_-JW" (String#22518, DoABC#4)


