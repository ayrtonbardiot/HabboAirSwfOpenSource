// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.UnseenItemTracker

package com.sulake.habbo.inventory
{
    import com.sulake.habbo.communication._SafeStr_25;
    import flash.utils.Dictionary;
    import flash.events.IEventDispatcher;
    import _-EK._SafeStr_524;
    import _-28._SafeStr_1490;
    import com.sulake.habbo.inventory.enum._SafeStr_3129;
    import com.sulake.habbo.inventory.events.HabboUnseenItemsUpdatedEvent;
    import _-u19._SafeStr_526;
    import _-u19._SafeStr_200;

    public class UnseenItemTracker implements _SafeStr_3184 
    {

        private var _communication:_SafeStr_25;
        private var _inventory:HabboInventory;
        private var _unseenItems:Dictionary;
        private var _SafeStr_3983:IEventDispatcher;

        public function UnseenItemTracker(_arg_1:_SafeStr_25, _arg_2:IEventDispatcher, _arg_3:HabboInventory)
        {
            _communication = _arg_1;
            _inventory = _arg_3;
            _SafeStr_3983 = _arg_2;
            _unseenItems = new Dictionary();
            _communication.addHabboConnectionMessageEvent(new _SafeStr_524(onUnseenItems));
        }

        public function dispose():void
        {
            _communication = null;
            _unseenItems = null;
        }

        public function resetCategory(_arg_1:int):Boolean
        {
            if (getCount(_arg_1) == 0)
            {
                return (false);
            };
            delete _unseenItems[_arg_1];
            sendResetCategoryMessage(_arg_1);
            sendUpdateEvent();
            return (true);
        }

        public function resetItems(_arg_1:int, _arg_2:Array):Boolean
        {
            if (getCount(_arg_1) == 0)
            {
                return (false);
            };
            var _local_4:Array = _unseenItems[_arg_1];
            for each (var _local_3:int in _arg_2)
            {
                _local_4.splice(_local_4.indexOf(_local_3), 1);
            };
            sendResetItemsMessage(_arg_1, _arg_2);
            sendUpdateEvent();
            return (true);
        }

        public function resetCategoryIfEmpty(_arg_1:int):Boolean
        {
            if (getCount(_arg_1) == 0)
            {
                delete _unseenItems[_arg_1];
                sendResetCategoryMessage(_arg_1);
                sendUpdateEvent();
                return (true);
            };
            return (false);
        }

        public function isUnseen(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:* = null;
            if (_unseenItems[_arg_1] != null)
            {
                _local_3 = _unseenItems[_arg_1];
                return (_local_3.indexOf(_arg_2) >= 0);
            };
            return (false);
        }

        public function removeUnseen(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:* = null;
            var _local_4:int;
            if (_unseenItems[_arg_1] != null)
            {
                _local_3 = _unseenItems[_arg_1];
                _local_4 = _local_3.indexOf(_arg_2);
                if (_local_4 >= 0)
                {
                    _local_3.splice(_local_4, 1);
                    sendUpdateEvent();
                    return (true);
                };
            };
            return (false);
        }

        public function getIds(_arg_1:int):Array
        {
            if (_unseenItems[_arg_1] != null)
            {
                return (_unseenItems[_arg_1]);
            };
            return ([]);
        }

        public function getCount(_arg_1:int):int
        {
            if (_unseenItems[_arg_1] != null)
            {
                return ((_unseenItems[_arg_1] as Array).length);
            };
            return (0);
        }

        private function onUnseenItems(_arg_1:_SafeStr_524):void
        {
            var _local_2:Boolean;
            var _local_5:* = null;
            var _local_3:_SafeStr_1490 = _arg_1.getParser();
            for each (var _local_4:int in _local_3.getCategories())
            {
                _local_5 = _local_3.getItemsByCategory(_local_4);
                addItems(_local_4, _local_5);
                if (_SafeStr_3129.INVENTORY_CATEGORIES.indexOf(_local_4) >= 0)
                {
                    _local_2 = true;
                };
            };
            if (_inventory.isInitialized)
            {
                _inventory.updateUnseenItemCounts();
                _inventory.furniModel.updateUnseenItemsThumbs();
                _inventory.petsModel.updateView();
                _inventory.botsModel.updateView();
            };
            sendUpdateEvent();
        }

        private function sendUpdateEvent():void
        {
            var _local_2:int;
            var _local_1:HabboUnseenItemsUpdatedEvent = new HabboUnseenItemsUpdatedEvent();
            var _local_3:Array = _SafeStr_3129.INVENTORY_CATEGORIES;
            for each (var _local_4:int in _local_3)
            {
                _local_2 = getCount(_local_4);
                _local_1.setCategoryCount(_local_4, _local_2);
                if (_SafeStr_3129.INVENTORY_CATEGORIES.indexOf(_local_4) >= 0)
                {
                    _local_1.inventoryCount = (_local_1.inventoryCount + _local_2);
                };
            };
            _SafeStr_3983.dispatchEvent(_local_1);
        }

        private function addItems(_arg_1:int, _arg_2:Array):void
        {
            var _local_3:* = null;
            var _local_4:int;
            if (_arg_2 == null)
            {
                return;
            };
            if (_unseenItems[_arg_1] == null)
            {
                _local_3 = [];
                _unseenItems[_arg_1] = _local_3;
            };
            _local_3 = _unseenItems[_arg_1];
            for each (var _local_5:int in _arg_2)
            {
                _local_4 = _local_3.indexOf(_local_5);
                if (_local_4 == -1)
                {
                    _local_3.push(_local_5);
                };
            };
        }

        private function sendResetCategoryMessage(_arg_1:int):void
        {
            _communication.connection.send(new _SafeStr_526(_arg_1));
        }

        private function sendResetItemsMessage(_arg_1:int, _arg_2:Array):void
        {
            _communication.connection.send(new _SafeStr_200(_arg_1, _arg_2));
        }


    }
}//package com.sulake.habbo.inventory

// _SafeStr_1490 = "_-318" (String#32665, DoABC#4)
// _SafeStr_200 = "_-H1C" (String#30529, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3129 = "_-m1w" (String#13751, DoABC#4)
// _SafeStr_3184 = "_-V1C" (String#10342, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_524 = "_-y1X" (String#23540, DoABC#4)
// _SafeStr_526 = "_-Z16" (String#31197, DoABC#4)


