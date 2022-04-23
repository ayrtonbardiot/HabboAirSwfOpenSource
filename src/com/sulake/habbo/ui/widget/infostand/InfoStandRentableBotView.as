// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.infostand.InfoStandRentableBotView

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import _-j1G._SafeStr_282;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class InfoStandRentableBotView 
    {

        private static const STATUS_BAR_WIDTH:int = 162;
        private static const STATUS_BAR_HEIGHT:int = 16;
        private static const ITEM_SPACER:int = 5;
        private static const STATUS_BAR_HIGHLIGHT_HEIGHT:int = 4;
        private static const STATUS_BAR_BORDER_COLOR:uint = 0xDADADA;
        private static const STATUS_BAR_BG_COLOR:uint = 0x3A3A3A;
        private static const STATUS_BAR_EXPIRE_HIGHLIGHT_COLOR:uint = 2085362;
        private static const STATUS_BAR_EXPIRE_CONTENT_COLOR:uint = 39616;
        private static const FIELD_NAME:String = "name_text";
        private static const FIELD_DESCRIPTION:String = "description_text";
        private static const FIELD_HAND_ITEM:String = "handitem_text";
        private static const FIELD_OWNER:String = "owner_text";
        private static const FIELD_EXPIRE_TIME:String = "expire_time_left";
        private static const FIELD_EXPIRE_HEADER:String = "expire_time_info";
        private static const SPACER_HAND_ITEM:String = "handitem_spacer";
        private static const BUTTONS_MAX_WIDTH:int = 250;
        private static const BUTTON_HEIGHT:int = 25;
        private static const BUTTON_MARGIN:int = 5;

        private var _catalog:IHabboCatalog;
        private var _habboTracking:_SafeStr_1704;
        private var _SafeStr_4981:InfoStandWidget;
        private var _window:IItemListWindow;
        private var _SafeStr_5484:_SafeStr_3195;
        private var _buttonsContainer:_SafeStr_3133;
        private var _SafeStr_5485:IItemListWindow;
        private var _SafeStr_4615:String;
        private var _SafeStr_5666:int;
        private var _disposed:Boolean;

        public function InfoStandRentableBotView(_arg_1:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            _SafeStr_4981 = _arg_1;
            _catalog = _arg_3;
            _habboTracking = HabboTracking.getInstance();
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            _catalog = null;
            _habboTracking = null;
            _SafeStr_5484 = null;
            _buttonsContainer = null;
            _SafeStr_5485 = null;
            if (_window)
            {
                _window.dispose();
            };
            _window = null;
            _disposed = true;
        }

        public function get window():IItemListWindow
        {
            return (_window);
        }

        private function updateWindow():void
        {
            if ((((_SafeStr_5485 == null) || (_SafeStr_5484 == null)) || (_buttonsContainer == null)))
            {
                return;
            };
            _buttonsContainer.width = _buttonsContainer.width;
            _buttonsContainer.visible = (_buttonsContainer.width > 0);
            _SafeStr_5485.height = _SafeStr_5485.scrollableRegion.height;
            _SafeStr_5484.height = (_SafeStr_5485.height + 20);
            _window.width = Math.max(_SafeStr_5484.width, _buttonsContainer.width);
            _window.height = _window.scrollableRegion.height;
            if (_SafeStr_5484.width < _buttonsContainer.width)
            {
                _SafeStr_5484.x = (_window.width - _SafeStr_5484.width);
                _buttonsContainer.x = 0;
            }
            else
            {
                _buttonsContainer.x = (_window.width - _buttonsContainer.width);
                _SafeStr_5484.x = 0;
            };
            _SafeStr_4981.refreshContainer();
        }

        public function update(_arg_1:RoomWidgetRentableBotInfoUpdateEvent):void
        {
            _SafeStr_5666 = _arg_1.webID;
            setFieldText("name_text", true, _arg_1.name);
            setFieldText("description_text", true, _arg_1.motto);
            if (_arg_1.ownerId > -1)
            {
                _SafeStr_4981.localizations.registerParameter("infostand.text.botowner", "name", _arg_1.ownerName);
                setFieldText("owner_text", true, _SafeStr_4981.localizations.getLocalization("infostand.text.botowner"));
            }
            else
            {
                setFieldText("owner_text", false, "");
            };
            updateRentExpireField();
            setCarryItem(_arg_1.carryItem);
            var _local_2:Array = _arg_1.badges;
            setBadge((((_local_2) && (_local_2.length > 0)) ? _local_2[0] : null));
            setFigure(_arg_1.figure);
            showButton("whisper", false);
            showButton("ignore", false);
            showButton("unignore", false);
            showButton("pick", ((_arg_1.ownerId > -1) && ((_arg_1.amIOwner) || (_arg_1.amIAnyRoomController))));
            updateWindow();
        }

        private function updateRentExpireField():void
        {
            setFieldText("expire_time_left", false, "N/A");
            setFieldText("expire_time_info", false, "");
        }

        public function setCarryItem(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_6:ITextWindow = (_SafeStr_5485.getListItemByName("handitem_text") as ITextWindow);
            var _local_3:_SafeStr_3133 = (_SafeStr_5485.getListItemByName("handitem_spacer") as _SafeStr_3133);
            if (((_local_6 == null) || (_local_3 == null)))
            {
                return;
            };
            if (((_arg_1 > 0) && (_arg_1 < 999999)))
            {
                _local_2 = _SafeStr_4981.localizations.getLocalization(("handitem" + _arg_1), ("handitem" + _arg_1));
                _SafeStr_4981.localizations.registerParameter("infostand.text.handitem", "item", _local_2);
            };
            _local_6.height = (_local_6.textHeight + 5);
            var _local_4:Boolean = _local_6.visible;
            var _local_5:Boolean = ((_arg_1 > 0) && (_arg_1 < 999999));
            _local_6.visible = _local_5;
            _local_3.visible = _local_5;
            if (_local_5 != _local_4)
            {
                _SafeStr_5485.arrangeListItems();
            };
            updateWindow();
        }

        private function createPercentageBar(_arg_1:int, _arg_2:int, _arg_3:uint, _arg_4:uint):BitmapData
        {
            _arg_2 = Math.max(_arg_2, 1);
            _arg_1 = Math.max(_arg_1, 0);
            if (_arg_1 > _arg_2)
            {
                _arg_1 = _arg_2;
            };
            var _local_10:Number = (_arg_1 / _arg_2);
            var _local_9:int = 1;
            var _local_7:BitmapData = new BitmapData(162, 16, false);
            _local_7.fillRect(new Rectangle(0, 0, _local_7.width, _local_7.height), 0xDADADA);
            var _local_8:Rectangle = new Rectangle(_local_9, _local_9, (_local_7.width - (_local_9 * 2)), (_local_7.height - (_local_9 * 2)));
            _local_7.fillRect(_local_8, 0x3A3A3A);
            var _local_6:Rectangle = new Rectangle(_local_9, (_local_9 + 4), (_local_7.width - (_local_9 * 2)), ((_local_7.height - (_local_9 * 2)) - 4));
            _local_6.width = (_local_10 * _local_6.width);
            _local_7.fillRect(_local_6, _arg_3);
            var _local_5:Rectangle = new Rectangle(_local_9, _local_9, (_local_7.width - (_local_9 * 2)), 4);
            _local_5.width = (_local_10 * _local_5.width);
            _local_7.fillRect(_local_5, _arg_4);
            return (_local_7);
        }

        private function createWindow(_arg_1:String):void
        {
            var _local_5:XmlAsset = (_SafeStr_4981.assets.getAssetByName("rentable_bot_view") as XmlAsset);
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_5.content as XML)) as IItemListWindow);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _SafeStr_5484 = (_window.getListItemByName("info_border") as _SafeStr_3195);
            if (_SafeStr_5484 != null)
            {
                _SafeStr_5485 = (_SafeStr_5484.findChildByName("infostand_element_list") as IItemListWindow);
            };
            _window.name = _arg_1;
            _SafeStr_4981.mainContainer.addChild(_window);
            var _local_4:_SafeStr_3109 = _SafeStr_5484.findChildByTag("close");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onClose);
            };
            _buttonsContainer = (_window.getListItemByName("button_list") as _SafeStr_3133);
            if (_buttonsContainer == null)
            {
                return;
            };
            var _local_3:Array = [];
            _buttonsContainer.groupChildrenWithTag("CMD_BUTTON", _local_3, -1);
            for each (var _local_2:_SafeStr_3109 in _local_3)
            {
                _local_2.addEventListener("WME_CLICK", onButtonClicked);
            };
            for each (var _local_6:_SafeStr_3109 in _local_3)
            {
                if (_local_6.parent)
                {
                    _local_6.parent.width = _local_6.width;
                };
                _local_6.addEventListener("WE_RESIZED", onButtonResized);
            };
        }

        private function setFieldText(_arg_1:String, _arg_2:Boolean, _arg_3:String):void
        {
            var _local_5:* = null;
            if (_SafeStr_5485 == null)
            {
                return;
            };
            var _local_4:ITextWindow = (_SafeStr_5485.getListItemByName(_arg_1) as ITextWindow);
            if (_local_4 == null)
            {
                _local_5 = (_SafeStr_5485.getListItemByName("description_container") as _SafeStr_3133);
                if (_local_5 == null)
                {
                    return;
                };
                _local_4 = (_local_5.findChildByName(_arg_1) as ITextWindow);
                if (!_local_4)
                {
                    return;
                };
            };
            _local_4.text = _arg_3;
            _local_4.visible = _arg_2;
        }

        private function setFigure(_arg_1:String):void
        {
            var _local_2:_SafeStr_3289 = (_SafeStr_3199(_SafeStr_5484.findChildByName("avatar_image")).widget as _SafeStr_3289);
            _local_2.figure = _arg_1;
        }

        private function setBadge(_arg_1:String):void
        {
            var _local_2:_SafeStr_3349 = (_SafeStr_3199(_SafeStr_5484.findChildByName("badge")).widget as _SafeStr_3349);
            _local_2.badgeId = _arg_1;
        }

        protected function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.target.name == "pick")
            {
                _SafeStr_4981.handler.container.connection.send(new _SafeStr_282(_SafeStr_5666));
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.close();
        }

        protected function showButton(_arg_1:String, _arg_2:Boolean):void
        {
            if (_buttonsContainer == null)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = _buttonsContainer.getChildByName(_arg_1);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
                arrangeButtons();
            };
        }

        protected function onButtonResized(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.window.parent;
            if (((_local_2) && (_local_2.tags.indexOf("CMD_BUTTON_REGION") > -1)))
            {
                _local_2.width = _arg_1.window.width;
            };
        }

        private function arrangeButtons():void
        {
            var _local_5:* = 250;
            _buttonsContainer.width = _local_5;
            var _local_2:Array = [];
            _buttonsContainer.groupChildrenWithTag("CMD_BUTTON_REGION", _local_2, -1);
            var _local_1:* = _local_5;
            var _local_3:int;
            for each (var _local_4:_SafeStr_3109 in _local_2)
            {
                if (_local_4.visible)
                {
                    if ((_local_1 - _local_4.width) < 0)
                    {
                        _local_1 = _local_5;
                        _local_3 = (_local_3 + (25 + 5));
                    };
                    _local_4.x = (_local_1 - _local_4.width);
                    _local_4.y = _local_3;
                    _local_1 = (_local_4.x - 5);
                };
            };
            _buttonsContainer.height = (_local_3 + 25);
            updateWindow();
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_282 = "_-v1d" (String#12925, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5484 = "_-d1w" (String#599, DoABC#4)
// _SafeStr_5485 = "_-FZ" (String#843, DoABC#4)
// _SafeStr_5666 = "_-32J" (String#3660, DoABC#4)


