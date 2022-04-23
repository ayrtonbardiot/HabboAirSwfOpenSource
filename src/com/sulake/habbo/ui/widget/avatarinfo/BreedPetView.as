// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.avatarinfo.BreedPetView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.events.UseProductItem;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class BreedPetView extends AvatarContextInfoButtonView 
    {

        private static const MODE_NORMAL:int = 0;

        private var _SafeStr_3771:int;
        private var _SafeStr_5630:UseProductItem;
        private var _SafeStr_5690:Boolean;

        public function BreedPetView(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
        }

        public static function setup(_arg_1:BreedPetView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:UseProductItem, _arg_7:Boolean):void
        {
            _arg_1._SafeStr_5630 = _arg_6;
            _arg_1._SafeStr_5690 = _arg_7;
            AvatarContextInfoButtonView.setup(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        public function get objectId():int
        {
            return (_SafeStr_5630.id);
        }

        public function get requestRoomObjectId():int
        {
            return (_SafeStr_5630.requestRoomObjectId);
        }

        override public function dispose():void
        {
            if (_window)
            {
                _window.removeEventListener("WME_OVER", onMouseHoverEvent);
                _window.removeEventListener("WME_OUT", onMouseHoverEvent);
            };
            if (_SafeStr_5630)
            {
                _SafeStr_5630.dispose();
            };
            _SafeStr_5630 = null;
            super.dispose();
        }

        private function resolveMode():void
        {
            var _local_1:int = widget.handler.roomSession.roomId;
            _SafeStr_3771 = 0;
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            resolveMode();
            if (_SafeStr_5538)
            {
                activeView = getMinimizedView();
            }
            else
            {
                if (!_window)
                {
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("breed_pet_menu")).content as XML);
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

        public function updateButtons():void
        {
            var _local_2:int;
            if (((!(_window)) || (!(_buttons))))
            {
                return;
            };
            _buttons.autoArrangeItems = false;
            var _local_1:int = _buttons.numListItems;
            _local_2 = 0;
            while (_local_2 < _local_1)
            {
                _buttons.getListItemAt(_local_2).visible = false;
                _local_2++;
            };
            switch (_SafeStr_3771)
            {
                case 0:
                    if (_SafeStr_5690)
                    {
                        showButton("breed");
                    };
                default:
            };
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
                    _local_3 = true;
                    switch (_arg_2.parent.name)
                    {
                        case "breed":
                            widget.showBreedMonsterPlantsConfirmationView(_SafeStr_5630.requestRoomObjectId, _SafeStr_5630.targetRoomObjectId, false);
                    };
                };
                if (_local_4)
                {
                    _SafeStr_4981.messageListener.processWidgetMessage(_local_4);
                };
            }
            else
            {
                super.buttonEventProc(_arg_1, _arg_2);
            };
            if (_local_3)
            {
                widget.removeBreedPetViews();
            };
        }

        private function changeMode(_arg_1:int):void
        {
            _SafeStr_3771 = _arg_1;
            updateButtons();
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
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_5630 = "_-f1n" (String#3300, DoABC#4)
// _SafeStr_5690 = "_-e1I" (String#3456, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)


