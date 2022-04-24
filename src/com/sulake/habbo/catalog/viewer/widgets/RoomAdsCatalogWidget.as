// by nota

//com.sulake.habbo.catalog.viewer.widgets.RoomAdsCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.communication.connection.IConnection;
    import _-AE._SafeStr_570;
    import com.sulake.habbo.catalog.purchase.RoomAdPurchaseData;
    import _-Ja._SafeStr_1551;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import _-W1K._SafeStr_1571;
    import _-g1G._SafeStr_1286;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.viewer.Offer;

    public class RoomAdsCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _catalog:HabboCatalog;
        private var _SafeStr_6854:IMessageEvent = null;
        private var _name:String;
        private var _description:String;
        private var _rooms:Array;
        private var _SafeStr_6855:Boolean;
        private var _SafeStr_4957:_SafeStr_3269;

        public function RoomAdsCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1);
            _catalog = _arg_2;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            if (_catalog == null)
            {
                return (false);
            };
            var _local_4:IConnection = _catalog.connection;
            if (_SafeStr_6854 == null)
            {
                _SafeStr_6854 = new _SafeStr_570(onPurchaseInfoEvent);
                _local_4.addMessageEvent(_SafeStr_6854);
            };
            _catalog.getRoomAdsPurchaseInfo();
            window.findChildByName("name_input_text").addEventListener("WE_CHANGE", onNameWindowEvent);
            window.findChildByName("desc_input_text").addEventListener("WE_CHANGE", onDescWindowEvent);
            events.addEventListener("PURCHASE", onPurchaseConfirmationEvent);
            var _local_2:RoomAdPurchaseData = _catalog.roomAdPurchaseData;
            var _local_3:int = _catalog.getInteger("room_ad.duration.minutes", 120);
            var _local_1:int = getExtensionMinutes(_local_2, _local_3);
            _catalog.localization.registerParameter("roomad.catalog_text", "duration", _local_1);
            _catalog.roomEngine.events.addEventListener("REE_INITIALIZED", onRoomInitialized);
            populateEventCategories();
            return (true);
        }

        private function getExtensionMinutes(_arg_1:RoomAdPurchaseData, _arg_2:int):int
        {
            var _local_6:Boolean = _catalog.getBoolean("roomad.limited_extension");
            if ((((!(_local_6)) || (_arg_1 == null)) || (_arg_1.expirationTime == null)))
            {
                return (_arg_2);
            };
            var _local_8:Date = new Date();
            var _local_3:Number = _local_8.getTime();
            var _local_7:Number = _arg_1.expirationTime.getTime();
            var _local_5:Number = (_local_3 - _local_7);
            var _local_4:Number = (_local_5 / 60000);
            _local_4 = (_local_4 + _arg_2);
            return (_local_4);
        }

        private function populateEventCategories():void
        {
            if (window == null)
            {
                return;
            };
            _SafeStr_4957 = (window.findChildByName("categories_list") as _SafeStr_3269);
            var _local_2:Array = [];
            for each (var _local_1:_SafeStr_1551 in _catalog.navigator.visibleEventCategories)
            {
                _local_2.push((("${navigator.searchcode.title.eventcategory__" + _local_1.categoryId) + "}"));
            };
            _SafeStr_4957.populate(_local_2);
            _SafeStr_4957.selection = 0;
            _SafeStr_4957.addEventListener("WE_SELECTED", onEventCategoryMenuEvent);
        }

        private function onRoomInitialized(_arg_1:RoomEngineEvent):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            setDefaultRoom(_arg_1.roomId, false);
        }

        private function setDefaultRoom(_arg_1:int, _arg_2:Boolean=false):void
        {
            var _local_6:int;
            var _local_3:* = null;
            var _local_9:* = null;
            var _local_7:* = null;
            if (window == null)
            {
                return;
            };
            var _local_8:_SafeStr_3269 = (window.findChildByName("room_drop_menu") as _SafeStr_3269);
            if (_rooms == null)
            {
                if (_local_8.numMenuItems > 0)
                {
                    _local_8.selection = 0;
                };
                return;
            };
            var _local_5:int;
            var _local_4:Array = [];
            _local_6 = 0;
            while (_local_6 < _rooms.length)
            {
                _local_3 = (_rooms[_local_6] as _SafeStr_1571);
                if (_arg_2)
                {
                    if (_local_3.roomName.length > 25)
                    {
                        _local_9 = (_local_3.roomName.substr(0, 25) + "...");
                        _local_4.push(_local_9);
                    }
                    else
                    {
                        _local_4.push(_local_3.roomName);
                    };
                };
                if (_local_3.roomId == _arg_1)
                {
                    _local_5 = _local_6;
                };
                _local_6++;
            };
            if (_arg_2)
            {
                if (_local_4.length == 0)
                {
                    _local_4.push(_catalog.localization.getLocalization("roomad.no.available.room", "roomad.no.available.room"));
                };
                _local_8.populate(_local_4);
            };
            var _local_10:_SafeStr_1571 = (_rooms[_local_5] as _SafeStr_1571);
            if (_local_10 != null)
            {
                _local_8.selection = _local_5;
                _local_7 = _catalog.roomAdPurchaseData;
                if (_local_7 == null)
                {
                    _local_7 = new RoomAdPurchaseData();
                    _catalog.roomAdPurchaseData = _local_7;
                };
                _local_7.flatId = _local_10.roomId;
            }
            else
            {
                _local_8.selection = 0;
            };
        }

        private function setExtendData():void
        {
            var _local_1:* = null;
            var _local_2:RoomAdPurchaseData = _catalog.roomAdPurchaseData;
            if (((!(_local_2 == null)) && (_local_2.extended)))
            {
                window.findChildByName("name_input_text").caption = _local_2.name;
                window.findChildByName("desc_input_text").caption = _local_2.description;
                _local_1 = new _SafeStr_1571(_local_2.flatId, _local_2.roomName, false);
                if (_rooms != null)
                {
                    _rooms.push(_local_1);
                };
                if (_SafeStr_4957 == null)
                {
                    _SafeStr_4957 = (window.findChildByName("categories_list") as _SafeStr_3269);
                };
                _SafeStr_4957.selection = (_local_2.categoryId - 1);
            };
        }

        public function onPurchaseInfoEvent(_arg_1:IMessageEvent):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            if (((!(window)) || (window.disposed)))
            {
                return;
            };
            var _local_7:_SafeStr_570 = (_arg_1 as _SafeStr_570);
            var _local_3:_SafeStr_1286 = _local_7.getParser();
            var _local_6:_SafeStr_3269 = (window.findChildByName("room_drop_menu") as _SafeStr_3269);
            _rooms = _local_3.rooms;
            _SafeStr_6855 = _local_3.isVip;
            var _local_8:int = _catalog.roomEngine.activeRoomId;
            setExtendData();
            populateEventCategories();
            setDefaultRoom(_local_8, true);
            var _local_2:_SafeStr_3141 = selectedOffer();
            if (_local_2 != null)
            {
                events.dispatchEvent(new SelectProductEvent(_local_2));
                _local_5 = _catalog.roomAdPurchaseData;
                if (_local_5 == null)
                {
                    _local_5 = new RoomAdPurchaseData();
                    _catalog.roomAdPurchaseData = _local_5;
                };
                _local_5.offerId = _local_2.offerId;
                _catalog.roomAdPurchaseData = _local_5;
                _local_4 = (window.findChildByName("price_container") as _SafeStr_3133);
                _catalog.utils.showPriceInContainer(_local_4, _local_2);
            };
        }

        private function onPurchaseConfirmationEvent(_arg_1:CatalogWidgetEvent):void
        {
            _catalog.getRoomAdsPurchaseInfo();
            window.findChildByName("name_input_text").caption = "";
            window.findChildByName("desc_input_text").caption = "";
            if (_catalog.roomAdPurchaseData)
            {
                _catalog.roomAdPurchaseData.clear();
            };
        }

        private function onNameWindowEvent(_arg_1:_SafeStr_3116):void
        {
            var _local_3:ITextFieldWindow = (_arg_1.target as ITextFieldWindow);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:RoomAdPurchaseData = _catalog.roomAdPurchaseData;
            if (_local_2 != null)
            {
                _local_2.name = _local_3.text;
            };
        }

        private function onDescWindowEvent(_arg_1:_SafeStr_3116):void
        {
            var _local_3:ITextFieldWindow = (_arg_1.target as ITextFieldWindow);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:RoomAdPurchaseData = _catalog.roomAdPurchaseData;
            if (_local_2 != null)
            {
                _local_2.description = _local_3.text;
            };
        }

        private function onRoomDropMenuEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:int;
            var _local_7:* = null;
            var _local_8:* = null;
            if (((_arg_1.type == "WE_SELECTED") && (_rooms.length > 0)))
            {
                _local_5 = _SafeStr_3269(_arg_2).selection;
                _local_4 = (_rooms[_local_5] as _SafeStr_1571);
                _local_6 = _catalog.roomAdPurchaseData;
                if (_local_6)
                {
                    _local_6.flatId = _local_4.roomId;
                    _local_3 = _catalog.getInteger("room_ad.duration.minutes", 120);
                    if (_local_4.roomId == _local_6.extendedFlatId)
                    {
                        _local_3 = getExtensionMinutes(_local_6, _local_3);
                    };
                    _local_7 = window.findChildByName("ctlg_text_1");
                    _local_7.caption = "${roomad.catalog_text}";
                    _catalog.localization.registerParameter("roomad.catalog_text", "duration", _local_3);
                    _local_8 = _catalog.localization.getLocalization("roomad.catalog_text");
                    _local_7.caption = _local_8;
                };
            };
        }

        private function onEventCategoryMenuEvent(_arg_1:_SafeStr_3116):void
        {
            var _local_3:int;
            var _local_5:int = -1;
            var _local_6:int = _SafeStr_4957.selection;
            for each (var _local_2:_SafeStr_1551 in _catalog.navigator.visibleEventCategories)
            {
                if (_local_2.visible)
                {
                    if (_local_6 == _local_3)
                    {
                        _local_5 = _local_2.categoryId;
                        break;
                    };
                    _local_3++;
                };
            };
            var _local_4:RoomAdPurchaseData = _catalog.roomAdPurchaseData;
            if (_local_4)
            {
                _local_4.categoryId = _local_5;
            };
        }

        private function selectedOffer():_SafeStr_3141
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:Vector.<_SafeStr_3141> = page.offers;
            if (((!(_local_1 == null)) && (_local_1)))
            {
                if (_local_1.length == 1)
                {
                    return (_local_1[0]);
                };
                _local_3 = 0;
                while (_local_3 < _local_1.length)
                {
                    _local_2 = (_local_1[_local_3] as Offer);
                    if ((((_local_2.clubLevel == 2) && (_SafeStr_6855)) || ((!(_local_2.clubLevel == 2)) && (!(_SafeStr_6855)))))
                    {
                        return (_local_2);
                    };
                    _local_3++;
                };
            };
            return (null);
        }

        override public function dispose():void
        {
            var _local_1:* = null;
            super.dispose();
            if (_catalog != null)
            {
                _local_1 = _catalog.connection;
                if (_SafeStr_6854 != null)
                {
                    _local_1.removeMessageEvent(_SafeStr_6854);
                    _SafeStr_6854 = null;
                };
                _catalog.roomEngine.events.removeEventListener("REE_INITIALIZED", onRoomInitialized);
                _catalog = null;
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_1286 = "_-y1D" (String#33337, DoABC#4)
// _SafeStr_1551 = "_-J1A" (String#15646, DoABC#4)
// _SafeStr_1571 = "_-r1" (String#4597, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_4957 = "_-zN" (String#4171, DoABC#4)
// _SafeStr_570 = "_-C1n" (String#18470, DoABC#4)
// _SafeStr_6854 = "_-B" (String#8046, DoABC#4)
// _SafeStr_6855 = "_-n1B" (String#15529, DoABC#4)


