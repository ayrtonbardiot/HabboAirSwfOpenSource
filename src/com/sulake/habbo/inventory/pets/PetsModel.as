// by nota

//com.sulake.habbo.inventory.pets.PetsModel

package com.sulake.habbo.inventory.pets
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.communication.connection.IConnection;
    import _-u15._SafeStr_904;
    import _-Zz._SafeStr_1573;
    import flash.events.Event;
    import com.sulake.core.window._SafeStr_3133;
    import _-j1G._SafeStr_712;
    import com.sulake.habbo.session.IRoomSession;

    public class PetsModel implements IInventoryModel 
    {

        private var _SafeStr_4360:HabboInventory;
        private var _SafeStr_3882:PetsView;
        private var _assets:IAssetLibrary;
        private var _communication:IHabboCommunicationManager;
        private var _roomEngine:IRoomEngine;
        private var _catalog:IHabboCatalog;
        private var _SafeStr_4271:_SafeStr_24;
        private var _SafeStr_5012:Boolean = false;
        private var _disposed:Boolean = false;
        private var _SafeStr_4365:Boolean;

        public function PetsModel(_arg_1:HabboInventory, _arg_2:_SafeStr_1695, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine, _arg_6:IHabboCatalog)
        {
            _SafeStr_4360 = _arg_1;
            _assets = _arg_4;
            _communication = _arg_3;
            _roomEngine = _arg_5;
            _roomEngine.events.addEventListener("REOE_PLACED", onObjectPlaced);
            _catalog = _arg_6;
            _SafeStr_4271 = new _SafeStr_24();
            _SafeStr_3882 = new PetsView(this, _arg_2, _arg_4, _arg_5);
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
                if (_SafeStr_4271)
                {
                    _SafeStr_4271.dispose();
                    _SafeStr_4271 = null;
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

        public function requestPetInventory():void
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
            _local_1.send(new _SafeStr_904());
        }

        public function get pets():_SafeStr_24
        {
            return (_SafeStr_4271);
        }

        public function addPet(_arg_1:_SafeStr_1573):void
        {
            if (_SafeStr_4271.add(_arg_1.id, _arg_1))
            {
                _SafeStr_3882.addPet(_arg_1);
            };
            _SafeStr_3882.updateState();
        }

        public function updatePets(_arg_1:_SafeStr_24):void
        {
            var _local_3:int;
            var _local_2:Array = _arg_1.getKeys();
            var _local_4:Array = _SafeStr_4271.getKeys();
            _SafeStr_4360.setInventoryCategoryInit("pets");
            for each (_local_3 in _local_4)
            {
                if (_local_2.indexOf(_local_3) == -1)
                {
                    _SafeStr_4271.remove(_local_3);
                    _SafeStr_3882.removePet(_local_3);
                };
            };
            for each (_local_3 in _local_2)
            {
                if (_local_4.indexOf(_local_3) == -1)
                {
                    _SafeStr_4271.add(_local_3, _arg_1.getValue(_local_3));
                    _SafeStr_3882.addPet(_arg_1.getValue(_local_3));
                };
            };
            setListInitialized();
        }

        public function removePet(_arg_1:int):void
        {
            _SafeStr_4271.remove(_arg_1);
            _SafeStr_3882.removePet(_arg_1);
            _SafeStr_3882.updateState();
        }

        public function requestInitialization():void
        {
            requestPetInventory();
        }

        public function categorySwitch(_arg_1:String):void
        {
            if (((_arg_1 == "pets") && (_SafeStr_4360.isVisible)))
            {
                _SafeStr_4360.events.dispatchEvent(new Event("HABBO_INVENTORY_TRACKING_EVENT_PETS"));
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

        public function placePetToRoom(_arg_1:int, _arg_2:Boolean=false):Boolean
        {
            var _local_4:int;
            var _local_5:_SafeStr_1573 = getPetById(_arg_1);
            if (_local_5 == null)
            {
                return (false);
            };
            var _local_3:String;
            if (_local_5.typeId == 16)
            {
                if (_local_5.level >= 7)
                {
                    _local_3 = "std";
                }
                else
                {
                    _local_3 = ("grw" + _local_5.level);
                };
            };
            if (_SafeStr_4360.roomSession.isRoomOwner)
            {
                _local_4 = (_local_5.id * -1);
                _SafeStr_5012 = _roomEngine.initializeRoomObjectInsert("inventory", _local_4, 100, 2, _local_5.figureString, null, -1, -1, _local_3);
                _SafeStr_4360.closeView();
                return (_SafeStr_5012);
            };
            if (!_SafeStr_4360.roomSession.arePetsAllowed)
            {
                return (false);
            };
            if (!_arg_2)
            {
                _communication.connection.send(new _SafeStr_712(_local_5.id, 0, 0));
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

        private function getPetById(_arg_1:int):_SafeStr_1573
        {
            for each (var _local_2:_SafeStr_1573 in _SafeStr_4271)
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

        public function updatePetsAllowed():void
        {
            _SafeStr_3882.update();
        }

        public function resetUnseenItems():void
        {
            _SafeStr_4360.unseenItemTracker.resetCategory(3);
            _SafeStr_4360.updateUnseenItemCounts();
            _SafeStr_3882.update();
        }

        public function isUnseen(_arg_1:int):Boolean
        {
            return (_SafeStr_4360.unseenItemTracker.isUnseen(3, _arg_1));
        }

        public function removeUnseenFurniCounter(_arg_1:int):Boolean
        {
            var _local_2:Boolean;
            if (isUnseen(_arg_1))
            {
                _local_2 = _SafeStr_4360.unseenItemTracker.removeUnseen(3, _arg_1);
                if (_local_2)
                {
                    _SafeStr_4360.unseenItemTracker.resetCategoryIfEmpty(3);
                };
            };
            return (_local_2);
        }

        public function selectItemById(_arg_1:String):void
        {
            _SafeStr_3882.selectById(int(_arg_1));
        }


    }
}//package com.sulake.habbo.inventory.pets

// _SafeStr_1573 = "_-iW" (String#6355, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4271 = "_-H1Y" (String#2974, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4365 = "_-Z1B" (String#5626, DoABC#4)
// _SafeStr_5012 = "_-k1W" (String#5533, DoABC#4)
// _SafeStr_712 = "_-lr" (String#18191, DoABC#4)
// _SafeStr_904 = "_-x12" (String#30106, DoABC#4)


