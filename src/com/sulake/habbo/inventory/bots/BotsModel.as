// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.bots.BotsModel

package com.sulake.habbo.inventory.bots
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.core.communication.connection.IConnection;
    import _-OR._SafeStr_957;
    import _-Lc._SafeStr_1620;
    import flash.events.Event;
    import com.sulake.core.window._SafeStr_3133;
    import _-j1G._SafeStr_1031;
    import com.sulake.habbo.session.IRoomSession;

    public class BotsModel implements IInventoryModel 
    {

        private var _SafeStr_4360:HabboInventory;
        private var _SafeStr_3882:BotsView;
        private var _assets:_SafeStr_21;
        private var _communication:_SafeStr_25;
        private var _roomEngine:IRoomEngine;
        private var _catalog:IHabboCatalog;
        private var _items:_SafeStr_24;
        private var _SafeStr_5012:Boolean = false;
        private var _disposed:Boolean = false;
        private var _SafeStr_4365:Boolean;

        public function BotsModel(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_25, _arg_4:_SafeStr_21, _arg_5:IRoomEngine, _arg_6:IHabboCatalog, _arg_7:_SafeStr_1701)
        {
            _SafeStr_4360 = _arg_1;
            _assets = _arg_4;
            _communication = _arg_3;
            _roomEngine = _arg_5;
            _roomEngine.events.addEventListener("REOE_PLACED", onObjectPlaced);
            _catalog = _arg_6;
            _items = new _SafeStr_24();
            _SafeStr_3882 = new BotsView(this, _arg_2, _arg_4, _arg_5, _arg_7);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_3882)
                {
                    _SafeStr_3882.dispose();
                    _SafeStr_3882 = null;
                };
                if (_roomEngine)
                {
                    if (_roomEngine.events)
                    {
                        _roomEngine.events.removeEventListener("REOE_PLACED", onObjectPlaced);
                    };
                    _roomEngine = null;
                };
                if (_items)
                {
                    _items.dispose();
                    _items = null;
                };
                _SafeStr_4360 = null;
                _catalog = null;
                _assets = null;
                _communication = null;
                _disposed = true;
            };
        }

        public function get controller():HabboInventory
        {
            return (_SafeStr_4360);
        }

        public function isListInitialized():Boolean
        {
            return (_SafeStr_4365);
        }

        public function setListInitialized():void
        {
            _SafeStr_4365 = true;
            _SafeStr_3882.updateState();
        }

        public function requestInventory():void
        {
            if (_communication == null)
            {
                return;
            };
            var _local_1:IConnection = _communication.connection;
            if (_local_1 == null)
            {
                return;
            };
            _local_1.send(new _SafeStr_957());
        }

        public function get items():_SafeStr_24
        {
            return (_items);
        }

        public function addItem(_arg_1:_SafeStr_1620):void
        {
            if (_items.add(_arg_1.id, _arg_1))
            {
                _SafeStr_3882.addItem(_arg_1);
            };
            _SafeStr_3882.updateState();
        }

        public function updateItems(_arg_1:_SafeStr_24):void
        {
            var _local_3:int;
            var _local_2:Array = _arg_1.getKeys();
            var _local_4:Array = _items.getKeys();
            for each (_local_3 in _local_4)
            {
                if (_local_2.indexOf(_local_3) == -1)
                {
                    _items.remove(_local_3);
                    _SafeStr_3882.removeItem(_local_3);
                };
            };
            for each (_local_3 in _local_2)
            {
                if (_local_4.indexOf(_local_3) == -1)
                {
                    _items.add(_local_3, _arg_1.getValue(_local_3));
                    _SafeStr_3882.addItem(_arg_1.getValue(_local_3));
                };
            };
        }

        public function removeItem(_arg_1:int):void
        {
            _items.remove(_arg_1);
            _SafeStr_3882.removeItem(_arg_1);
            _SafeStr_3882.updateState();
        }

        public function requestInitialization():void
        {
            requestInventory();
        }

        public function categorySwitch(_arg_1:String):void
        {
            if (((_arg_1 == "bots") && (_SafeStr_4360.isVisible)))
            {
                _SafeStr_4360.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_BOTS"));
            };
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return (_SafeStr_3882.getWindowContainer());
        }

        public function closingInventoryView():void
        {
            if (_SafeStr_3882.isVisible)
            {
                resetUnseenItems();
            };
        }

        public function subCategorySwitch(_arg_1:String):void
        {
        }

        public function placeItemToRoom(_arg_1:int, _arg_2:Boolean=false):Boolean
        {
            var _local_4:int;
            var _local_3:_SafeStr_1620 = getItemById(_arg_1);
            if (_local_3 == null)
            {
                return (false);
            };
            if (!_SafeStr_4360.roomSession.areBotsAllowed)
            {
                return (false);
            };
            if (_SafeStr_4360.roomSession.isRoomOwner)
            {
                _local_4 = (_local_3.id * -1);
                _SafeStr_5012 = _roomEngine.initializeRoomObjectInsert("inventory", _local_4, 100, 4, _local_3.figure);
                _SafeStr_4360.closeView();
                return (_SafeStr_5012);
            };
            if (!_arg_2)
            {
                _communication.connection.send(new _SafeStr_1031(_local_3.id, 0, 0));
            };
            return (true);
        }

        public function updateView():void
        {
            if (_SafeStr_3882 == null)
            {
                return;
            };
            _SafeStr_3882.update();
        }

        private function getItemById(_arg_1:int):_SafeStr_1620
        {
            for each (var _local_2:_SafeStr_1620 in _items)
            {
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function onObjectPlaced(_arg_1:Event):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            if (((_SafeStr_5012) && (_arg_1.type == "REOE_PLACED")))
            {
                _SafeStr_4360.showView();
                _SafeStr_5012 = false;
            };
        }

        public function get roomSession():IRoomSession
        {
            return (_SafeStr_4360.roomSession);
        }

        public function resetUnseenItems():void
        {
            _SafeStr_4360.unseenItemTracker.resetCategory(5);
            _SafeStr_4360.updateUnseenItemCounts();
            _SafeStr_3882.update();
        }

        public function isUnseen(_arg_1:int):Boolean
        {
            return (_SafeStr_4360.unseenItemTracker.isUnseen(5, _arg_1));
        }

        public function selectItemById(_arg_1:String):void
        {
            _SafeStr_3882.selectById(int(_arg_1));
        }


    }
}//package com.sulake.habbo.inventory.bots

// _SafeStr_1031 = "_-v1y" (String#20428, DoABC#4)
// _SafeStr_1620 = "_-V1f" (String#6472, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4365 = "_-Z1B" (String#5626, DoABC#4)
// _SafeStr_5012 = "_-k1W" (String#5533, DoABC#4)
// _SafeStr_957 = "_-wg" (String#31201, DoABC#4)


